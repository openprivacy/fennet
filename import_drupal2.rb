#!/usr/bin/env ruby
require "mysql2"
require "yaml"
require "fileutils"

DB = {
  host: "localhost",
  username: "root",
  password: "root",
  database: "drupal"
}

# Output folders
BLOG_DIR  = "_posts"
QUOTE_DIR = "_quotes"

FileUtils.mkdir_p BLOG_DIR
FileUtils.mkdir_p QUOTE_DIR

client = Mysql2::Client.new(DB)

#
# Load category terms
#
categories_by_nid = Hash.new { |h, k| h[k] = [] }

term_sql = <<~SQL
  SELECT tn.nid, td.name
  FROM term_node tn
  JOIN term_data td ON tn.tid = td.tid
SQL

client.query(term_sql).each do |row|
  categories_by_nid[row["nid"]] << row["name"].downcase.strip
end

#
# -------------------------------------------------------------
#  IMPORT BLOG POSTS
# -------------------------------------------------------------
#

puts "\n=== Importing blog posts ==="

blog_sql = <<~SQL
  SELECT n.nid, n.title, n.created,
         r.body, r.teaser, n.vid
  FROM node n
  JOIN node_revisions r ON n.vid = r.vid
  WHERE n.type = 'blog'
  ORDER BY n.created ASC
SQL

client.query(blog_sql).each do |row|
  nid  = row["nid"]
  date = Time.at(row["created"].to_i)

  slug = row["title"]
           .downcase
           .strip
           .gsub(/[^a-z0-9]+/, "-")
           .gsub(/^-|-$/, "")

  filename = "#{BLOG_DIR}/#{date.strftime("%Y-%m-%d")}-#{slug}.md"

  front_matter = {
    "layout"     => "blog",
    "title"      => row["title"],
    "date"       => date,
    "categories" => (categories_by_nid[nid] + ["blog"]).uniq,
    "permalink"  => "/blog/#{date.strftime("%Y/%m/%d")}/#{slug}/",
    "teaser"     => row["teaser"]
  }

  content = <<~MD
  ---
  #{front_matter.to_yaml.strip}
  ---

  #{row["body"]}
  MD

  File.write(filename, content)
  puts "✓ Blog: #{filename}"
end

#
# -------------------------------------------------------------
#  IMPORT QUOTES
# -------------------------------------------------------------
#

puts "\n=== Importing quotes ==="

quotes_sql = <<~SQL
  SELECT q.nid, q.vid, q.aid,
         q.citation,
         a.name AS author,
         a.bio  AS author_bio,
         r.body AS quote_text
  FROM quotes q
  JOIN quotes_authors a ON q.aid = a.aid
  LEFT JOIN node_revisions r ON q.vid = r.vid
  ORDER BY q.nid ASC
SQL

client.query(quotes_sql).each do |row|
  nid   = row["nid"]
  title = row["author"] # used only as slug input

  slug = row["quote_text"]
           .downcase
           .strip
           .gsub(/[^a-z0-9]+/, "-")
           .slice(0, 60)   # keep short
           .gsub(/^-|-$/, "")

  slug = "quote-#{nid}" if slug.nil? || slug == ""

  filename = "#{QUOTE_DIR}/#{slug}.md"

  front_matter = {
    "layout"    => "quote",
    "nid"       => nid,
    "author"    => row["author"],
    "citation"  => row["citation"],
    "categories"=> (categories_by_nid[nid] + ["quote"]).uniq,
    "permalink" => "/quotes/#{slug}/"
  }

  content = <<~MD
  ---
  #{front_matter.to_yaml.strip}
  ---

  #{row["quote_text"]}
  MD

  File.write(filename, content)
  puts "✓ Quote: #{filename}"
end

puts "\n=== Import complete! ==="
