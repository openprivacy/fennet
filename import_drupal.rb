#!/usr/bin/env ruby
require 'mysql2'
require 'fileutils'
require 'yaml'

# -----------------------------------------------------------------------------
# Configuration
# -----------------------------------------------------------------------------
DB_HOST = "localhost"
DB_NAME = "drupal"
DB_USER = "root"
DB_PASS = "root"

# Output directories
BLOG_DIR  = "_posts"
QUOTE_DIR = "_quotes"
AUTHOR_FILE = "_data/authors.yml"

# -----------------------------------------------------------------------------
# Setup
# -----------------------------------------------------------------------------
FileUtils.mkdir_p(BLOG_DIR)
FileUtils.mkdir_p(QUOTE_DIR)
FileUtils.mkdir_p(File.dirname(AUTHOR_FILE))

client = Mysql2::Client.new(
  host: DB_HOST,
  username: DB_USER,
  password: DB_PASS,
  database: DB_NAME,
  encoding: 'utf8mb4'
)

puts "Connected to database '#{DB_NAME}'"

# -----------------------------------------------------------------------------
# Load authors
# -----------------------------------------------------------------------------
authors = {}
res = client.query("SELECT aid, name, bio FROM quotes_authors")

res.each do |row|
  key = row["name"].downcase.strip.gsub(/[^a-z0-9]+/, "-")
  authors[row["aid"]] = {
    "name" => row["name"],
    "bio"  => row["bio"] || "",
    "slug" => key
  }
end

# Save authors to _data/authors.yml
File.open(AUTHOR_FILE, "w") { |f| f.write(authors.values.to_yaml) }
puts "Saved #{authors.size} authors to #{AUTHOR_FILE}"

# -----------------------------------------------------------------------------
# Import blog posts
# -----------------------------------------------------------------------------
puts "\nImporting blog posts..."

blog_query = <<~SQL
  SELECT n.nid, n.title, FROM_UNIXTIME(n.created) AS created,
         r.body, r.teaser
  FROM node n
  LEFT JOIN node_revisions r ON n.vid = r.vid
  WHERE n.type = 'blog'
SQL

client.query(blog_query).each do |row|
  date = row["created"].strftime("%Y-%m-%d")
  slug = row["title"].downcase.strip.gsub(/[^a-z0-9]+/, "-")
  filename = "#{BLOG_DIR}/#{date}-#{slug}.md"

  front_matter = {
    "layout"     => "blog",
    "title"      => row["title"],
    "date"       => row["created"],
    "categories" => ["blog"],
    "permalink"  => "/blog/#{row["created"].strftime('%Y/%m/%d')}/#{slug}/",
    "excerpt"    => row["teaser"]
  }

  content = <<~MARKDOWN
    #{front_matter.to_yaml.strip}
    ---

    #{row["body"]}
  MARKDOWN

  File.write(filename, content)
  puts "✓ #{filename}"
end

# -----------------------------------------------------------------------------
# Import quotes
# -----------------------------------------------------------------------------
puts "\nImporting quotes..."

# 1️⃣ Build category lookup for nodes
categories_by_nid = {}
cat_query = <<~SQL
  SELECT tn.nid, td.name
  FROM term_node tn
  JOIN term_data td ON tn.tid = td.tid
SQL

client.query(cat_query).each do |row|
  categories_by_nid[row["nid"]] ||= []
  categories_by_nid[row["nid"]] << row["name"].downcase.strip
end

# 2️⃣ Fetch quotes with body text
quote_query = <<~SQL
  SELECT q.nid, q.citation, q.aid, n.title, FROM_UNIXTIME(n.created) AS created, r.body
  FROM quotes q
  JOIN node n ON q.nid = n.nid
  LEFT JOIN node_revisions r ON n.vid = r.vid
SQL

client.query(quote_query).each do |row|
  author = authors[row["aid"]] || {}
  slug = row["title"].downcase.strip.gsub(/[^a-z0-9]+/, "-")
  date = row["created"].strftime("%Y-%m-%d")
  filename = "#{QUOTE_DIR}/#{slug}.md"

  # Clean text fields
  quote_text = (row["body"] || "").strip
  citation_text = (row["citation"] || "").strip
  categories = (categories_by_nid[row["nid"]] || []) + ["quotes"]

  # Build front matter
  front_matter = {
    "layout"     => "quote",
    "title"      => row["title"],
    "author"     => author["name"],
    "categories" => categories.uniq,
    "permalink"  => "/quotes/#{slug}/"
  }

  # Add citation to front matter if present
  front_matter["citation"] = citation_text unless citation_text.empty?

  # Build Markdown file content
  content = <<~MARKDOWN
    #{front_matter.to_yaml.strip}
    ---

    #{quote_text}
  MARKDOWN

  # Write file
  File.write(filename, content)
  puts "✓ #{filename}"
end

puts "\n✅ Import complete!"
