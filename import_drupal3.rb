#!/usr/bin/env ruby
require "mysql2"
require "fileutils"
require "yaml"

# ----------------------------------------
# DB CONNECTION
# ----------------------------------------
client = Mysql2::Client.new(
  host: "localhost",
  username: "root",
  password: "root",
  database: "drupal",
  encoding: "utf8"
)

FileUtils.mkdir_p("_posts")
FileUtils.mkdir_p("_quotes")

# ----------------------------------------
# HELPER: SAFE FILENAME
# ----------------------------------------
def slugify(title)
  title.downcase.strip.gsub(/[^a-z0-9]+/, "-").gsub(/^-|-$/, "")
end

# ----------------------------------------
# IMPORT BLOG POSTS
# ----------------------------------------
puts "Importing blog posts…"

posts = client.query(<<~SQL)
  SELECT n.nid, n.vid, n.title, n.created,
         r.body, r.teaser
  FROM node n
  JOIN node_revisions r ON n.vid = r.vid
  WHERE n.type = 'blog'
SQL

posts.each do |post|
  # Get taxonomy categories
  categories = client.query(<<~SQL, as: :array)
    SELECT td.name
    FROM term_node tn
    JOIN term_data td ON tn.tid = td.tid
    WHERE tn.nid = #{post["nid"]}
  SQL

  cat_list = categories.map(&:first)

  date = Time.at(post["created"]).strftime("%Y-%m-%d")
  slug = slugify(post["title"])

  filename = "_posts/#{date}-#{slug}.md"

  front_matter = {
    "layout" => "blog",
    "title" => post["title"],
    "date" => Time.at(post["created"]),
    "teaser" => post["teaser"],
    "categories" => cat_list,
    "permalink" => "/blog/#{date}/#{slug}/"
  }

  File.open(filename, "w") do |f|
    f.puts front_matter.to_yaml
    f.puts "---"
    f.puts post["body"]
  end
end

puts "Blog posts imported."

# ----------------------------------------
# IMPORT QUOTES
# ----------------------------------------
puts "Importing quotes…"

quotes = client.query(<<~SQL)
  SELECT n.nid, n.vid, n.title, n.created,
         r.body AS quote_text,
         q.citation,
         qa.name AS author,
         qa.bio AS author_bio
  FROM node n
  JOIN node_revisions r ON n.vid = r.vid
  JOIN quotes q ON n.vid = q.vid
  JOIN quotes_authors qa ON q.aid = qa.aid
  WHERE n.type = 'quotes'
SQL

quotes.each do |q|
  date = Time.at(q["created"]).strftime("%Y-%m-%d")
  slug = slugify(q["title"])

  filename = "_quotes/#{date}-#{slug}.md"

  front_matter = {
    "layout" => "quote",
    "title" => q["title"],
    "author" => q["author"],
    "author_bio" => q["author_bio"],
    "date" => Time.at(q["created"]),
    "permalink" => "/quotes/#{slug}/"
  }

  # Only include citation if present
  unless q["citation"].to_s.strip.empty?
    front_matter["citation"] = q["citation"]
  end

  File.open(filename, "w") do |f|
    f.puts front_matter.to_yaml
    f.puts "---"
    f.puts q["quote_text"]
  end
end

puts "Quotes imported."
puts "Done."
