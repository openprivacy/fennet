# Fen Blog — Drupal 6 → Jekyll Migration

This repository contains a static-site version of content migrated from a legacy Drupal 6 database to Jekyll, suitable for deployment on GitHub Pages.
task 
---

## Background

Goal is to convert legacy drupal 6 site with two sections (blog and quotes) to github pages using jekyll. This file has some background, though may not be 100% accurate. Additional modifications of import_drupal* may be required (current site created with `bundle exec ruby import_drupal3.rb`) as well as changes to _config.yml

### Priorities

Fix broken things, get categories, tags, author pages working. Don't need the sidebar, though a clickable list of blog categories / quotes tags somewhere would be handy.

## Legacy Drupal 6 sites
- https://fen.net/
- https://fen.net/quotes

## 🎯 Goals       

* Preserve original content from:
  * `/` index of blog posts
  * `/blog/` (posts)
  * `/blog/category` (blog posts tagged with `category`)
  * `/quotes/` (quotes + authors)
  * `/quotes/category` (quotes tagged with `category`)
  * `/quotes/author` (selectable list of quote authors)

* Use clean, stable URLs:

  * Blog: `/blog/category/YYYY/MM/DD/title/`
  * Quotes: `/quotes/category/slug/`
* Avoid Drupal-specific structures (e.g., category-based URLs)
* Keep the build simple and GitHub Pages–compatible
* Prioritize **data integrity over presentation**

---

## 🧱 Project Structure

```
_posts/              # Blog posts (Jekyll built-in)
_quotes/             # Quotes (custom collection)

_layouts/
  default.html       # Site wrapper
  blog.html          # Blog post layout
  quote.html         # Quote layout

blog/
  index.html         # Blog index (paginated)

quotes/
  index.html         # Quotes index (paginated)
  tags/              # Tag index + tag pages

assets/              # CSS, etc.
_config.yml
import_drupal.rb     # Migration script
```

---

## ⚙️ Configuration

### `_config.yml`

```yaml
title: Fen Blog

permalink: /blog/:year/:month/:day/:title/

collections:
  quotes:
    output: true
    permalink: /quotes/:name/

plugins:
  - jekyll-paginate   # optional

paginate: 10
paginate_path: "/blog/page:num/"
```

---

## 🚀 Local Development

### Prerequisites

* Ruby (tested with 3.2.x on Ubuntu 24.04)
* Bundler

### Setup

```bash
bundle install
```

### Run the site

```bash
bundle exec jekyll serve
```

Visit:

```
http://localhost:4000/
```

---

## 🔁 Drupal Import

Content is imported using:

```bash
bundle exec ruby import_drupal.rb
```

### Data Sources

* Blog posts:

  * `node`
  * `node_revisions` (body + teaser)

* Quotes:

  * `quotes`
  * `quotes_authors`
  * `node_revisions` (body)

* Tags:

  * `term_node`
  * `term_data`

### Output

* Blog posts → `_posts/YYYY-MM-DD-title.md`
* Quotes → `_quotes/slug.md`

Each file includes YAML front matter with:

* title / date
* author (quotes)
* citation (quotes)
* teaser (posts)
* tags (from taxonomy)

---

## 🔗 URL Structure

| Type   | URL                         |
| ------ | --------------------------- |
| Home   | `/` → redirects to `/blog/` |
| Blog   | `/blog/`                    |
| Post   | `/blog/YYYY/MM/DD/title/`   |
| Quotes | `/quotes/`                  |
| Quote  | `/quotes/slug/`             |
| Tags   | `/quotes/tags/<tag>/`       |

---

## 🧠 Key Concepts (Important)

### `_site/` is disposable

* Never edit `_site/`
* Jekyll rebuilds it completely every run

---

### `_posts/` vs `_quotes/`

* `_posts/` → built-in blog system
* `_quotes/` → custom collection (`site.quotes`)

---

### Layout responsibilities

* `default.html` → global wrapper
* `blog.html` → single post
* `quote.html` → single quote

No loops or pagination inside layouts.

---

### Pagination rules

* Pagination applies to **one page only**
* `/blog/` owns pagination
* `/` must remain a redirect

---

### Tags

* Tags are stored in front matter:

```yaml
tags:
  - philosophy
  - politics
```

* Jekyll does not auto-generate tag pages — these are created manually

---

## ⚠️ Common Pitfalls

* Editing `_site/` (changes disappear)
* Missing front matter (`---`)
* Bad YAML breaking builds silently
* Old Drupal permalinks embedded in posts
* Missing taxonomy joins → no tags
* Pagination conflicting with `/` redirect

---

## 🧪 Debugging Tips

Clean rebuild:

```bash
bundle exec jekyll clean
bundle exec jekyll serve
```

Check for permalinks in posts:

```bash
grep -R "permalink:" _posts
```

Check quote count:

```liquid
{{ site.quotes | size }}
```

---

## 🪚 Future Improvements

* Auto-generate tag pages
* Author index pages for quotes
* Quote pagination
* RSS feeds
* Client-side search

---

## 📜 Guiding Principle

> Get the data right first.
> The site will follow.
