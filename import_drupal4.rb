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
FileUtils.mkdir_p("_data")

# ----------------------------------------
# HELPER: SAFE FILENAME
# ----------------------------------------
def slugify(title)
  title.downcase.strip.gsub(/[^a-z0-9]+/, "-").gsub(/^-|-$/, "")
end

# ----------------------------------------
# HELPER: GET URL ALIAS FOR A NODE
# ----------------------------------------
def get_alias(client, nid)
  result = client.query("SELECT dst FROM url_alias WHERE src = 'node/#{nid}' LIMIT 1")
  row = result.first
  row ? row["dst"] : nil
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

  # Get the Drupal URL alias (e.g. "blog/2020/09/28/proposal-congressional-security-clearances")
  alias_path = get_alias(client, post["nid"])

  if alias_path && alias_path.start_with?("blog/")
    # Parse date and slug from alias: blog/YYYY/MM/DD/slug
    parts = alias_path.sub("blog/", "").split("/", 4)
    if parts.length == 4
      date = "#{parts[0]}-#{parts[1]}-#{parts[2]}"
      slug = parts[3]
    else
      # Fallback: use alias slug but derive date from timestamp
      date = Time.at(post["created"]).strftime("%Y-%m-%d")
      slug = parts.last || slugify(post["title"])
    end
    permalink = "/#{alias_path}/"
  else
    # No alias found — fall back to generated slug
    date = Time.at(post["created"]).strftime("%Y-%m-%d")
    slug = slugify(post["title"])
    permalink = "/blog/#{date.gsub('-', '/')}/#{slug}/"
  end

  filename = "_posts/#{date}-#{slug}.md"

  front_matter = {
    "layout" => "blog",
    "title" => post["title"],
    "date" => Time.at(post["created"]),
    "teaser" => post["teaser"],
    "categories" => cat_list,
    "permalink" => permalink,
    "drupal_nid" => post["nid"]
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

# Collect all authors for _data/authors.yml
all_authors = {}

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
  # Get the Drupal URL alias (e.g. "quotes/peace/all-wars-are-fought")
  alias_path = get_alias(client, q["nid"])

  if alias_path && alias_path.start_with?("quotes/")
    # Use alias path as permalink
    permalink = "/#{alias_path}/"
    # Extract slug from alias (last segment)
    slug = alias_path.split("/").last
  else
    slug = slugify(q["title"])
    permalink = "/quotes/#{slug}/"
  end

  # Get taxonomy tags for quotes
  tags_result = client.query(<<~SQL)
    SELECT td.name
    FROM term_node tn
    JOIN term_data td ON tn.tid = td.tid
    WHERE tn.nid = #{q["nid"]}
  SQL
  tag_list = tags_result.map { |r| r["name"] }

  date = Time.at(q["created"]).strftime("%Y-%m-%d")
  filename = "_quotes/#{date}-#{slug}.md"

  front_matter = {
    "layout" => "quote",
    "title" => q["title"],
    "author" => q["author"],
    "author_bio" => q["author_bio"],
    "date" => Time.at(q["created"]),
    "permalink" => permalink,
    "tags" => tag_list,
    "drupal_nid" => q["nid"]
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

  # Collect author info
  author_name = q["author"].to_s.strip
  unless author_name.empty?
    all_authors[author_name] ||= {
      "name" => author_name,
      "bio" => q["author_bio"].to_s.strip,
      "slug" => slugify(author_name)
    }
  end
end

# Write authors data file
authors_list = all_authors.values.sort_by { |a| a["name"].downcase }
File.open("_data/authors.yml", "w") do |f|
  f.puts authors_list.to_yaml
end

puts "Quotes imported."
puts "Authors data written to _data/authors.yml"
puts "Done."
