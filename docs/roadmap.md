# Coptic Cross Games: Platform Roadmap

## Stage Overview

| Stage | Focus | Format |
|-------|-------|--------|
| **Stage 1** | Formation Print-and-Play | PDF card games, boards, and worksheets for download |
| **Stage 2** | Formation Browser / Interactive Games | Web-based versions of print games + new interactive mechanics |
| **Stage 3** | Arabic &/or Coptic | Language learning modules for church vocabulary and script |

---

## Stage 1: Formation Print-and-Play

Downloadable print-and-play formation games covering Scripture, saints, liturgical life, virtue, and discernment.

See [game-library-plan.md](game-library-plan.md) for the full 30-game library plan, reusable mechanics, release strategy, and Hugo content packaging.

### Planned: Age Group Browsing

Add an `age_groups` taxonomy so users can browse games by age group. Proposed groups:

- **Young Children (4-7)** — 5 games
- **Children (8-12)** — 6 games
- **Tweens (10-15)** — 2 games (overlap with Children and Teens)
- **Teens (13-17)** — 6 games
- **Adults (18+)** — 5 games
- **All Ages** — 4 games

Implementation: add `age_groups` to hugo.toml taxonomies, add the field to each game's front matter, create layout templates mirroring categories, and add a nav menu item. Games with overlapping age ranges (e.g. "10-15") would appear in multiple groups.

---

## Stage 2: Formation Browser / Interactive Games

Web-based interactive versions of formation games, hosted on the Hugo site.

Goals:

- Convert high-value print games into browser-based experiences
- Add interactive mechanics not possible in print (timed challenges, audio, drag-and-drop)
- Support individual practice and group play
- Maintain the same formation focus as print games

Technology:

- JavaScript apps embedded in Hugo site
- Game data stored as JSON
- Progressive enhancement — print versions remain available

---

## Stage 3: Arabic &/or Coptic

Language learning modules for church vocabulary, script recognition, and liturgical context.

### Arabic Learning Track — Strategic Plan (Deferred Project)

**Status:** Deferred / optional future module

Arabic learning games are not a core product initially but may become a supporting track within the broader faith formation games platform.

The goal is cultural and church literacy, not full language instruction.

### Strategic Objective

Create simple games and tools that help children, youth, and families learn Arabic elements used in church life, particularly in communities connected with Coptic Orthodox tradition.

Focus on:

- Recognition
- Pronunciation
- Church vocabulary
- Scriptural words
- Liturgical context

Not full grammar or conversational fluency.

### Constraints

The project must:

- Remain compatible with Coptic Orthodox theology, culture, and church practice
- Avoid competing with full language-learning systems (e.g., Duolingo)
- Support family, Sunday school, and youth group contexts
- Integrate with print-and-play game platform
- Support eventual web-based learning games

### Non-Goals

Do NOT attempt to build:

- A comprehensive Arabic learning platform
- Grammar instruction
- Full conversational training
- Duolingo-style learning infrastructure

Instead focus on small, targeted learning modules.

### Strategic Positioning

Duolingo already provides:

- Full language learning
- Advanced gamification
- Daily habit loops

The Arabic learning module should instead provide:

- Church vocabulary
- Scripture-linked words
- Liturgical familiarity
- Culturally relevant learning
- Group-friendly games

### Possible Approaches

#### Option A — Printable Card Games (Fastest)

Create print-and-play decks teaching:

- Arabic alphabet
- Letter sounds
- Simple words

Example games:

- Memory match (letter / sound)
- Alphabet ordering
- Word-building puzzles
- Speed recognition

Assets:

- Letter cards
- Sound cards
- Word cards
- Rule sheets

Estimated development: 1-2 days per game.

Advantages:

- Extremely fast to produce
- Works in homes and Sunday schools
- Compatible with website model

#### Option B — Church Vocabulary Games

Teach Arabic words commonly heard in church contexts.

Examples:

- رب (Lord)
- نور (light)
- سلام (peace)
- حب (love)
- أب (father)

Game types:

- Matching games
- Word-building games
- Scripture association games
- Discussion games

Advantages:

- Directly connected to faith formation
- Culturally meaningful
- Suitable for mixed-age groups

Estimated development: 2-3 days per game.

#### Option C — Progressive Learning Game (Web)

Create a simple web-based learning progression.

Structure:

1. Letter recognition
2. Sound recognition
3. Letter matching
4. Word construction
5. Church vocabulary
6. Timed recognition challenges

Technology:

- Small JavaScript app
- Embedded in Hugo site
- Level data stored as JSON

Estimated development: 3-7 days for MVP.

#### Option D — Hybrid Printable + Digital

Combine both models.

Printable:

- Cards
- Boards
- Worksheets

Digital:

- Practice drills
- Sound recognition
- Word games

Advantages:

- Accessible in church settings
- Supports individual practice

### Learning Progression Model

The module should follow this sequence:

```
Letter recognition
      ↓
Sound recognition
      ↓
Matching
      ↓
Word formation
      ↓
Church vocabulary
      ↓
Scripture and liturgical phrases
```

### Content Requirements

Include:

- Arabic letters
- Transliteration
- Pronunciation guidance
- Basic meaning

Later expansions:

- Initial/middle/final letter forms
- Liturgical phrases
- Scripture vocabulary
- Saints' names

### Hugo Website Integration

Content structure should support both printable assets and optional web games.

Example structure:

```
content/games/arabic-learning/
  arabic-alphabet.md
  church-vocabulary.md
  word-builder.md
```

Assets:

```
static/games/arabic-learning/
  alphabet-cards.pdf
  alphabet-rules.pdf
  vocabulary-cards.pdf
```

Optional web game files:

```
static/games/arabic-learning/
  levels/
    level1.json
    level2.json
```

#### Example Level Structure (JSON)

```json
{
  "letter": "ب",
  "name": "baa",
  "choices": ["baa", "taa", "noon", "jeem"],
  "difficulty": 1
}
```

### Development Phasing

#### Phase 1 (Optional Future)

Create printable games:

- Arabic Alphabet Match
- Arabic Alphabet Memory
- Church Word Builder

Estimated time: 1-2 weeks.

#### Phase 2

Add simple web mini-game:

- Recognition quizzes
- Word building

Estimated time: 1 week.

#### Phase 3

Add deeper content:

- Liturgical words
- Scripture vocabulary
- Saints' names

Estimated time: ongoing.

### Strategic Value

This track provides:

- Culturally meaningful learning
- Language exposure linked to faith
- Simple educational resources for families and churches
- Differentiation from generic Christian games

However it should remain a secondary track, not the primary focus of the platform.

### Recommendation

Initial launch of the formation game platform should focus on:

- Virtue formation games
- Scripture games
- Saints and church history games

The Arabic learning module can be added later as a specialised educational category.
