# 🐦 X.com Engagement Workflow — @BorisDracka

Verzia X tvojho Reddit „Quality Automation" systému. Cieľ: pri 30 min denne nájsť
relevantné posty k tvojej téme za posledných 24 h, napísať kvalitný komentár a tak
sa pri **0 followeroch dostať pred publikum** väčších účtov.

> **Ako to spustím:** napíš do chatu **`sken X`** (alebo „skenuj X", „scan X").
> Ja prejdem tento playbook v tvojom prihlásenom Chrome a dodám ti hotový zoznam
> postov + draft komentáre. **Nikdy nepostujem automaticky — postneš ty.**

---

## 0. Prečo to nie je 1:1 Reddit skript

| | Reddit systém | X workflow |
|---|---|---|
| Zdroj dát | verejné `.json` endpointy | tvoj prihlásený Chrome (Claude in Chrome) |
| API kľúč | netreba | netreba (využíva session) |
| Postovanie | manuálne (copy-paste) | manuálne (ty) |
| Riziko banu | nízke | stredné → preto **prísne limity nižšie** |
| Generovanie | Claude API | Claude priamo v Cowork |

X agresívne deteguje automatizáciu. Preto: **žiadne auto-postovanie, max 1–2 komentáre/deň,
ručné odoslanie tebou, rozostup medzi komentármi.**

---

## 1. Konfigurácia

```yaml
account:        "@BorisDracka"
site:           borisdracka.com
positioning:    "30 rokov CFO, teraz staviam AI nástroje pre finančné tímy"
language:       EN (primárne), SK voliteľne
fáza:           Fáza 2 — budovanie publika (0 followerov → prvých 50)

limity:
  max_komentarov_den:   2        # konzervatívne, nový účet
  rozostup_komentarov:  60–120 min
  min_skore_postu:      70/100
  dlzka_komentara:      15–40 slov   # X je stručný, kratšie ako Reddit
  top_n:                5            # koľko postov ti dodám na výber
```

### Kľúčové slová / témy (EN)
```
CFO, fractional CFO, AI CFO, FP&A, financial planning,
cash flow, cash flow forecast, 13-week forecast, rolling forecast,
DSO, accounts receivable, overdue invoices, treasury, idle cash,
runway, burn rate, finance automation, AI agent, AI in finance,
finance AI, controller, month-end close, financial reporting,
small business finance, SMB finance, Xero, QuickBooks, NetSuite
```

### Hashtagy na sledovanie
`#CFO  #FPandA  #Finance  #AIinFinance  #CashFlow  #FinTech  #Accounting`

### Cieľové účty (kurátorský zoznam — skenuj PRIMÁRNE ich profily)

> **🔑 Hlavné učenie (komentáre #1–#6):** Dôležitejšie ako téma alebo čerstvosť je, **či účet reálne
> KONVERZUJE** — teda či OP odpovedá komentátorom, ktorí ho nesledujú. Keyword search dotazy dávajú
> väčšinou stock/crypto/AI-hype šum. **Reálne picky chodia z overených konverzujúcich mid účtov.**
> Preto: **pri skene skenuj najprv profily z TIER 1 nižšie**, až potom keyword dotazy ako doplnok.

**Ako klasifikovať účet (test „konverzuje"):** otvor jeho posledný post s 5–30 replies. Odpovedá OP
vecne aj ľuďom, ktorých nesleduje? → **TIER 1**. Odpovedá len vlastnou promo/CTA odpoveďou alebo
neodpovedá vôbec? → **funnel/monitor**. 100k+ follower účet → **giant/monitor** (komentár zapadne).

- **TIER 1 — konverzujúce mid účty (~1–30k) → PRIMÁRNY cieľ, skenuj ich profily každý sken:**
  ```
  @ron_ecomm         # e-comm owner/operator, verified. REÁLNE odpovedá replierom. Najlepšie výsledky (#4=102 zobr., #6). ✅ overené
  @____________      # doplň, keď sken nájde ďalší účet, ktorý spĺňa test „konverzuje"
  @____________
  @____________
  @____________
  ```
- **TIER 2 — mid účty, relevantné, ale zatiaľ neoverené že konverzujú (skús + sleduj výsledok):**
  ```
  @albertmalikov     # Founder/CEO Stacks, AI pre finančné tímy (pozn.: posledne neaktívny)
  ```
- **🆕 HIGH-REACH / riedke vlákno — NEkonverzuje, ale dáva najlepší dosah (zavedené 2026-07-19):**
  ```
  @drewfallon12      # Drew Fallon, CEO Iris (AI CFO), ex-CFO, ~20k. NEODPOVEDÁ nikomu (0/4 pod #7),
                     # posty = news-recapy s Iris brandingom = lead-gen. ALE: veľký reach + málo
                     # odpovedí → #7 dal 218 zobr. + 1 like = REKORD SÉRIE. Komentuj ďalej,
                     # len neočakávaj odpoveď OP. Ideálny cieľ pre `humor_oneliner`.
  ```
  > Táto kategória je dôsledok učenia z #7: **účet nemusí konverzovať, ak jeho posty majú
  > vysoký `dosah_na_odpoved`.** Pri skene ich hodnoť podľa pomeru, nie podľa správania OP.
- **FUNNEL / monitor — pekné on-topic posty, ale NEkonverzuje (self-promo odpovede, lead-gen):**
  ```
  @ConnorAbene       # fractional CFO ~29k. Skvelé témy (cash/AR/close), ALE odpovedá vlastnou promo (free course/templates). #3=21, #5=21 zobr., OP nikdy neodpovedal. Komentuj len výnimočne.
  ```
- **GIANT — len monitoring tém, NEkomentovať (komentár sa nedistribuuje):**
  ```
  @BoucherNicolas    # Nicolas Boucher — "AI for Finance", ~3M. Komentár #2 = 0 trakcia.
  @BojanRadojici10   # AI & Tech Strategy for CFOs, FP&A/modeling. Komentár #1 = 0 trakcia.
  ```
- **Firmy / produkty (sekundárne, viac PR než diskusia):**
  ```
  @IrisFinanceCo  @_StacksAI  @airwallex  @TheTranscript_ (earnings quotes = stock, slabý fit)
  ```
- **Rast zoznamu:** vždy keď sken nájde účet, ktorý prejde testom „konverzuje", navrhnem ho doplniť
  do TIER 1. Účet, ktorý 2× nedal engagement, presuniem do FUNNEL/monitor.

> **🎯 AKTÍVNY CIEĽ (nastavené 2026-06-28, platí pre najbližšie ~3 skeny):** pri každom skene aktívne
> hľadať nové TIER 1 účty z **komunity okolo @ron_ecomm** (SMB operátori / e-comm / finance-ops, ktorí
> reálne diskutujú). Postup: pozri, komu @ron_ecomm odpovedá / koho reposts / kto kvalitne komentuje pod
> jeho postami → otvor kandidátov profil → test „konverzuje" → ak prejde, doplň do TIER 1.
> **Cieľ: do 3 skenov pridať min. 2 nové overené TIER 1 účty.** Keď je splnené, tento blok zmaž.
> Progres: 0/2 pridané. Overené 2026-07-07: @mattlady (Fractional Head of Revenue, DTC) a
> @tysondrake (Fractional CMO, DTC) → **oba marketing, nie finance → NEkvalifikovaní.** Zistenie:
> komunita okolo @ron_ecomm skôr DTC/marketing než finance, takže finance-špecifické TIER 1 účty sa
> odtiaľ ťažko získavajú. Zvážiť iný zdroj kandidátov (napr. účty, čo reálne diskutujú pod finance
> postami mimo ron-komunity), alebo prijať, že komentáre majú strop a hlavná páka = vlastné posty.

---

## 2. Vyhľadávacie dotazy (X Search → záložka „Latest")

Spúšťam cez `https://x.com/search?q=<dotaz>&f=live`. Operátor `since:` prepočítam
na dnešok mínus 1 deň pri každom skene. `-filter:replies` = len pôvodné posty.

1. `(AI OR automation) (CFO OR "finance team" OR "FP&A") min_faves:5 lang:en -filter:replies`
2. `("cash flow" OR "rolling forecast" OR "13-week") (CFO OR finance) min_faves:5 lang:en -filter:replies`
3. `("AI agent" OR "AI agents") (finance OR accounting OR CFO) min_faves:10 lang:en -filter:replies`
4. `("fractional CFO" OR "small business") (finance OR "cash flow") min_faves:5 lang:en -filter:replies`
5. `(DSO OR "accounts receivable" OR "overdue invoices") min_faves:3 lang:en -filter:replies`
6. `"AI in finance" min_faves:10 lang:en -filter:replies`

Plus: **Following timeline** (posty účtov, ktoré sleduješ) filtrované na posledných 24 h.

---

## 3. Skórovanie postu (0–100)

| Kritérium | Váha | Čo hodnotí |
|---|---|---|
| `dosah_na_odpoved` | 26 | **🆕 NAJSILNEJŠÍ PREDIKTOR (zavedené 2026-07-19 po #7).** Počítaj `zobrazenia_postu ÷ počet_odpovedí` = koľko pozornosti pripadá na jednu odpoveď. **> 1000 = max body** (#7: 5 871/4 ≈ 1 468 → 218 zobrazení); 500–1000 = veľmi dobré; 250–500 = priemer (#6: 2 000/8 = 250 → len 1 zobrazenie); < 250 = slabé; 100+ odpovedí = vyradiť. **Nahrádza pôvodné `nizka_saturacia`** — nejde len o málo odpovedí, ale o *málo odpovedí pri veľkom dosahu postu*. |
| `cerstvost` | 24 | **Ideál < 60 min od postnutia** (vtedy komentár stihne nazbierať prvé lajky a vytlačí sa hore). 1–3 h ešte OK, > 6 h výrazná zrážka, > 12 h takmer vyradiť, > 24 h vyradiť. |
| `relevancia` | 20 | Téma sedí na CFO / financie / AI vo financiách |
| `dosah_uctu` | 12 | **Znížené z 22 (2026-07-19).** Sweet spot ostáva ~1–30k a obrie účty (100k+) = zrážka, ale **#7 ukázal, že veľkosť účtu je slabší signál než `dosah_na_odpoved`** — pod nekonverzujúcim účtom (Drew) padol rekord série. Veľkosť účtu teraz slúži len ako hrubý filter. |
| `prilezitost_odpovedat` | 10 | Otázka / názor / debatovateľný take + **priestor priamo osloviť OP** (vyššia šanca, že OP zareaguje → to komentár vytlačí hore). |
| `trakcia` | 8 | Post práve „beží" (lajky/odpovede pribúdajú vzhľadom na vek) — znak, že vlákno je živé. |

> **🔴 Tvrdé pravidlo (poučenie z #1, #2): „Radšej čerstvý stredný účet než starý obrí post."**
> Ak musíš voliť medzi (a) 12 h starým postom účtu s 1M+ followermi a 8+ repostami, a
> (b) 30 min starým postom účtu s ~5k followermi a 2 odpoveďami — **vždy ber (b)**, aj keď má
> menej zobrazení. Pri 0 followeroch je tvoja jediná páka byť **skoro + na málo saturovanom poste,
> kde má OP dôvod ti odpovedať**. Obrí dosah postu ≠ dosah tvojho komentára.

**Prah:** posty pod **70** vyradím. Z ostatných vyberiem **Top 5**.
**Tvrdá zrážka:** post od účtu 100k+ stráca body cez `dosah_uctu`; post starší ako 6 h stráca cez `cerstvost`. Kombinácia (starý + obrí) sa k 70 prakticky nedostane — presne to chceme.

> **🟢 REVÍZIA 2026-07-19 (po kontrole #7 = 218 zobrazení, rekord série):** Záver z #6, že „bez
> followerov je dosah ~0 nezávisle od kvality", **neplatí univerzálne.** Pod postom @drewfallon12
> (5 871 zobrazení, len 4 odpovede) dostal Boris **218 zobrazení / 1 like pri ~0 followeroch** —
> druhý najvyšší dosah spomedzi všetkých odpovedí, kde ostatní traja boli **verified** účty
> (@seanjagermann 262/0, @aditya333777 173/1, @Mulkeen 130/0). Rozdiel oproti #6 (tam Boris 1 zobr.)
> nerobili followeri ani konverzujúci OP — **rozhodol pomer `dosah_na_odpoved`**: #7 ≈ 1 468 zobrazení
> na odpoveď vs. #6 len 250. **Nová priorita skenu: hľadaj RIEDKE VLÁKNO POD POSTOM S VEĽKÝM DOSAHOM**
> (veľa zobrazení, málo odpovedí) — dôležitejšie než či OP konverzuje alebo aký je veľký.

> **Pravidlo viditeľnosti (poučenie z komentárov #1 a #2):** pri 0–50 followeroch tvoj komentár
> nevidno, ak prídeš neskoro **alebo pod obrí účet**. Konkrétne dáta: #1 (Bojan) = 0/0/~1 zobrazenie,
> #2 (Boucher 3M, prvý v poradí, ostrý text) = 0/0/7 zobrazení. Text nebol problém — **distribúcia áno.**
> Preto sken teraz uprednostňuje **čerstvé posty (< 1 h) od stredných účtov (~1–20k) s málo odpoveďami**
> pred „veľkými, ale presýtenými" postami. Komentuj rýchlo, ostro a **adresuj OP otázkou**.
> Paralelne zváž budovanie vlastných followerov — bez nich majú komentáre strop dosahu.

| Skóre | Odporúčanie |
|---|---|
| 90–100 | komentovať okamžite |
| 80–89 | silná príležitosť |
| 70–79 | oplatí sa |
| < 70 | SKIP |

---

## 4. Filtre — automaticky vyradiť

- Staršie ako 24 h
- Mimo témy (nie CFO/financie/AI/SMB)
- Politika, náboženstvo, kontroverzie, „rage-bait"
- Crypto-shilling, get-rich-quick, zjavný spam
- Už 200+ odpovedí (tvoja sa stratí)
- Účet bez dosahu **aj** bez engagementu (0 zásah)
- Tvoje vlastné posty
- Posty, pod ktorými už máš komentár (kontrola v `x_comment_log.md`)

---

## 5. Generovanie komentára — 4 varianty

Pre každý vybraný post vygenerujem **4 štýly** (využijem aj tvoje skills
`reddit-b2b-patterns` na tón a `reddit-humanize-comment` na odstránenie AI pachu):

| Variant | Štýl |
|---|---|
| `practical_specific` | Konkrétna taktika alebo číslo, žiadna omáčka |
| `cfo_experience` | Jemná autorita z 30 rokov CFO + konkrétny postreh |
| `contrarian_nuanced` | Slušný protinázor / chýbajúci uhol pohľadu |
| `humor_oneliner` 🆕 | **Krátky vtipný one-liner, 8–15 slov, bez čísla a bez otázky.** Suchý humor, pointa hneď. |

> **🆕 Prečo pribudol `humor_oneliner` (zavedené 2026-07-19 po #7):** jedenásťslovný one-liner
> („First energy drink to die of exhaustion.") dal **218 zobrazení + 1 like — najlepší výsledok
> celej série**, zatiaľ čo šesť predchádzajúcich analytických komentárov malo 1–102 zobrazení.
> Dva vecné komentáre iných pod tým istým postom mali 0 likes. **Kedy ho použiť:** najmä pod
> **news-recap / „firma padla" / absurdné čísla** posty, kde analytický komentár pôsobí ťažkopádne.
> **Kedy nie:** pod úprimnou otázkou OP (napr. #8 ron o financovaní LTV) — tam vyhráva vecnosť.
> Humor **nesmie byť** na úkor niekoho konkrétneho ani zlomyseľný; cieľ je suchý postreh, nie posmech.

> ## 🔴 PRAVIDLO Č. 1 — ODPOVEDZ NA OTÁZKU, NEVRACAJ VLASTNÚ (zavedené 2026-07-19 po #8)
>
> **Ak OP položí úprimnú otázku, PRVÁ VETA tvojho komentára musí byť priama odpoveď na ňu.**
> Až potom (voliteľne) pridaj svoj postreh. **Žiadna protiotázka, žiadny reframe, žiadne poučovanie.**
>
> **Dôkaz (#8, ron_ecomm — „How are you funding this?"):**
> - **@jforjacob** odpovedal priamo: *„You fund it with existing re-bills. First couple months you
>   have to be profitable first order."* → **3 600 zobrazení, 17 likes, a ron mu ODPOVEDAL.**
> - **Boris** otázku preformuloval, pridal varovanie a vrátil vlastnú otázku → **135 zobrazení,
>   0 likes, ron neodpovedal** — hoci bol Boris zobrazený **prvý**. **Rozdiel 27×.**
>
> **Vzor je konzistentný naprieč #4, #6 a #8:** vždy, keď Boris vrátil otázku namiesto odpovede,
> OP nereagoval. Protiotázka funguje **len pod tvrdením/názorom** OP — nikdy nie pod jeho otázkou.
>
> **Test pred postnutím:** položil OP otázku? → Vie čitateľ z mojej prvej vety, **aká je moja
> odpoveď**? Ak nie, prepíš. Krátko a jednoducho, bez žargónu (Jacob použil 2 vety, 0 odborných slov).

### Pravidlá komentára na X (iné ako Reddit!)
- **15–40 slov, 1–2 vety.** X je stručný; dlhé eseje sa nečítajú.
- **1 konkrétne číslo alebo konkrétny detail** (nie všeobecné frázy).
- **Nezačínať slovom „I".** Žiadne „As a…", „In conclusion", „Great point".
- **Žiadne hashtagy, žiadne linky** v odpovedi (X dusí dosah postov s linkom).
- **Nepredávaj borisdracka.com.** Autorita cez postreh, nie cez self-promo.
- Voliteľne zakončiť **krátkou úprimnou otázkou** — ⚠️ **ALE NIKDY, ak OP sám položil otázku**
  (viď Pravidlo č. 1 vyššie). Vtedy odpovedaj, nepýtaj sa.
- **Jazyk podľa postu** (väčšinou EN).
- Žiadne dva rovnaké komentáre — vždy variovať.

---

## 6. Čo ti dodám (output formát)

Pre každý z Top 5:

```
#1 — Skóre 88/100  ✅ silná príležitosť
Autor: @handle (~12k followers) · pred 3 h · 45 likes / 8 replies
Link:  https://x.com/handle/status/...
Post:  "<prvé vety postu>"
Dosah/odpoveď: 5 400 zobrazení ÷ 8 odpovedí ≈ 675  ← kľúčový ukazovateľ
Prečo: čerstvé, riedke vlákno pri slušnom dosahu, otázka o cash flow → tvoja téma

Drafty:
A) [practical_specific] ...
B) [cfo_experience] ...
C) [contrarian_nuanced] ...
D) [humor_oneliner] ...
👉 Odporúčam: B
```

> **Pozn.:** `Dosah/odpoveď` uvádzam pri každom poste — je to najsilnejší prediktor (váha 26).
> Variant D generujem vždy, ale odporučím ho hlavne pri news-recap / absurdné-čísla postoch.

Ty si vyberieš/upravíš, postneš na X, a napíšeš mi „postol som #1 B" — zalogujem.

---

## 7. Bezpečnostné pravidlá

- **Nikdy nepostujem za teba.** Vždy len drafty, postuješ ručne.
- **Max 1–2 komentáre/deň**, rozostup 60–120 min.
- Žiadne identické/šablónovité komentáre.
- Žiadne linky v prvej odpovedi.
- Žiadna politika/medicína/kontroverzia ako návnada.
- Ak X ukáže akékoľvek varovanie / rate-limit / captcha → **okamžite stop**, nahlásim ti to.

---

## 8. Logovanie a engagement — automatický reťazec

Po postnutí komentára mi povedz **„postol som #X [variant]"** → spustím **jeden reťazec, ktorý
synchronizuje všetky tri miesta naraz** (bez pýtania):

1. **Log** `x_comment_log.md` — nový riadok (dátum, link, autor + veľkosť účtu, variant,
   skrátený text, likes/replies 0, OP „Nie zatiaľ") + zvýšim denný počet.
2. **Notion** — stránka „🔎 Projekt Sken X.com — Kompletný prehľad"
   (`394a8d65-a6ac-81d1-bed4-f42cd59f1570`): pridám riadok do Comment logu a prepočítam
   agregáty (views spolu, priemer, likes, OP reply rate, obrie vs. stredné).
3. **Dashboard** — artifact `x-engagement-tracker`: pridám objekt do poľa `DATA` a zavolám
   `update_artifact`, takže sa graf aj tabuľka hneď prekreslia.

Na **„skontroluj #X"** otvorím post, zistím views/likes/replies + či OP odpovedal a rovnakým
reťazcom (log → Notion → artifact) doplním reálne čísla.

Raz týždenne (alebo na požiadanie) zhrniem: čo zarezonovalo, ktorý štýl ťahá,
ktoré témy/účty dávajú najviac, a podľa toho doladíme dotazy a skórovanie.

---

*Tento playbook je živý dokument — keď zistíme, čo funguje, upravíme kľúčové slová,
cieľové účty a váhy skórovania. Chceš automatické ranné spúšťanie namiesto „sken X"?
Viem to neskôr prepnúť na scheduled task.*
