# Authoring Guide

How to add new games and content to the Coptic Cross Games site.

## Adding a New Game

### 1. Create the game content file

Create a new Markdown file in `content/games/`:

```
content/games/your-game-name.md
```

Use kebab-case for the filename. This becomes the URL slug (e.g., `/games/your-game-name/`).

### 2. Add frontmatter

Every game file needs YAML frontmatter with these fields:

```yaml
---
title: "Your Game Name"
description: "A one-sentence description shown in game cards and meta tags."
age_range: "12+"
players: "2-5"
play_time: "20 minutes"
difficulty: "Easy"           # Easy, Medium, or Hard
formation_goal: "The character quality or spiritual practice this game cultivates."
learning_goal: "The knowledge or skill players develop."
categories: ["Virtue Formation", "Family Games"]
tags: ["cooperative", "discussion", "cards"]
download_files:
  - "/games/your-game-name/cards.pdf"
  - "/games/your-game-name/rules.pdf"
  - "/games/your-game-name/leader-guide.pdf"
featured: true               # Show on home page (optional)
weight: 10                   # Sort order, lower = first (optional)
---
```

### 3. Write the game description

Below the frontmatter, write the game description in Markdown. Recommended sections:

- **Overview** - What the game is and why it matters
- **How It Works** - Core mechanics explained simply
- **What Makes It Formation** - Why this game forms character, not just entertains
- **Components** - What gets printed
- **Setup** - How to prepare
- **Ideal For** - Who should play this game

### 4. Create the HTML templates for PDF generation

PDFs are generated from HTML templates using Puppeteer (headless Chrome). Each PDF component (cards, rules, leader guide, etc.) has its own HTML file.

**Location:** `tools/html/`

**Naming convention:** `{game-slug}-{component}.html` — e.g., `saints-memory-cards.html`, `desert-fathers-leader-guide.html`

**Shared stylesheet:** All templates import `../templates/print-base.css` which provides:
- Card grids: `.card-page.standard` (2.5"×3.5", 9 per page), `.card-page.half` (15 per page), `.card-page.wide` (8 per page)
- Card structure: `.card`, `.card-title`, `.card-body`, `.card-footer`, `.card-category` (colour band)
- Card backs: `.card-back` with `.back-cross` and `.back-title`
- Document pages: `.doc-page` with `h1`/`h2`/`h3`, `.subtitle`, `.game-meta`, `.callout`, `.scripture`
- Category colours: `.cat-scripture` (blue), `.cat-saints` (red), `.cat-liturgical` (purple), `.cat-virtue` (teal), `.cat-discernment` (amber), `.cat-family` (cyan)
- Reflection sheets: `.reflection-line`
- Board pages: `.board-page` (landscape, 10"×7.5")

**Template structure for cards:**
```html
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../templates/print-base.css">
<style>
  /* Game-specific card styling */
</style>
</head>
<body>
<p class="cut-guide">Game Name — Coptic Cross Games — Print on cardstock — Page 1 of N</p>
<div class="card-page standard">
  <div class="card">
    <div class="card-category cat-scripture"></div>
    <div class="card-title">Card Title</div>
    <div class="card-body">Card content text</div>
    <div class="card-footer">Footer text</div>
  </div>
  <!-- 9 cards per page -->
</div>
<!-- Card backs page at the end -->
<p class="copyright">© 2026 Coptic Cross Games. Free to print for personal and church use.</p>
</body>
</html>
```

**Template structure for rules/leader guides:**
```html
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../templates/print-base.css">
</head>
<body>
<div class="doc-page">
  <h1>Game Name</h1>
  <p class="subtitle">Rules — Ages X-Y — N Players — M Minutes</p>
  <div class="game-meta">
    <div><dt>Age Range</dt><dd>X-Y</dd></div>
    <div><dt>Players</dt><dd>N</dd></div>
    <div><dt>Play Time</dt><dd>M minutes</dd></div>
    <div><dt>Difficulty</dt><dd>Easy</dd></div>
  </div>
  <!-- Sections: About, Components, Setup, How to Play, Tips, etc. -->
  <div class="footer-line">Game Name • Coptic Cross Games • copticcrossgames.com</div>
</div>
</body>
</html>
```

### 5. Add the game to the build script

Edit `tools/build-all.sh` and add entries for each PDF:

```bash
# Your Game Name
echo "  Your Game Name..."
node generate-pdf.js html/your-game-cards.html "$STATIC/your-game-name/cards.pdf"
node generate-pdf.js html/your-game-rules.html "$STATIC/your-game-name/rules.pdf"
node generate-pdf.js html/your-game-leader-guide.html "$STATIC/your-game-name/leader-guide.pdf"
```

Add the `--landscape` flag for boards: `node generate-pdf.js html/your-game-board.html "$STATIC/your-game-name/board.pdf" --landscape`

**PDF generator settings** (configured in `tools/generate-pdf.js`):
- Format: Letter (8.5" × 11")
- Margins: 0.4" all sides
- Print backgrounds: enabled
- Landscape: optional via `--landscape` flag

### 6. Generate PDFs locally

```bash
cd tools
npm ci          # Install Puppeteer (first time only)
bash build-all.sh
```

PDFs are written to `static/games/{game-name}/`. The CI pipeline also runs this automatically on deploy.

### 7. Commit and push

```bash
git add content/games/your-game-name.md
git add tools/html/your-game-*.html
git add static/games/your-game-name/
git commit -m "Add Your Game Name"
git push
```

The site rebuilds automatically via GitHub Actions, regenerating all PDFs fresh.

## Categories

Use existing categories when possible. Current categories:

**By theme:**
- **Scripture** - Biblical narrative, typology, parables, prophecy
- **Saints and Martyrs** - Lives of saints, desert fathers, church history, councils
- **Liturgical Life** - Feasts, fasts, sacraments, prayer, church symbols
- **Virtue Formation** - Character development, repentance, patience, speech
- **Discernment** - Moral formation, digital life, humility, spiritual balance
- **Family Formation** - Hospitality, forgiveness, intergenerational life
- **Bible Knowledge** - Biblical literacy and timeline knowledge

**By audience:**
- **Children Games** - Ages 4-12, simple mechanics
- **Youth Group Games** - Ages 13-17, deeper formation themes
- **Adult Formation** - Ages 18+, discussion and reflection
- **Family Games** - All ages, mixed family play

To add a new category, simply use it in a game's `categories` field. Hugo creates the taxonomy page automatically.

## Shortcodes

Two shortcodes are available for use in game content:

### Game metadata display

```
{{</* game-meta */>}}
```

Renders a formatted display of the game's metadata (age, players, time, difficulty).

### Download links

```
{{</* downloads */>}}
```

Renders download buttons for all files listed in `download_files`.

These are optional — the game detail page template already displays this information in the sidebar.

## Editing Existing Pages

- `content/about.md` - About page
- `content/churches.md` - Churches page
- `content/starter-pack.md` - Starter pack landing page
- `content/games/_index.md` - Games library intro text

## Local Development

```bash
hugo server --buildDrafts
```

The site runs at `http://localhost:1313/`. Changes reload automatically.

## Asset Guidelines

- **Cards**: Design at standard card size (2.5" x 3.5" or 63mm x 88mm)
- **Rules**: Letter size (8.5" x 11"), 2 pages max
- **Leader Guide**: Letter size, as many pages as needed
- **Board**: Letter or tabloid size, depending on the game
- **File format**: PDF only
- **File size**: Keep under 10MB per file for fast downloads

## Content Style

- Write in a calm, thoughtful tone
- Avoid childish or cartoonish language
- Explain formation goals clearly — parents and leaders need to understand the "why"
- Include practical setup instructions
- Always provide a "Who is this for?" section
