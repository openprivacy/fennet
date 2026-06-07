# Fen's Stream of Conciousness

This repository contains a static-site version of content migrated from a legacy Drupal 6 database.

See the result at https://fen.net

---

## Adding content

### New Blog Post

1. Create a file in _posts named `YYYY-MM-DD-slug-title.md`
2. Add front matter:
   ```yaml
   ---
   title: "Your Title"
   date: 2026-06-07
   categories:
   - identity
   ---
   ```
3. Write content below the front matter in Markdown
4. Commit and push — the Actions workflow deploys automatically

**Available categories:** education, environment, family, foss, identity, politics, privacy, random, roycroft

### New Quote

1. Create a file in _quotes named `YYYY-MM-DD-slug.md`
2. Add front matter:
   ```yaml
   ---
   title: "Short title or first words"
   date: 2026-06-07
   author: "Author Name"
   tags:
   - philosophy
   - life
   ---
   ```
3. Write the quote text below the front matter
4. Commit and push

**Available quote tags:** freedom, geeky, government, information, life, peace, philosophy, random, rebellion, religion, wosd

New categories/tags are created automatically when used — they'll appear in the sidebar and get archive pages.

## 🚀 Local Development

### Prerequisites

* Ruby (tested with 3.2.x on Ubuntu 24.04)
* Bundler

### Run the site

```bash
bundle exec jekyll serve
```

### Visit:

```
http://localhost:4000/
```


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

## 🪚 Future Improvements

* Better quote presentation
* Link to a single quote
* Quote pagination
* Client-side blog search

---

## 📜 Guiding Principle

> Get the data right first.
> The site will follow.
