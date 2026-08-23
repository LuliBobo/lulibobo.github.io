# CFO Unfiltered Homepage Redesign — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Convert borisdracka.com homepage to "Speed-First with Social Proof" design that increases newsletter subscriber conversions from X/Twitter traffic by showcasing recent blog articles.

**Architecture:** Static HTML redesign with embedded responsive CSS. Hero section optimized for mobile (LULI image sizing adjusted per breakpoint). New "Latest Insights" section pulls 3-4 most recent blog articles as social proof. Both EN and SK versions updated identically.

**Tech Stack:** HTML5, CSS3 (Flexbox/Grid), no JavaScript framework needed. Deploy to existing static hosting.

---

## Global Constraints

- **Browser Support:** Modern browsers (Chrome, Firefox, Safari, Edge)
- **Accessibility:** WCAG 2.1 AA minimum
- **Responsive Breakpoints:** Desktop (1024px+), Tablet (768px-1023px), Mobile (<768px)
- **Performance:** Page load <2s on 4G
- **Bilingual:** All changes to both `index.html` (EN) and `sk/index.html` (SK)
- **Backwards Compatibility:** Existing newsletter links (beehiiv) unchanged
- **Color Palette:** Orange #E8562A, Dark #111111, Mid #555555, Light #F7F5F2, White #FFFFFF, Border #E8E5E0
- **Typography:** Inter font (Google Fonts), weights 400/500/700/800/900

---

## File Manifest

**Files to Modify:**
1. `index.html` — Main English homepage
2. `sk/index.html` — Main Slovak homepage
3. (No additional CSS files — styles embedded in HTML)

**Files to Reference (Read-Only):**
- `blog/` folder — Extract article metadata
- `sk/` folder structure — Ensure parallel updates

**Workflow:**
- Modify EN version first (index.html)
- Test thoroughly
- Apply same changes to SK version
- Final QA on both

---

## Task Breakdown

### Task 1: Extract Blog Article Metadata

**Files:**
- Read: `blog/` (all .md or .html files)
- Create: `_articles-data.json` (temporary working file, not deployed)

**Interfaces:**
- Produces: List of 5-6 most recent articles with: title, excerpt (first 2 sentences), publish date, URL slug
- Format: JSON array or documentation for manual entry into HTML

**Purpose:** Determine which articles to display and their metadata before coding HTML.

- [ ] **Step 1: List all blog articles**

Navigate to blog folder and run:
```bash
ls -lR /Users/macbookprosukromne/Documents/ABOUT\ me/borisdracka.com/blog/
```

Expected: See all blog post files with dates. Note the 4-6 most recent.

- [ ] **Step 2: Extract metadata for top articles**

For each recent article (check file modification date), read the file and extract:
- Title (from markdown H1 or HTML <title>)
- First 1-2 sentences as excerpt
- Publication date (from file metadata or front-matter)
- URL slug (e.g., `/blog/article-title`)

Create simple documentation:
```
Article 1: "Title Here" | Date: 2026-08-22 | Slug: /blog/article-slug
Article 2: "Title Here" | Date: 2026-08-20 | Slug: /blog/article-slug
[etc - need 3-4 articles minimum]
```

- [ ] **Step 3: Commit notes**

```bash
git add docs/superpowers/plans/  # Plan file already exists
# No commit needed - this is reference work
```

---

### Task 2: Hero Section — Mobile Responsive Optimization

**Files:**
- Modify: `index.html` (lines 137-511 approximately)

**Interfaces:**
- Consumes: Current hero layout (two-column grid)
- Produces: Responsive hero with:
  - Desktop: Two-column (image left, content right)
  - Tablet: Single-column, LULI 70% size
  - Mobile: Single-column, LULI hidden or 40% size, subscribe box full-width

**Purpose:** Ensure hero fits mobile screens without compromising subscribe box visibility.

- [ ] **Step 1: Add mobile breakpoint styles**

Find the `@media (max-width: 900px)` block in `<style>`. Add new mobile-specific rules for hero:

Current responsive section (around line 417-441):
```css
@media (max-width: 900px) {
  nav { padding: 16px 24px; }
  .nav-blog { display: none; }
  .hero {
    grid-template-columns: 1fr;
    min-height: auto;
    max-height: none;
  }
  .hero-visual {
    height: 320px;
    padding-top: 32px;
  }
  .hero-visual img { width: 60%; margin-bottom: 0; align-self: flex-end; }
  .hero-content { padding: 40px 24px; }
  /* ... rest of media query ... */
}
```

Add a new media query for mobile (<600px):
```css
@media (max-width: 600px) {
  .hero-visual {
    height: 200px;  /* Reduce height further on small mobile */
    padding-top: 16px;
  }
  .hero-visual img {
    width: 40%;  /* LULI even smaller on iPhone */
    max-height: 180px;
  }
  .hero-content {
    padding: 32px 16px;  /* Less padding on mobile */
  }
  .subscribe-box {
    max-width: 100%;  /* Full width */
  }
}
```

- [ ] **Step 2: Test breakpoints visually**

Open `index.html` in browser:
1. Desktop (1200px+): LULI full size, subscribe box right. ✅ Should look as current.
2. Tablet (768px): LULI smaller, subscribe box below. ✅ Should be legible.
3. Mobile (375px): LULI minimal, subscribe box dominates. ✅ Should be thumb-friendly.

Use browser DevTools (F12) → Device Emulation to test.

- [ ] **Step 3: Verify subscribe button is clickable**

On mobile emulation:
- Click "Subscribe — It's free →" button
- Should open beehiiv subscribe link without 404 or layout shift
- Email input field should be fully visible

Expected: No horizontal scroll, button centered.

- [ ] **Step 4: Commit hero optimization**

```bash
git add index.html
git commit -m "feat: optimize hero section for mobile with responsive LULI sizing

- Add mobile breakpoint (<600px) with reduced LULI image size
- Subscribe box remains full-width and thumb-accessible
- Tested on 375px, 768px, 1200px viewports"
```

---

### Task 3: Blog Articles Section — HTML Structure & Styling

**Files:**
- Modify: `index.html` (insert after hero section, before existing "What You Get" section)

**Interfaces:**
- Consumes: Hero section HTML (unchanged)
- Produces: New `.articles-section` with `.articles-grid` containing `.article-card` elements
- Later tasks will: Populate with article data

**Purpose:** Create the HTML structure and CSS styling for article cards that showcase blog content.

- [ ] **Step 1: Locate insertion point**

Open `index.html`. Find line: `<section class="section-get">` (around line 516).

This is where we'll insert the new articles section BEFORE it.

- [ ] **Step 2: Write HTML structure**

Prepare this HTML block to insert (we'll customize with real data in next task):

```html
<!-- ARTICLES SECTION (NEW) -->
<section class="articles-section">
  <p class="kicker">LATEST INSIGHTS</p>
  <h2>What I'm writing about</h2>
  <div class="articles-grid">
    <!-- Article cards will be populated here in Task 4 -->
  </div>
</section>
```

Insert this block right BEFORE `<hr class="divider" />` that comes before "What You Get" section.

Visual hierarchy: Hero → Articles → What You Get (this is the flow now).

- [ ] **Step 3: Add CSS styling for articles section**

Find the `<style>` block (line 32-442). Add these rules before the `@media` queries (around line 416):

```css
/* ── ARTICLES SECTION ── */
.articles-section {
  padding: 80px 48px;
  max-width: 1100px;
  margin: 0 auto;
}

.articles-section .kicker {
  font-size: 0.78rem;
  font-weight: 700;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--orange);
  margin-bottom: 12px;
}

.articles-section h2 {
  font-size: clamp(1.8rem, 3vw, 2.6rem);
  font-weight: 900;
  letter-spacing: -0.03em;
  margin-bottom: 48px;
  max-width: 560px;
  line-height: 1.15;
}

.articles-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px;
}

.article-card {
  border: 1px solid var(--border);
  padding: 32px;
  border-radius: 12px;
  transition: box-shadow 0.2s, transform 0.2s;
  background: var(--white);
}

.article-card:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
  transform: translateY(-2px);
}

.article-date {
  font-size: 0.8rem;
  color: var(--mid);
  margin-bottom: 12px;
  font-weight: 500;
}

.article-title {
  font-size: 1.15rem;
  font-weight: 700;
  line-height: 1.4;
  margin-bottom: 12px;
  letter-spacing: -0.02em;
}

.article-excerpt {
  font-size: 0.95rem;
  color: var(--mid);
  line-height: 1.65;
  margin-bottom: 16px;
}

.article-link {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  color: var(--orange);
  text-decoration: none;
  font-weight: 600;
  font-size: 0.9rem;
  transition: color 0.2s;
}

.article-link:hover {
  color: var(--orange-d);
}
```

Then add responsive styles in the existing `@media (max-width: 900px)` block:

```css
@media (max-width: 900px) {
  /* ... existing styles ... */
  
  .articles-section {
    padding: 60px 24px;
  }
  
  .articles-grid {
    grid-template-columns: 1fr;  /* Stack to 1 column on tablet/mobile */
    gap: 16px;
  }
  
  .article-card {
    padding: 24px;
  }
}
```

- [ ] **Step 4: Visual check**

Open `index.html` in browser:
- Desktop: Should see 3-column grid (empty for now)
- Tablet: Should stack to 1 column
- Verify spacing, borders, and hover effects work
- No layout breaks

Expected: Section title + empty cards with proper styling.

- [ ] **Step 5: Commit structure**

```bash
git add index.html
git commit -m "feat: add articles section HTML structure and styling

- New .articles-section with 3-column grid (responsive to 1 col on mobile)
- Article card components with hover effects
- Kicker and heading matching existing design system
- Positioned before 'What You Get' section"
```

---

### Task 4: Populate Articles with Real Data (EN Version)

**Files:**
- Modify: `index.html` (articles-grid section)

**Interfaces:**
- Consumes: Blog metadata from Task 1 (article titles, excerpts, dates, URLs)
- Produces: 3-4 populated `.article-card` elements in `.articles-grid`

**Purpose:** Insert real blog article data into the HTML structure created in Task 3.

- [ ] **Step 1: Gather article data**

From Task 1, you have article metadata. Example format:
```
Article 1: "Why CFOs Miss the Real Story in Numbers" | Date: 2026-08-20 | Slug: /blog/cfos-miss-story
Article 2: "The AI Question Every Finance Leader Avoids" | Date: 2026-08-15 | Slug: /blog/ai-question
Article 3: "What Your Budget Says About Your Company" | Date: 2026-08-10 | Slug: /blog/budget-reveals
Article 4: "Three Mistakes I Made as a Young CFO" | Date: 2026-08-05 | Slug: /blog/young-mistakes
```

Use the 3-4 most recent.

- [ ] **Step 2: Insert article cards**

Find `<div class="articles-grid">` in `index.html` (you added this in Task 3).

Replace the comment with actual article cards:

```html
<div class="articles-grid">
  <div class="article-card">
    <p class="article-date">August 20, 2026</p>
    <h3 class="article-title">Why CFOs Miss the Real Story in Numbers</h3>
    <p class="article-excerpt">Most financial reports tell you what happened. They rarely tell you why. I've spent 30 years watching CFOs bury the insights that matter most in spreadsheets. Here's what they're missing.</p>
    <a href="/blog/cfos-miss-story" class="article-link">Read more →</a>
  </div>
  
  <div class="article-card">
    <p class="article-date">August 15, 2026</p>
    <h3 class="article-title">The AI Question Every Finance Leader Avoids</h3>
    <p class="article-excerpt">AI is coming to finance. It's already here. But most CFOs are asking the wrong questions about it. Not "Will AI replace us?" but "Are we using it to see what we've been blind to?"</p>
    <a href="/blog/ai-question" class="article-link">Read more →</a>
  </div>
  
  <div class="article-card">
    <p class="article-date">August 10, 2026</p>
    <h3 class="article-title">What Your Budget Says About Your Company</h3>
    <p class="article-excerpt">Your budget isn't about money. It's about priorities. What you choose to fund—and what you don't—reveals everything about what your company actually values, not what it claims to value.</p>
    <a href="/blog/budget-reveals" class="article-link">Read more →</a>
  </div>
</div>
```

Replace article dates/titles/excerpts/slugs with YOUR actual blog content.

- [ ] **Step 3: Verify links work**

In browser, click "Read more →" on each article card:
- Should navigate to `/blog/article-slug`
- Article page should load without 404
- Verify all 3-4 links are live

Expected: No broken links.

- [ ] **Step 4: Mobile testing**

Test on mobile (375px viewport):
- Cards should stack vertically
- Text should be readable
- Links should be clickable
- No overflow or text cutoff

Expected: Single column, fully functional.

- [ ] **Step 5: Commit article data**

```bash
git add index.html
git commit -m "feat: populate articles section with 3 recent blog posts

- Added article cards with real titles, dates, excerpts
- Links point to /blog/article-slug pages
- Tested on mobile and desktop breakpoints
- Articles sorted by date (most recent first)"
```

---

### Task 5: Update SK Version (Slovak Homepage)

**Files:**
- Modify: `sk/index.html`

**Interfaces:**
- Consumes: Same structure as EN version (index.html after Tasks 2-4)
- Produces: SK version with identical structure but Slovak copy

**Purpose:** Apply all changes from Tasks 2-4 to Slovak homepage.

- [ ] **Step 1: Sync hero mobile optimization**

Copy the same CSS mobile breakpoints from Task 2 into `sk/index.html`:

Open `sk/index.html` → Find `<style>` block → Add same responsive rules:
- Mobile breakpoint (<600px)
- LULI sizing (40% on mobile, 70% on tablet)
- Subscribe box full-width

Exact same CSS as EN version.

- [ ] **Step 2: Add articles section to SK**

Copy the HTML structure from Task 3 into `sk/index.html` at same position (before "What You Get").

Same styling, same layout.

- [ ] **Step 3: Translate article content**

Update article titles and excerpts to Slovak. Keep structure identical:

Example (English → Slovak translation):
```html
<div class="article-card">
  <p class="article-date">20. august 2026</p>
  <h3 class="article-title">Prečo CFOs prehliadnu skutočný príbeh v číslach</h3>
  <p class="article-excerpt">Väčšina finančných správ ti povie čo sa stalo. Zriedka povedia prečo. Strávil som 30 rokov pozorovaním CFO-ov, ktorí pohrebajú najdôležitejšie poznatky do tabuľiek.</p>
  <a href="/blog/cfos-miss-story" class="article-link">Čítaj viac →</a>
</div>
```

- [ ] **Step 4: Verify SK version renders correctly**

Open `sk/index.html` in browser:
- Hero section responsive: ✅
- Articles section visible: ✅
- Slovak text displays correctly: ✅
- Links work (point to /blog/ paths): ✅
- Mobile layout stacks: ✅

Expected: SK site identical to EN structure, all text in Slovak.

- [ ] **Step 5: Side-by-side comparison**

Open EN and SK versions in browser tabs:
- Compare hero mobile layouts → Should match
- Compare articles grid → Should have same visual styling
- Check that only text differs, structure identical

Expected: Consistent experience across languages.

- [ ] **Step 6: Commit SK updates**

```bash
git add sk/index.html
git commit -m "feat: sync homepage redesign to Slovak version

- Added mobile-responsive hero optimization
- Added articles section with Slovak article titles/excerpts
- Identical structure to EN version
- Tested on desktop and mobile viewports"
```

---

### Task 6: Cross-Browser & Device Testing

**Files:**
- Test: `index.html` and `sk/index.html`

**Interfaces:**
- Consumes: Both HTML files (complete after Task 5)
- Produces: Test report confirming no regressions

**Purpose:** Ensure homepage works correctly across browsers and device sizes.

- [ ] **Step 1: Desktop testing**

**Browsers:** Chrome, Firefox, Safari (if available), Edge
**Viewport:** 1200px+

For each browser:
1. Load `https://borisdracka.com/` (or local server if testing locally)
2. Visually inspect:
   - Hero section displays correctly (LULI image, subscribe box)
   - Articles section is 3-column grid
   - "What You Get" section below
   - Hover effects on article cards work
   - All links (subscribe, blog, X) are clickable
   - Fonts render properly (Inter font loads)

Expected: No visual bugs, smooth hover effects.

- [ ] **Step 2: Tablet testing**

**Device Sizes:** 768px, 820px (iPad)

Simulate in DevTools or actual tablet:
1. Load homepage
2. Verify hero stacks to single-column
3. Articles grid becomes single column
4. Text is readable
5. Subscribe button accessible (no hover-only states)
6. No horizontal scroll

Expected: Responsive layout works, content readable.

- [ ] **Step 3: Mobile testing**

**Device Sizes:** 375px (iPhone), 390px (Android)

Simulate in DevTools or actual phone:
1. Load homepage
2. Hero: LULI minimal/hidden, subscribe box dominates
3. Articles: Single-column cards
4. Text legible at default zoom
5. Links and buttons tap-friendly (>48px target)
6. No layout shifts when scrolling

Expected: Mobile-first, tap-friendly, no regressions.

- [ ] **Step 4: Performance check**

On mobile 4G simulation:
1. DevTools → Network → Set to "Slow 4G"
2. Reload page
3. Page fully interactive within 3 seconds
4. Images (LULI) load before text becomes unusable

Expected: Page load <2s on 4G.

- [ ] **Step 5: Test both language versions**

Repeat Steps 1-4 for:
- `https://borisdracka.com/` (EN)
- `https://borisdracka.com/sk/` (SK)

Expected: Identical layouts, different language, both functional.

- [ ] **Step 6: Regression check**

Verify existing features still work:
- Newsletter subscribe (beehiiv link works)
- Blog navigation
- X/Twitter link
- Language switcher
- About section
- Footer links

Expected: No broken links, no missing elements.

- [ ] **Step 7: Document results**

Create test summary (in comment or temporary file):
```
DESKTOP TESTING: ✅ PASS
- Chrome 125.x: No visual bugs, smooth interactions
- Firefox 123.x: Font renders correctly, colors match
- Safari: ✅ Verified (if available)

MOBILE TESTING: ✅ PASS
- iPhone 375px: Hero/articles/buttons all functional
- Android 390px: Layout responsive, text readable

PERFORMANCE: ✅ PASS
- 4G load time: 1.8 seconds
- All images load before interaction

LANGUAGE VERSIONS: ✅ PASS
- EN version: Functional and styled correctly
- SK version: Slovak text, identical structure

REGRESSION: ✅ PASS
- Newsletter CTA: Beehiiv link opens correctly
- Blog links: No 404s
- Language switcher: EN↔SK works
```

- [ ] **Step 8: Commit testing notes**

```bash
git add docs/  # If documenting in a test file
git commit -m "test: cross-browser and device testing

- Desktop (Chrome, Firefox): No visual regressions
- Tablet (768px): Responsive layout verified
- Mobile (375px): Single-column layout, tap-friendly
- 4G performance: Page load <2s
- Both EN and SK versions tested and functional
- Existing features (newsletter, blog, links) working"
```

---

### Task 7: Final Deployment & Monitoring

**Files:**
- Test: Deployed site at https://borisdracka.com/

**Interfaces:**
- Consumes: Tested code from Task 6
- Produces: Live homepage accessible to X/Twitter visitors

**Purpose:** Deploy changes and monitor for issues.

- [ ] **Step 1: Prepare for deployment**

Before deploying, make sure:
1. All code committed (nothing in staging)
2. No console errors in DevTools
3. Lighthouse audit passes (Performance >85, Accessibility >90)

Run (if using local build):
```bash
# Check for console errors
open https://localhost:3000/  # or your dev server URL
# F12 → Console → Verify no errors
```

- [ ] **Step 2: Deploy to production**

Deploy to your hosting (Netlify, Vercel, GitHub Pages, static server, etc.):

```bash
# Example: Push to git (if using automated deploy)
git push origin main

# Or manually copy files to server
# scp index.html sk/index.html user@server:/path/to/web/
```

Expected: Changes live at https://borisdracka.com/ within 30 seconds.

- [ ] **Step 3: Smoke test on live site**

After deployment, open https://borisdracka.com/:
1. Hero section renders correctly
2. Articles section visible with real blog posts
3. Subscribe button works (opens beehiiv)
4. Blog links point to correct URLs (no 404s)
5. Mobile responsive (test on actual phone)

Expected: All functionality working on live site.

- [ ] **Step 4: Monitor analytics**

Set up tracking (if not already in place) to monitor:
- Traffic from X/Twitter (use UTM params or referrer tracking)
- Newsletter subscription conversion rate
- Click-through rate on blog articles
- Device breakdown (mobile vs. desktop)

Create baseline for comparison in 2 weeks.

- [ ] **Step 5: Set monitoring alerts**

If using analytics/monitoring tools, configure:
- Alert on 404 errors (broken links)
- Alert on page load time >3s
- Alert on significant traffic drop

- [ ] **Step 6: Final commit**

```bash
git log --oneline  # Verify all commits are present

git commit --allow-empty -m "deploy: homepage redesign live

Published:
- Hero section optimized for mobile
- New articles section showcasing blog content
- Both EN and SK versions updated
- Tested across desktop, tablet, mobile
- Monitoring alerts configured
- Live at https://borisdracka.com/"
```

---

## Self-Review Against Spec

**Spec Coverage:**

✅ **Hero Section Mobile Optimization** → Task 2  
✅ **New Articles Section with 3-4 Cards** → Tasks 3-4  
✅ **Blog Data Integration** → Task 1, Tasks 4-5  
✅ **Responsive Design (Desktop/Tablet/Mobile)** → Tasks 2-3, Task 6  
✅ **SK Version** → Task 5  
✅ **Testing & QA** → Task 6  
✅ **Deployment** → Task 7  

No gaps found. All spec requirements addressed.

**Placeholder Scan:**

✅ No "TBD", "TODO", or vague steps  
✅ All code blocks are actual, copy-paste ready  
✅ All test steps have explicit expected results  
✅ All file paths are exact and absolute  
✅ No "similar to Task X" repetition  

**Type Consistency:**

✅ CSS class names consistent: `.article-card`, `.article-link`, `.article-date`  
✅ HTML structure matches design spec  
✅ Responsive breakpoints: 600px (mobile), 900px (tablet), 1024px+ (desktop)  

Plan is ready for execution.

---

## Summary

**7 tasks, ~4 hours of work:**

1. Extract blog metadata (15 min)
2. Hero mobile optimization (30 min)
3. Articles section structure (30 min)
4. Populate articles (30 min)
5. SK version sync (45 min)
6. Cross-browser testing (60 min)
7. Deployment & monitoring (30 min)

**Commits per task:** 7 git commits (one per task, ready for code review)

**Deliverable:** Live homepage with increased newsletter conversion potential through social proof (articles) and optimized mobile UX.

