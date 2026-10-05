#!/usr/bin/env python3
"""Generate feed.xml (EN) and sk/feed.xml (SK) Atom feeds from BlogPosting JSON-LD.

Run from the repo root after publishing a post:  python3 build-feed.py
Posts with a future datePublished are left out until their date has passed.
"""
import glob
import html
import json
import re
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent
BASE = "https://borisdracka.com"
LD_RE = re.compile(r'<script type="application/ld\+json">(.*?)</script>', re.S)

FEEDS = [
    {"dir": "blog", "out": "feed.xml", "path": "/feed.xml", "home": "/blog",
     "title": "CFO Unfiltered — The CFO & AI Series",
     "subtitle": "One CFO's honest account of testing AI in finance.", "lang": "en"},
    {"dir": "sk/blog", "out": "sk/feed.xml", "path": "/sk/feed.xml", "home": "/sk/blog",
     "title": "CFO Unfiltered — The CFO & AI Series (SK)",
     "subtitle": "Úprimný denník jedného CFO o testovaní AI vo financiách.", "lang": "sk"},
]


def posts(folder):
    now = datetime.now(timezone.utc)
    items = []
    for f in sorted(glob.glob(str(ROOT / folder / "post-[0-9][0-9].html"))):
        for raw in LD_RE.findall(Path(f).read_text(encoding="utf-8")):
            data = json.loads(raw)
            if data.get("@type") != "BlogPosting":
                continue
            published = datetime.fromisoformat(data["datePublished"])
            if published > now:
                continue
            modified = datetime.fromisoformat(data.get("dateModified", data["datePublished"]))
            items.append({**data, "_pub": published, "_mod": max(modified, published)})
    return sorted(items, key=lambda p: p["_pub"], reverse=True)


def e(text):
    return html.escape(text, quote=True)


def build(feed):
    items = posts(feed["dir"])
    updated = max((p["_mod"] for p in items), default=datetime.now(timezone.utc))
    out = ['<?xml version="1.0" encoding="UTF-8"?>',
           f'<feed xmlns="http://www.w3.org/2005/Atom" xml:lang="{feed["lang"]}">',
           f'  <id>{BASE}{feed["path"]}</id>',
           f'  <title>{e(feed["title"])}</title>',
           f'  <subtitle>{e(feed["subtitle"])}</subtitle>',
           f'  <link rel="self" type="application/atom+xml" href="{BASE}{feed["path"]}" />',
           f'  <link rel="alternate" type="text/html" href="{BASE}{feed["home"]}" />',
           f'  <updated>{updated.isoformat()}</updated>',
           '  <author><name>Boris Dračka</name><uri>https://borisdracka.com/</uri></author>']
    for p in items:
        out += ['  <entry>',
                f'    <id>{e(p["url"])}</id>',
                f'    <title>{e(p["headline"])}</title>',
                f'    <link rel="alternate" type="text/html" href="{e(p["url"])}" />',
                f'    <published>{p["_pub"].isoformat()}</published>',
                f'    <updated>{p["_mod"].isoformat()}</updated>',
                f'    <summary>{e(p["description"])}</summary>',
                '  </entry>']
    out.append('</feed>')
    (ROOT / feed["out"]).write_text("\n".join(out) + "\n", encoding="utf-8")
    print(f'{feed["out"]}: {len(items)} entries')


if __name__ == "__main__":
    for fd in FEEDS:
        build(fd)
