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

### 4. Upload PDF assets

Place downloadable files in `static/games/your-game-name/`:

```
static/games/your-game-name/
  cards.pdf
  rules.pdf
  leader-guide.pdf
```

These are referenced by the `download_files` frontmatter field. Paths must match exactly.

### 5. Commit and push

```bash
git add content/games/your-game-name.md
git add static/games/your-game-name/
git commit -m "Add Your Game Name"
git push
```

The site rebuilds automatically via GitHub Actions.

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
