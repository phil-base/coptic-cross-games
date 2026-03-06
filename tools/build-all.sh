#!/bin/bash
# Build all game PDFs
# Usage: cd tools && bash build-all.sh

set -e
STATIC="../static/games"

echo "Building all game PDFs..."

# Saints Memory
echo "  Saints Memory..."
node generate-pdf.js html/saints-memory-cards.html "$STATIC/saints-memory/cards.pdf"
node generate-pdf.js html/saints-memory-rules.html "$STATIC/saints-memory/rules.pdf"

# Feast Day Match
echo "  Feast Day Match..."
node generate-pdf.js html/feast-day-match-cards.html "$STATIC/feast-day-match/cards.pdf"
node generate-pdf.js html/feast-day-match-rules.html "$STATIC/feast-day-match/rules.pdf"

# Desert Fathers Wisdom
echo "  Desert Fathers Wisdom..."
node generate-pdf.js html/desert-fathers-cards.html "$STATIC/desert-fathers-wisdom/cards.pdf"
node generate-pdf.js html/desert-fathers-rules.html "$STATIC/desert-fathers-wisdom/rules.pdf"
node generate-pdf.js html/desert-fathers-leader-guide.html "$STATIC/desert-fathers-wisdom/leader-guide.pdf"
node generate-pdf.js html/desert-fathers-reflection.html "$STATIC/desert-fathers-wisdom/reflection-sheet.pdf"

# Miracles and Mercy
echo "  Miracles and Mercy..."
node generate-pdf.js html/miracles-and-mercy-cards.html "$STATIC/miracles-and-mercy/cards.pdf"
node generate-pdf.js html/miracles-and-mercy-rules.html "$STATIC/miracles-and-mercy/rules.pdf"
node generate-pdf.js html/miracles-and-mercy-leader-guide.html "$STATIC/miracles-and-mercy/leader-guide.pdf"

# The Narrow Way
echo "  The Narrow Way..."
node generate-pdf.js html/narrow-way-cards.html "$STATIC/the-narrow-way/cards.pdf"
node generate-pdf.js html/narrow-way-rules.html "$STATIC/the-narrow-way/rules.pdf"
node generate-pdf.js html/narrow-way-score-track.html "$STATIC/the-narrow-way/score-track.pdf"
node generate-pdf.js html/narrow-way-leader-guide.html "$STATIC/the-narrow-way/leader-guide.pdf"

# Salvation History Timeline
if [ -f html/salvation-timeline-cards.html ]; then
  echo "  Salvation History Timeline..."
  node generate-pdf.js html/salvation-timeline-cards.html "$STATIC/salvation-history-timeline/cards.pdf"
  node generate-pdf.js html/salvation-timeline-board.html "$STATIC/salvation-history-timeline/board.pdf" --landscape
  node generate-pdf.js html/salvation-timeline-rules.html "$STATIC/salvation-history-timeline/rules.pdf"
  node generate-pdf.js html/salvation-timeline-leader-guide.html "$STATIC/salvation-history-timeline/leader-guide.pdf"
fi

# Remove quarantine from all generated PDFs
echo "Removing quarantine attributes..."
find "$STATIC" -name "*.pdf" -size +1k -exec xattr -d com.apple.quarantine {} 2>/dev/null \;

echo "Done! All PDFs generated."
