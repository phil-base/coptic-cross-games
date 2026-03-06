#!/usr/bin/env node
/**
 * PDF Generator for Coptic Cross Games
 *
 * Usage: node generate-pdf.js <html-file> <output-pdf> [--landscape]
 *
 * Converts an HTML file to a print-ready PDF using Puppeteer + Chrome.
 */
const puppeteer = require('puppeteer');
const path = require('path');
const fs = require('fs');

async function generatePDF(htmlPath, outputPath, landscape = false) {
  const absoluteHtml = path.resolve(htmlPath);
  if (!fs.existsSync(absoluteHtml)) {
    console.error(`File not found: ${absoluteHtml}`);
    process.exit(1);
  }

  const browser = await puppeteer.launch({ headless: true });
  const page = await browser.newPage();

  await page.goto(`file://${absoluteHtml}`, { waitUntil: 'networkidle0' });

  await page.pdf({
    path: outputPath,
    format: 'Letter',
    landscape,
    printBackground: true,
    margin: { top: '0.4in', right: '0.4in', bottom: '0.4in', left: '0.4in' },
  });

  await browser.close();
  console.log(`Generated: ${outputPath}`);
}

const args = process.argv.slice(2);
if (args.length < 2) {
  console.log('Usage: node generate-pdf.js <html-file> <output-pdf> [--landscape]');
  process.exit(1);
}

const landscape = args.includes('--landscape');
generatePDF(args[0], args[1], landscape);
