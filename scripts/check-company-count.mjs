#!/usr/bin/env node
/**
 * Company-count check — pins the one number that describes the database size.
 *
 * This repo is public: every README, skill and setup guide tells a reader how
 * many German companies an API key unlocks. It said "2,5 Millionen" in 20 places
 * long after the definition had been settled — companies are register types HRA,
 * HRB, GnR and PR, active only, Vereine (VR) excluded, which is ~2,3 Mio. / 2.3M.
 * The canonical figure and its definition live in the wiki
 * (`knowledge-base/produkte/firmendatenbank.md`).
 *
 * The sibling repos `website` and `implisense-app` carry the same check. When the
 * count changes, update the wiki page first, then COUNT + RETIRED in all three
 * scripts in the same commit.
 *
 * Usage: node scripts/check-company-count.mjs
 * Exit code 1 if any violations are found.
 */

import { readdirSync, readFileSync, existsSync } from 'node:fs';
import { join, relative } from 'node:path';

const ROOT = process.cwd();

// The canonical figure, per language notation.
const COUNT = { de: '2,3', en: '2.3' };

// Figures that used to be stated here and must never come back.
const RETIRED = ['2,5', '2.5', '2,9', '2.9'];
const retiredRe = new RegExp(
  `(${RETIRED.map((n) => n.replace('.', '\\.')).join('|')})\\s*(Mio\\.?|Millionen|million|M\\b)`,
  'i',
);

const SKIP_DIRS = new Set(['.git', 'node_modules', 'sample-data']);
const EXTS = ['.md', '.sh', '.json', '.txt', '.yml', '.yaml'];

const violations = [];

function walk(dir) {
  const files = [];
  for (const e of readdirSync(dir, { withFileTypes: true })) {
    if (SKIP_DIRS.has(e.name)) continue;
    const p = join(dir, e.name);
    if (e.isDirectory()) files.push(...walk(p));
    else if (EXTS.some((x) => e.name.endsWith(x))) files.push(p);
  }
  return files;
}

// ---------------------------------------------------------------- source scan

const sourceFiles = walk(ROOT);

for (const file of sourceFiles) {
  const rel = relative(ROOT, file);
  readFileSync(file, 'utf-8')
    .split('\n')
    .forEach((line, i) => {
      const m = line.match(retiredRe);
      if (m) {
        violations.push(
          `${rel}:${i + 1} — retired company count "${m[0].trim()}" (current: ${COUNT.de} Mio. / ${COUNT.en}M)`,
        );
      }
    });
}

// -------------------------------------------------------------- presence scan

// The entry points a reader hits first. Losing the figure there is a regression
// too — it is the whole argument for getting an API key.
const MUST_STATE = ['README.md', 'claude/README.md', 'chatgpt/README.md', 'claude/SETUP_MCP.md'];

const presentRe = new RegExp(
  `(${COUNT.de}\\s*(Mio\\.?|Millionen)|${COUNT.en.replace('.', '\\.')}\\s*(M\\b|million))`,
  'i',
);

for (const rel of MUST_STATE) {
  const file = join(ROOT, rel);
  if (!existsSync(file)) {
    violations.push(`${rel} — file missing, cannot verify the company count`);
    continue;
  }
  if (!presentRe.test(readFileSync(file, 'utf-8'))) {
    violations.push(`${rel} — does not state the company count (${COUNT.de} Mio. / ${COUNT.en}M)`);
  }
}

// ------------------------------------------------------------------- report

console.log(
  `Checked ${sourceFiles.length} files and ${MUST_STATE.length} entry points for the company count (${COUNT.de} Mio. / ${COUNT.en}M).\n`,
);

if (violations.length === 0) {
  console.log('\x1b[32m✓ Company count is consistent.\x1b[0m');
  process.exit(0);
} else {
  console.error(`\x1b[31m✗ ${violations.length} company-count issue(s):\x1b[0m\n`);
  for (const v of violations) console.error(`  · ${v}`);
  console.error('');
  process.exit(1);
}
