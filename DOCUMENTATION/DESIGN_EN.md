# CFO Unfiltered Homepage Redesign — Conversion-First Design
**Date**: August 23, 2026  
**Author**: Boris Dračka  
**Status**: Design Approved  

---

## Overview

This design document outlines a homepage redesign for **borisdracka.com** focused on increasing newsletter subscriber conversions from X/Twitter traffic. The core principle is **"Speed-First with Social Proof"** — visitors from X can subscribe in seconds, but see immediate evidence of content quality through recent blog articles.

---

## Goals & Success Criteria

### Primary Goal
Increase newsletter subscriber conversion rate from X/Twitter traffic by showcasing both:
1. **Clear value proposition** (fast, obvious subscribe)
2. **Social proof** (latest blog articles demonstrating content quality)

### Success Metrics
- Faster time-to-subscribe from page load
- Increased blog article click-through rate (people reading content, then subscribing)
- Better qualified subscribers (they've seen proof of content quality)
- Mobile conversion rate improvement

---

## Current State

**What's Working**:
- Clean, professional design with strong brand identity
- Hero section with clear messaging
- Responsive design across devices
- Proper SEO metadata and security headers
- Multi-language support (EN/SK)

**What's Missing**:
- No blog content on homepage (no social proof)
- No indication of content quality or frequency
- Long about section may not be necessary for X/Twitter visitors
- Subscribe box could be more prominent in hero

**Problem to Solve**:
X/Twitter visitors don't know the newsletter exists or what quality to expect. They need immediate proof that subscribing is worth their time.

---

## Proposed Design: "Speed-First with Proof"

### Section-by-Section Layout

#### 1. Navigation (No Changes)
- Logo + "CFO Unfiltered" text
- Blog link
- X (@BorisDracka) link
- Subscribe button
- Language switcher (EN/SK)
- Remains sticky at top

#### 2. Hero Section — Optimized for Conversion

**Layout**: Two-column (desktop), single-column (mobile)

**Left Column (Visual)**:
- Your profile image (animated character)
- "WEEKLY NEWSLETTER" badge
- Remains as-is, may be slightly reduced in size to emphasize right column

**Right Column (Call-to-Action)**:
- **Kicker** (orange, uppercase): "CFO UNFILTERED"
- **Headline**: "What no one tells you about running numbers at the top"
- **Subheading** (single strong sentence): "30 years as CFO. Now I'm writing what I wish someone had told me on day one."
- **Subscribe Box** (enhanced, more prominent):
  - Label: "Get one sharp insight every week"
  - Email input field (minimal, clean)
  - Button: "Subscribe — It's free" (large, orange, clear)
  - Trust note: "No spam. Unsubscribe anytime."

**Purpose**: Visitor lands, sees value, subscribes in < 10 seconds.

#### 3. New Section: "Latest Insights" — Social Proof

**Position**: Immediately after hero (before "What You Get")

**Layout**: 
- Grid of 3-4 most recent blog articles
- Desktop: 3 columns, Mobile: 1 column

**Each Article Card**:
- **Article Title** (clickable link to full article)
- **Short Excerpt** (1-2 sentences only)
- **Published Date**
- **"Read more →"** link (orange)

**Visual Design**:
- Clean cards with subtle border (like existing "What You Get" cards)
- No images (speed)
- Consistent with existing typography

**Purpose**: 
- Shows content quality immediately
- Gives visitors option: "Subscribe now" OR "Read one first"
- Acts as alternative conversion path

**Technical Note**: 
- This section will pull from your `/blog` folder or beehiiv RSS feed
- Display 3-4 most recent articles
- Auto-updates when new articles are published

#### 4. "What You Get" Section — Minor Adjustments

**No layout changes**, but reconsider order:
- Move this after "Latest Insights" (or keep as-is if preferred)
- The three numbered cards remain: The hard truths, Real patterns, One insight/week
- Still emphasizes value proposition

#### 5. About Section — Streamlined

**Current state**: Dark background, centered text, 3 paragraphs

**Proposed change**: Keep but shorten
- Same dark background
- Keep headline: "30 years of CFO experience. Still learning."
- Reduce to 2 paragraphs maximum
- Focus on: "I've spent 30 years as CFO... Now I'm writing about it"

**Purpose**: For visitors who want credibility before subscribing (not everyone from X needs this)

#### 6. Final CTA Section — No Changes

"Ready to think like a CFO?" remains as powerful closer for undecided visitors.

#### 7. Footer — No Changes

---

## User Journey

### Typical X/Twitter Visitor Flow

1. **Sees your tweet** → Clicks link
2. **Lands on homepage** → Sees hero + profile + headline (instant impression)
3. **Two paths**:
   - **Path A (Quick Subscribe)**: Reads value prop → Fills email → Subscribes (10-30 seconds)
   - **Path B (Proof First)**: Scrolls down → Sees latest articles → Reads one → Impressed → Subscribes (2-5 minutes)
4. **Either way**: Joins newsletter with high confidence about content quality

---

## Design Specifications

### Color Palette (No Changes)
- Orange accent: `#E8562A`
- Dark: `#111111`
- Mid-gray: `#555555`
- Light bg: `#F7F5F2`
- White: `#FFFFFF`
- Border: `#E8E5E0`

### Typography (No Changes)
- Font: Inter (Google Fonts)
- Weights: 400, 500, 700, 800, 900
- Hero h1: `clamp(2.4rem, 3.5vw, 3.6rem)`

### Articles Section Styling

```
.articles-section {
  padding: 80px 48px;
  max-width: 1100px;
  margin: 0 auto;
}

.articles-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px;
  margin-top: 48px;
}

.article-card {
  border: 1px solid var(--border);
  padding: 32px;
  border-radius: 12px;
  transition: box-shadow 0.2s, transform 0.2s;
}

.article-card:hover {
  box-shadow: 0 4px 12px rgba(0,0,0,0.05);
  transform: translateY(-2px);
}

.article-date {
  font-size: 0.8rem;
  color: var(--mid);
  margin-bottom: 12px;
}

.article-title {
  font-size: 1.15rem;
  font-weight: 700;
  line-height: 1.4;
  margin-bottom: 12px;
}

.article-excerpt {
  font-size: 0.95rem;
  color: var(--mid);
  line-height: 1.6;
  margin-bottom: 16px;
}

.article-link {
  color: var(--orange);
  text-decoration: none;
  font-weight: 600;
  font-size: 0.9rem;
  transition: color 0.2s;
}

.article-link:hover {
  color: var(--orange-d);
}

@media (max-width: 900px) {
  .articles-grid {
    grid-template-columns: 1fr;
    gap: 16px;
  }
  
  .article-card {
    padding: 24px;
  }
}
```

### Responsive Breakpoints
- Desktop: Full 3-column layout
- Tablet (768px-900px): 2 columns
- Mobile (<768px): 1 column

---

## Content Requirements

### Blog Integration
- Pull 3-4 most recent articles from `/blog` folder
- Extract: Title, excerpt (first 1-2 sentences), publish date
- Link to full article page

### Fallback
- If blog is empty or errors: Show placeholder message "Check back soon for fresh insights"

---

## Implementation Phases

### Phase 1: Hero Optimization
- Enhance subscribe box styling
- Adjust headline/subtext messaging
- Test mobile responsiveness

### Phase 2: Blog Section Development
- Build articles grid component
- Integrate blog data source (static or dynamic)
- Style article cards with hover effects
- Ensure mobile responsiveness

### Phase 3: Full Integration & Testing
- A/B test subscribe button placement/colors
- Test on various devices (mobile, tablet, desktop)
- Verify conversion tracking
- Test both EN and SK versions

---

## Technical Considerations

### Dynamic Blog Content
- **Option A**: Parse `/blog` folder and extract metadata (static generation)
- **Option B**: Pull from beehiiv RSS feed (if available)
- **Option C**: Manual list of featured articles in HTML

**Recommendation**: Option A or C (static generation is simpler, faster)

### Performance
- Keep article cards lightweight (no images)
- Use CSS transitions (not animations) for hover effects
- Lazy-load blog section if needed

### SEO
- Add structured data for articles (`BlogPosting` schema)
- Ensure article titles are SEO-friendly
- Links to blog articles help with internal linking structure

---

## Risks & Mitigation

| Risk | Impact | Mitigation |
|------|--------|-----------|
| Blog section looks empty if no recent articles | Low engagement, looks unmaintained | Keep blog regularly updated; consider scheduled posts |
| Articles distract from subscribe CTA | Lower conversion | Keep article cards subtle; primary CTA remains in hero |
| Mobile layout breaks with long article titles | Poor mobile UX | Test titles; truncate if needed with ellipsis |
| Visitor skips hero, scrolls straight to articles | Fewer direct hero conversions | That's okay — they convert from articles instead |

---

## Success Measurement

After implementation, track:
1. **Conversion Rate**: % of X/Twitter traffic → newsletter subscribers
2. **Time-to-Subscribe**: How quickly visitors subscribe (aim: <30 sec from X click)
3. **Blog Click-Through**: How many click "Read more" on article cards
4. **Scroll Depth**: Do visitors scroll to article section? (Yes = good)
5. **Device Performance**: Desktop vs. mobile conversion rates

---

## Notes for Implementation

- This redesign is **non-breaking** — existing elements remain functional
- All changes are **additive** (hero stays, we add articles section)
- Both **EN and SK versions** need updates
- Newsletter CTA consistency: Same messaging across all channels
- Test subscribe flow end-to-end (email capture → confirmation)

---

## Sign-Off

**Design Status**: ✅ Approved by Boris Dračka  
**Ready for**: Implementation planning & development

