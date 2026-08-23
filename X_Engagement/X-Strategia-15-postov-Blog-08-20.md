# X.com stratégia — najbližších 15 postov (naviazané na blog #08–#20)

**Zdroj tém:** Notion — *Zadania pre blog posty #08–#50 (metodika a briefy #08–#20)*. Blogy #21–#50 tam ešte nemajú zadanie, preto táto dávka pokrýva kickoff + blogy #08–#20 (13 blogov, ktoré majú hotový brief) + 1 evergreen recap post = **15 postov**.

**Formátové pravidlá platné pre všetkých 15 (z Fázy 2 + compliance guardrails):**
- Voľný X účet = **280 znakov limit na post**. Každý draft nižšie je overený skriptom a má rezervu (187–244 znakov), aby zniesol drobné úpravy bez prekročenia limitu.
- **Žiadne hashtagy** v hlavnom tweete.
- **Link na blog nikdy v hlavnom tweete** — vždy až v prvej odpovedi (chráni dosah, podľa tvojho doterajšieho playbooku).
- **Žiadne "I built / we built / our product / our team"** — všade je použité "tested / experimented / new post" v súlade s pravidlom 5.
- Posty #3, #10, #11, #13 spomínajú GitHub demo-agenta (`LuliBobo/cfo-agents`) — to je podľa rozhodnutia z 18. 8. 2026 potvrdené ako tvoj osobný nekomerčný projekt (🟡, nie 🔴). Zámerne je to len pri 4 z 15 postov, aby nevznikol dojem rozsiahlej paralelnej softvérovej aktivity (pravidlo 11) — nepridávaj GitHub zmienku do ďalších postov nad rámec tohto.
- Publikuj v deň, keď príslušný blog ide živo (link v prvej odpovedi vedie naň). Kickoff post (#1) ide pár dní pred Post #8.

---

## 1. Kickoff — pred Post #8 (re-engagement po pauze)

**Naviazané na:** návrat k sérii po niekoľkotýždňovej pauze (Post #7 bol live 21. 7.)

> Haven't posted here in a few weeks - the blog didn't stop. Post #7: the agent got a runway number wrong. Post #8, live this week, covers the opposite: an alert that was wrong the other way. Same lesson, different direction.

**Prvá odpoveď:** *(žiadny link, tento post len pripravuje pôdu)*
**Semafor:** 🟢 nízke riziko — žiadne CTA, žiadne tvrdenie o vlastníctve, len anons.

---

## 2. Post #08 — The Alert That Was Wrong

**Uhol z briefu:** falošný poplach, alert fatigue, kontextové prahy.

> An AI agent flagged a number that looked wrong. It wasn't - a one-off client deposit had skewed a ratio for a week. False alarms cost trust the same way missed errors do. People start ignoring alerts. New post: what changed after that one.

**Prvá odpoveď:** `Full story: borisdracka.com/blog/post-08`
**Semafor:** 🟢 nízke riziko — zhoduje sa s pre-publish hodnotením blogu (🟢 v Notione). Scenár je dostatočne všeobecný, nepotrebuje samostatný composite disclaimer v tweete (ten je už v samotnom blogu).

---

## 3. Post #09 — The FX Loss Nobody Sees Until Month-End

**Uhol z briefu:** FX expozícia neviditeľná do uzávierky; GitHub demo (`fx_monitor_agent.py`).

> FX exposure is invisible until the month-end close - by then the loss already happened. I've been testing what daily tracking of open FX positions would actually take. Small experiment, sample data, on GitHub. New post on the blind spot itself.

**Prvá odpoveď:** `Full post + the small script I tested this on: borisdracka.com/blog/post-09`
**Semafor:** 🟡 treba držať wording — "testing", nie "built/deployed"; žiadne €2–5k číslo, žiadny názov produktu. Toto zodpovedá schválenej verzii z Notionu.

---

## 4. Post #10 — The Cash Sitting in Your Account Earning Nothing

**Uhol z briefu:** procesné/behaviorálne dôvody nečinnej hotovosti.

> Idle cash on a current account earns nothing. It's rarely about not knowing that - nobody owns the daily visibility, and moving it feels risky. New post on why cash sits still even when everyone agrees it shouldn't.

**Prvá odpoveď:** `Full post: borisdracka.com/blog/post-10`
**Semafor:** 🟢 nízke riziko — bez pôvodného "priemerná SK firma má €500k" tvrdenia z X kalendára, žiadne konkrétne číslo v tweete.

---

## 5. Post #11 — Budget vs Actual Once a Quarter Is a Rear-View Mirror

**Uhol z briefu:** frekvencia kontroly ako opakujúci sa rámec (rovnaký ako FX/cash).

> Budget vs Actual, checked once a quarter, tells you where you stood three months ago. Same blind-spot pattern as cash and FX - the gap isn't the numbers, it's how often you check them. New post.

**Prvá odpoveď:** `Full post: borisdracka.com/blog/post-11`
**Semafor:** 🟢 nízke riziko.

---

## 6. Post #12 — Most AI-in-Finance Projects Fail for a Boring Reason

**Uhol z briefu:** osobný názor, prečo AI projekty vo financiách zlyhávajú (bez "my/náš tím").

> Most AI-in-finance projects don't fail on the model. They fail because success gets defined by technical teams using technical metrics - not by what actually moves the P&L. New post on the boring reason these projects stall.

**Prvá odpoveď:** `Full post: borisdracka.com/blog/post-12`
**Semafor:** 🟢 nízke riziko — silný názor je v poriadku (pravidlo 14), žiadne "95 %" tvrdenie, žiadne "my hovoríme".

---

## 7. Post #13 — Your Revolving Credit Line Is Probably Costing You More Than It Should

**Uhol z briefu:** mechanizmus timingu čerpania/splácania, nie produkt.

> A revolving credit line is expensive exactly when you don't need it drawn. The timing question isn't about the facility - it's whether you have daily cash visibility to know when to pay it down. New post.

**Prvá odpoveď:** `Full post: borisdracka.com/blog/post-13`
**Semafor:** 🟢 nízke riziko — bez "€30 000/rok" garantovaného čísla.

---

## 8. Post #14 — None of These Problems Are Big Alone. Together, They Are.

**Uhol z briefu:** syntéza posledných štyroch tém. Pôvodný zdroj bol 🔴 (lead-gen CTA "vypočítam ti presné číslo") → po prepise 🟡.

> FX losses. Idle cash. Quarterly budget checks. An expensive credit line. None of these breaks a company alone. Stacked together over a year, they quietly do. New post connecting the last four.

**Prvá odpoveď:** `Full post: borisdracka.com/blog/post-14`
**Semafor:** 🟢 nízke riziko v tejto verzii — CTA "vypočítam ti presné číslo" je úplne vypustené, zostáva len syntéza. Nepridávaj sem žiadnu výzvu typu "napíš mi svoje číslo" ani odkaz na kalkuláciu — presne toto bolo dôvodom pôvodného 🔴.

---

## 9. Post #15 — Ten Finance Functions. One Person. That Math Never Worked.

**Uhol z briefu:** prepojovací post naprieč sériou (Post #3, #4–5, #9–10, #7).

> One person covering ten finance functions was never a staffing plan - it was a gap nobody named. New post maps what a lean finance function actually has to cover, and where coverage usually breaks first.

**Prvá odpoveď:** `Full post: borisdracka.com/blog/post-15`
**Semafor:** 🟢 nízke riziko — žiadna zmienka o "19 agentoch" alebo AI Finance Stack, len odkaz na vlastnú sériu postov.

---

## 10. Post #16 — The Board Pack Takes Two Days to Build. It Shouldn't.

**Uhol z briefu:** prečo príprava board packu trvá dlho; GitHub demo (`board_pack_agent.py`).

> Building a board pack still eats two days most months - pulling numbers, formatting, writing commentary. I tested whether that pipeline could compress. Small experiment, sample data. New post on where the two days actually go.

**Prvá odpoveď:** `Full post + the script I tested: borisdracka.com/blog/post-16`
**Semafor:** 🟡 rovnaký GitHub-wording flag ako Post #9 — "tested", nie "built for clients"; časovú úsporu (4h vs 2 dni) neuvádzaj v tweete ako fakt, len v blogu ako ilustráciu.

---

## 11. Post #17 — The Payment That Didn't Look Like the Others

**Uhol z briefu:** zámerný protipól k Post #8 (skutočne zachytená anomália); GitHub demo (`anomaly_watch_agent.py`).

> Post #8 was a false alarm. This one isn't. One payment didn't match the pattern of everything else from that vendor - amount and timing both off. New post on what catching it, for real this time, actually looks like.

**Prvá odpoveď:** `Full post: borisdracka.com/blog/post-17`
**Semafor:** 🟡 GitHub demo flag — inak nízke riziko, žiadny produktový názov ("AI Fraud & Anomaly Watcher" z pôvodného zdroja je vypustený).

---

## 12. Post #18 — You're Probably Selling Something Below Cost Right Now

**Uhol z briefu:** viditeľnosť marže na úrovni produktu/zákazníka.

> Margin at the product or customer level is one of the last things most finance teams see clearly - which means you can be selling something below cost right now and not know it. New post.

**Prvá odpoveď:** `Full post: borisdracka.com/blog/post-18`
**Semafor:** 🟢 nízke riziko.

---

## 13. Post #19 — Inside a 13-Week Rolling Cash Forecast

**Uhol z briefu:** čisto technický deep-dive, bezpečná všeobecne známa technika; GitHub demo (`rolling_forecast_agent.py`).

> A 13-week rolling cash forecast is one of the oldest tricks in finance and still one of the most underused. New post: what it actually is, how it's built week by week, and a small sample-data version I tested on GitHub.

**Prvá odpoveď:** `Full post + the sample-data version: borisdracka.com/blog/post-19`
**Semafor:** 🟡 GitHub demo flag — "aktualizovaný každý deň" z pôvodného zdroja je zmäkčené preč, tweet to vôbec nespomína ako fakt o frekvencii.

---

## 14. Post #20 — One Person, Five Companies, Zero Days Off (míľnik)

**Uhol z briefu:** reflexívny míľnikový post, NIE porovnanie ceny s konkurenčným produktom (pôvodný zdroj bol najrizikovejší z celej dávky, 🔴→🟡 po Borisovom prepise).

> Post #20. Twenty weeks of writing down what happens when a 30-year CFO tests AI in finance - the wins, the wrong alerts, the boring failures. This one's about the ceiling: what one person, spread thin, structurally can't cover.

**Prvá odpoveď:** `Full post: borisdracka.com/blog/post-20`
**Semafor:** 🟢 v tejto verzii — žiadne porovnanie ceny fractional CFO vs "19 agentov", žiadny konkurenčný produkt. Nepridávaj do tohto tweetu ani do odpovedí pod ním žiadne číslo v eurách ani porovnanie s cenou inej služby — to bol presný dôvod pôvodného 🔴 hodnotenia.

---

## 15. Evergreen recap (po Post #20, nie viazaný na konkrétny nový blog)

**Účel:** noví followeri prídu cez outbound engagement bez kontextu — tento post ich nasmeruje na začiatok série.

> 20 posts in: a false alert, an FX blind spot, idle cash, a board pack that ate two days, a payment that didn't fit the pattern. If you're new here - this is a 30-year CFO's honest, in-progress record of testing AI in finance.

**Prvá odpoveď:** `Start from Post #1: borisdracka.com/blog/post-01`
**Semafor:** 🟢 nízke riziko.

---

## Čo sledovať priebežne (pripomienka z compliance guardrails)

- Pri postoch #3, #10, #11, #13 (GitHub) nikdy nepridávaj vetu typu "you can use this too" ani odkaz na cenu/objednávku — repozitár je osobný nekomerčný projekt, nie produkt na predaj.
- Pri Post #8 a #17 (dvojica falošný/skutočný poplach) drž scenáre všeobecné — ak by si chcel doplniť konkrétnejší detail, over najprv, či ide o modelový/composite príklad (pravidlo 10) a označ to tak.
- Pri Post #14 a #20 — toto sú presne tie dva, ktoré boli pôvodne 🔴. Držať sa schválenej verzie vyššie, nepridávať späť cenové porovnanie ani CTA na výpočet straty.
- Blogy #21–#50 zatiaľ nemajú zadanie v Notione — akonáhle vznikne, viem pripraviť ďalšiu dávku X postov rovnakým postupom.
