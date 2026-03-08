# Coptic Cross Games

Print-and-play faith formation games for families, youth groups, churches, and Christian educators. A Hugo microsite following the Microsite Lifecycle Workflow.

## Project Type

**Microsite** — static Hugo site deployed to GitHub Pages via GitHub Actions.

## Tech Stack

| Tool | Purpose |
|------|---------|
| Hugo | Static site generator |
| GitHub Pages | Hosting |
| GitHub Actions | CI/CD (build + PDF generation + deploy) |
| Node.js + Puppeteer | PDF generation from HTML templates |
| Custom theme (`formation`) | Layouts and CSS |

## Project Structure

```
content/games/          # Game content pages (Markdown with YAML frontmatter)
tools/html/             # HTML templates for PDF generation
tools/generate-pdf.js   # Puppeteer PDF generator
tools/build-all.sh      # Builds all PDFs
tools/templates/        # Shared CSS (print-base.css)
static/games/           # Generated PDF files (cards, rules, boards, etc.)
themes/formation/       # Custom Hugo theme
docs/                   # Planning docs (game-library-plan.md, game-status.md)
AUTHORING.md            # Full guide for adding games and content
```

## Key Workflows

### Adding a new game

Follow `AUTHORING.md` exactly. Summary:

1. Create `content/games/{slug}.md` with required frontmatter
2. Create HTML templates in `tools/html/` using `print-base.css`
3. Add entries to `tools/build-all.sh`
4. Generate PDFs: `cd tools && npm ci && bash build-all.sh`
5. Commit content, HTML templates, and generated PDFs

### Local development

```bash
hugo server --buildDrafts    # Site at http://localhost:1313/
```

### PDF generation

```bash
cd tools && bash build-all.sh
```

PDFs are also regenerated in CI on every deploy.

## Game Status

Track in `docs/game-status.md`. Currently 15 complete games (real PDFs), 24 WIP (placeholder PDFs). Target: 30-game library.

## Content Conventions

- Calm, thoughtful tone — not childish or cartoonish
- Formation goals explained clearly for parents and leaders
- Categories: Scripture, Saints and Martyrs, Liturgical Life, Virtue Formation, Discernment, Family Formation, Bible Knowledge
- Age groups: Children (4-7), Kids (8-12), Youth (13-17), Adult (18+), All ages
- kebab-case for filenames and URL slugs

## Card/PDF Design

- Cards: 2.5" x 3.5" standard size, 9 per page
- Rules/guides: Letter size (8.5" x 11"), 2 pages max for rules
- Boards: Letter landscape via `--landscape` flag
- All templates use shared `print-base.css` classes
- Category colour bands on cards (`.cat-scripture`, `.cat-saints`, `.cat-liturgical`, `.cat-virtue`, `.cat-discernment`, `.cat-family`)

## Domain

Production URL: `https://copticcrossgames.com/`
