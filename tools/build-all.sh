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
echo "  Salvation History Timeline..."
node generate-pdf.js html/salvation-timeline-cards.html "$STATIC/salvation-history-timeline/cards.pdf"
node generate-pdf.js html/salvation-timeline-board.html "$STATIC/salvation-history-timeline/board.pdf" --landscape
node generate-pdf.js html/salvation-timeline-rules.html "$STATIC/salvation-history-timeline/rules.pdf"
node generate-pdf.js html/salvation-timeline-leader-guide.html "$STATIC/salvation-history-timeline/leader-guide.pdf"

# Coptic Memorisation
echo "  Coptic Memorisation..."
node generate-pdf.js html/coptic-memorisation-cards.html "$STATIC/coptic-memorisation/cards.pdf"
node generate-pdf.js html/coptic-memorisation-rules.html "$STATIC/coptic-memorisation/rules.pdf"

# Archangels and Angels
echo "  Archangels and Angels..."
node generate-pdf.js html/archangels-cards.html "$STATIC/archangels-and-angels/cards.pdf"
node generate-pdf.js html/archangels-rules.html "$STATIC/archangels-and-angels/rules.pdf"

# The Good Shepherd
echo "  The Good Shepherd..."
node generate-pdf.js html/good-shepherd-cards.html "$STATIC/the-good-shepherd/cards.pdf"
node generate-pdf.js html/good-shepherd-board.html "$STATIC/the-good-shepherd/board.pdf" --landscape
node generate-pdf.js html/good-shepherd-rules.html "$STATIC/the-good-shepherd/rules.pdf"

# We Believe
echo "  We Believe..."
node generate-pdf.js html/we-believe-cards.html "$STATIC/we-believe/cards.pdf"
node generate-pdf.js html/we-believe-rules.html "$STATIC/we-believe/rules.pdf"
node generate-pdf.js html/we-believe-leader-guide.html "$STATIC/we-believe/leader-guide.pdf"
node generate-pdf.js html/we-believe-reference-sheet.html "$STATIC/we-believe/reference-sheet.pdf"

# The Seven Sacraments
echo "  The Seven Sacraments..."
node generate-pdf.js html/seven-sacraments-cards.html "$STATIC/the-seven-sacraments/cards.pdf"
node generate-pdf.js html/seven-sacraments-rules.html "$STATIC/the-seven-sacraments/rules.pdf"
node generate-pdf.js html/seven-sacraments-leader-guide.html "$STATIC/the-seven-sacraments/leader-guide.pdf"
node generate-pdf.js html/seven-sacraments-reference-sheet.html "$STATIC/the-seven-sacraments/reference-sheet.pdf"

# Icons of the Faith
echo "  Icons of the Faith..."
node generate-pdf.js html/icons-of-faith-cards.html "$STATIC/icons-of-the-faith/cards.pdf"
node generate-pdf.js html/icons-of-faith-rules.html "$STATIC/icons-of-the-faith/rules.pdf"
node generate-pdf.js html/icons-of-faith-leader-guide.html "$STATIC/icons-of-the-faith/leader-guide.pdf"
node generate-pdf.js html/icons-of-faith-reference-sheet.html "$STATIC/icons-of-the-faith/reference-sheet.pdf"

# The Life of Christ
echo "  The Life of Christ..."
node generate-pdf.js html/life-of-christ-cards.html "$STATIC/the-life-of-christ/cards.pdf"
node generate-pdf.js html/life-of-christ-board.html "$STATIC/the-life-of-christ/board.pdf" --landscape
node generate-pdf.js html/life-of-christ-rules.html "$STATIC/the-life-of-christ/rules.pdf"
node generate-pdf.js html/life-of-christ-leader-guide.html "$STATIC/the-life-of-christ/leader-guide.pdf"

# Theotokia
echo "  Theotokia..."
node generate-pdf.js html/theotokia-cards.html "$STATIC/theotokia/cards.pdf"
node generate-pdf.js html/theotokia-rules.html "$STATIC/theotokia/rules.pdf"
node generate-pdf.js html/theotokia-leader-guide.html "$STATIC/theotokia/leader-guide.pdf"
node generate-pdf.js html/theotokia-reflection.html "$STATIC/theotokia/reflection-sheet.pdf"

# Fasting and Feasting
echo "  Fasting and Feasting..."
node generate-pdf.js html/fasting-feasting-cards.html "$STATIC/fasting-and-feasting/cards.pdf"
node generate-pdf.js html/fasting-feasting-board.html "$STATIC/fasting-and-feasting/board.pdf" --landscape
node generate-pdf.js html/fasting-feasting-rules.html "$STATIC/fasting-and-feasting/rules.pdf"
node generate-pdf.js html/fasting-feasting-leader-guide.html "$STATIC/fasting-and-feasting/leader-guide.pdf"

# Remove quarantine from all generated PDFs (macOS only)
if command -v xattr &> /dev/null; then
  echo "Removing quarantine attributes..."
  find "$STATIC" -name "*.pdf" -size +1k -exec xattr -d com.apple.quarantine {} 2>/dev/null \;
fi

echo "Done! All PDFs generated."
