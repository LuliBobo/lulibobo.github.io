---
name: sken-x
description: >
  Spusti denný X.com engagement sken pre účet @BorisDracka. Aktivuj VŽDY, keď
  používateľ napíše "sken X", "skenuj X", "scan X", "X sken", "sken na X",
  "nájdi posty na X", "X engagement", alebo požiada o nájdenie relevantných
  X/Twitter postov na komentovanie k téme CFO / financie / AI vo financiách /
  FP&A / cash flow / SMB. Skill nájde posty za posledných 24 h, oskóruje ich,
  navrhne komentáre a zaloguje. Nikdy nepostuje automaticky.
---

# Sken X — denný engagement workflow pre @BorisDracka

Toto je spúšťač denného X.com skenu. Plná konfigurácia (kľúčové slová, cieľové
účty, skórovanie, pravidlá komentárov, limity) je v playbooku — **vždy si ho najprv prečítaj**:

`/Users/macbookprosukromne/Documents/ABOUT me/borisdracka.com/X_Engagement/X_Engagement_Playbook.md`

Log komentárov (kontrola duplicít + denný limit):

`/Users/macbookprosukromne/Documents/ABOUT me/borisdracka.com/X_Engagement/x_comment_log.md`

**Napojené ciele (projekt Sken X.com):**
- Notion zdroj pravdy: „🔎 Projekt Sken X.com — Kompletný prehľad" — page id `394a8d65-a6ac-81d1-bed4-f42cd59f1570`
- Živý dashboard: artifact `x-engagement-tracker`
- Každý nový/aktualizovaný komentár drž synchronizovaný naprieč všetkými tromi (log + Notion + artifact) — pozri sekciu „automatický update reťazec" nižšie.

**Fallback:** ak lokálne súbory nie sú dostupné (priečinok nie je pripojený),
načítaj playbook, log aj agregáty z Notion stránky vyššie — je to plnohodnotný zdroj pravdy.

## Postup po spustení („sken X")

1. **Načítaj playbook a log** (cesty vyššie). Z logu zisti, koľko komentárov už
   bolo dnes (limit 2/deň) a pod ktorými postami už komentár existuje (nenavrhuj duplicity).

2. **Over Chrome** — používateľ musí byť prihlásený na x.com cez Claude in Chrome.
   Ak extension nie je pripojený, povedz to a zastav.

3. **Skenuj posty za posledných 24 h** (`since:` = dnešok mínus 1 deň). Priorita:
   - **PRIMÁRNY cieľ: čerstvé posty stredných účtov (~1–20k followerov).**
     Obrie účty (100k+, @BoucherNicolas ~3M) = len monitoring tém, NEkomentovať prioritne.
     @ConnorAbene = monitoring (self-promo funnel, komentáre #3 a #5 pod ním flopli).
   - Tvrdé pravidlo: **„Radšej čerstvý stredný účet než starý obrí post."**
     30 min starý post účtu ~5k > 12 h starý post účtu 1M+.
   - Cieľové účty z playbooku (sekcia „Cieľové účty") — ich posty + odpovede.
   - Presná fráza **"FP&A"** funguje najlepšie; generické slová (CFO, AI agents,
     controller, treasury, runway) ťahajú akciový/crypto/herný/politický šum — filtruj ho.
   - Použi vyhľadávacie dotazy z playbooku cez `https://x.com/search?q=...&f=live`.

4. **Oskóruj** každý post podľa tabuľky v playbooku (0–100, prah 70). Vyrad
   crypto, politiku, hiring oznamy bez diskusie, posty 200+ odpovedí, mimo témy.
   Navyše over: **konverzuje OP s komentátormi pod svojimi postami?** Ak OP
   nereaguje na nikoho alebo si pridáva self-promo odpovede, zniž skóre —
   skorý + prvý komentár nestačí, ak OP nekonverzuje (učenie z komentára #5).

5. **Vyber Top 5** (alebo menej, ak toľko kvalitných nie je — buď úprimný, nepchaj šum).
   Pre každý uveď: skóre, link, autor + dosah, vek, prečo, a **3 varianty komentára**
   (practical_specific / cfo_experience / contrarian_nuanced) podľa pravidiel v playbooku
   (15–40 slov, max 280 znakov — free účet, žiadne hashtagy/linky, nezačínať „I",
   konkrétne číslo). Voliteľná otázka: **konkrétna / osobná „confession" otázka**,
   nie abstraktná — výrazne vyššia šanca, že OP odpovie (učenie z komentára #4).

6. **Humanizácia:** na finálny vybraný komentár použi skill `reddit-humanize-comment`,
   nech znie 100 % ľudsky.

7. **Nepostuj** — komentár postuje používateľ ručne.

## „postol som #X" → automatický update reťazec (POVINNÉ)

Keď používateľ napíše **„postol som #X [variant]"** (alebo „postnuté #X", „hotovo #X"),
vykonaj VŠETKY tri kroky za sebou, bez pýtania sa:

1. **Doplň log** `x_comment_log.md`: nový riadok v „História komentárov"
   (# poradie, dátum, link na post, autor + veľkosť účtu, variant, skrátený komentár,
   likes 0, replies 0, OP „Nie (zatiaľ)") + zvýš „Denný počet" pre dnešný dátum.

2. **Aktualizuj Notion stránku** „🔎 Projekt Sken X.com — Kompletný prehľad"
   (page id `394a8d65-a6ac-81d1-bed4-f42cd59f1570`): pridaj riadok do tabuľky
   v sekcii 10 (Comment log) a prepočítaj agregáty v sekcii 12 (počet, views spolu,
   priemer, likes, OP reply rate, priemer obrie vs. stredné).

3. **Prekresli dashboard** — artifact `x-engagement-tracker`: pridaj objekt do poľa
   `DATA` v HTML (`n, date, author, size: "big"|"mid", variant: "A"|"B"|"C",
   views, likes, replies, op, url`), znovu vygeneruj HTML súbor a zavolaj
   `update_artifact` (id `x-engagement-tracker`). Pri novom komentári sú views/likes 0,
   kým ich neskontrolujeme.

> Mapovanie účtu na `size`: obrí (100k+/celebrita) = `big`; stredný (~1–30k) = `mid`.

Na **„skontroluj #X"** otvor post cez Claude in Chrome, zisti views/likes/replies a či OP
odpovedal, a rovnakým reťazcom (log → Notion → artifact) doplň aktualizované čísla.

## Bezpečnosť
- Max 1–2 komentáre/deň, rozostup 60–120 min.
- Žiadne auto-postovanie, žiadne linky v prvej odpovedi, žiadna politika/crypto návnada.
- Pri akomkoľvek varovaní/rate-limite/captche od X → okamžite stop a nahlás.
