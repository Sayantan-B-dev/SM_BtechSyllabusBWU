# Presentation Content — Probability & Statistics (BBS00014)
<!-- Deck spec for AI PPTX generators. Keep the Empty_Template.pptx design untouched. -->

| | |
|---|---|
| **Student** | Sayantan Bharati |
| **Student Code** | BWU/BTS/25/503 |
| **Section** | B |
| **Programme** | B.Tech (CSE), Batch 2025, AY 2026-27, Odd Semester 3 |
| **Course** | Probability & Statistics (BBS00014) |
| **Faculty** | Mrs. Rittika Bhattacharya |
| **Presentation Date** | 14-10-2026 |
| **Topic** | Bivariate Analysis: Correlation & Regression |
| **Deck size** | 13 slides = 1 Cover + 1 Intro + 1 Index (with page nos) + 4 Concept + 5 Examples + 1 References & Thank-You |
| **Design** | Use `Empty_Template.pptx` theme, colours, fonts and layouts as-is (do not redesign) |
| **Visuals** | Every slide has a "Visual" block: replace it with an image/diagram. A ready inline ASCII sketch is given where useful. |
| **Speaker notes** | Put each "Speaker note" into the PPT notes pane (not on the slide) |
| **Style** | Light bullets, one idea per line, max ~6 bullets per slide. Use symbols Σ, x̄, ȳ, ρ, r, σ, b_yx, b_xy — as equation objects or plain Unicode. |

> **How to read this file:** `## Slide N — Title` = one PowerPoint slide. `Bullets` = text on the slide. `Visual` = the picture/diagram to add. `Speaker note` = spoken script.

---

## Slide 1 — Cover Page

**Type:** Cover  
**Title:** Bivariate Analysis: Correlation & Regression  
**Subtitle:** Measuring and Modelling the Relationship Between Two Variables

**On-slide details (left-aligned, template title layout):**
- Course: Probability & Statistics (BBS00014)
- Presented by: Sayantan Bharati | BWU/BTS/25/503 | Section B
- Programme: B.Tech (CSE), Batch 2025, AY 2026-27 (Odd Semester 3)
- Faculty: Mrs. Rittika Bhattacharya
- Department of Mathematics, Brainware University
- Date: 14-10-2026

**Visual:** University logo (top-right) + hero scatter-plot with fitted trend line. Search terms: `scatter plot with regression line`, `correlation graph`.

**Speaker note:** Good morning. I am Sayantan Bharati. This deck has four concept pages and five worked example pages: first how we measure a relationship with correlation, then how we model it for prediction with regression.

---

## Slide 2 — Introduction

**Type:** Introduction  
**Title:** Introduction — Two Variables, Two Questions

**Bullets:**
- **Bivariate data** = pairs (x, y) on the same subject: hours–marks, price–demand.
- Question 1: *Do they move together?* → **Correlation** (strength + direction).
- Question 2: *Can we predict one from the other?* → **Regression** (model).
- Plan: 4 concept pages (pp. 4–7), then 5 example pages (pp. 8–12).
- Tools assumed: mean (x̄, ȳ), variance, standard deviation (σ_x, σ_y).

**Visual:** Paired table → scatter → two question badges ("move together?" / "predict?"). Inline:

```
Student  Hours(x)  Marks(y)
   A        2         40
   B        5         65   -> plot, then measure, then model
   C        8         85
```

**Speaker note:** Everything today is about paired data. Correlation gives a number for how tightly the pair moves; regression turns that into a line we can predict with. The first half of the deck builds the formulas, the second half computes them end to end.

---

## Slide 3 — Index with Page Numbers

**Type:** Index / Agenda  
**Title:** Presentation Outline — What Is on Which Page

**Bullets:**
- Page 4 — Concept 1: Scatter Diagrams & Types of Correlation
- Page 5 — Concept 2: Karl Pearson's r (formula + meaning)
- Page 6 — Concept 3: Spearman's Rank ρ + Properties of r
- Page 7 — Concept 4: Regression Lines + Least Squares Principle
- Page 8 — Example 1: Pearson r — Full Calculation
- Page 9 — Example 2: Spearman Rank — Full Calculation
- Page 10 — Example 3: Both Regression Lines + r from Slopes
- Page 11 — Example 4: Least-Squares Fit & Prediction
- Page 12 — Example 5: r² Meaning, Outlier Trap & Viva Points

**Visual:** Numbered roadmap with page badges (4–12) and two colour groups: Concepts (4–7, blue) / Examples (8–12, green). Search terms: `presentation agenda page numbers roadmap`.

**Speaker note:** From page 4 we build theory in four steps — scatter, Pearson, Spearman plus properties, then regression and least squares. From page 8 we compute: one Pearson, one Spearman, one two-line regression, one least-squares prediction, and one interpretation page that examiners love to ask about.

---

## Slide 4 — Concept 1: Scatter & Types of Correlation (Detailed)

**Type:** Concept (1/4)  
**Title:** Concept 1 — Seeing the Relationship First

**Bullets:**
- **Scatter diagram:** plot each (x, y) as a point; shape shows relationship free of formulas.
- **Positive:** both rise together (height–weight). **Negative:** one falls as other rises (price–demand).
- **No correlation:** formless cloud. **Non-linear:** curved band (still patterned, but r ≈ 0).
- Strength rule: nearer to a straight line → stronger **linear** association.
- Always plot first: reveals **outliers** and curvature that numbers hide.
- Warning: correlation = **association**, not proof of **causation**.

**Visual:** Four mini scatter panels: strong +, weak +, negative, none/curved. Inline sketch:

```
Strong +:  ..'    Negative: '..    None: . . .    Curve: ..   ..
            ..'              '..          . . .           .. ..
             ''                ''        . .  .             '' 
```

Search terms: `types of scatter plots positive negative no correlation`.

**Speaker note:** Before any formula, plot. The eye judges direction, straightness and outliers instantly. A curved relationship can look strong yet give a near-zero linear correlation — that is why the scatter is mandatory, and why correlation must never be read as causation.

---

## Slide 5 — Concept 2: Karl Pearson's r (Detailed)

**Type:** Concept (2/4)  
**Title:** Concept 2 — Karl Pearson's Coefficient r

**Bullets:**
- Measures **linear** strength + direction between numeric x, y.
- Definition: `r = Σ(x−x̄)(y−ȳ) / √[ Σ(x−x̄)² · Σ(y−ȳ)² ]`.
- Hand-calculation form: `r = [ nΣxy − Σx·Σy ] / √[ (nΣx²−(Σx)²)(nΣy²−(Σy)²) ]`.
- Range **−1 ≤ r ≤ 1**: +1 perfect rise, −1 perfect fall, 0 no linear link.
- Also called **product-moment** coefficient; needs only 5 sums.
- Needs interval data, roughly linear cloud, no dominant outlier.

**Visual:** Formula as large equation object + tiny annotated scatter. Inline layout:

```
        Σ(x−x̄)(y−ȳ)
 r = ------------------------
      √[ Σ(x−x̄)² · Σ(y−ȳ)² ]
```

Search terms: `Pearson correlation coefficient formula`.

**Speaker note:** Pearson standardises joint variation by the two spreads, forcing the result into minus one to plus one. For exams use the raw-sums form — it needs only n, Σx, Σy, Σxy, Σx² and Σy². Remember its conditions: numeric data, a straight-ish cloud, and no single outlier driving the value.

---

## Slide 6 — Concept 3: Spearman ρ + Properties of r (Detailed)

**Type:** Concept (3/4)  
**Title:** Concept 3 — Spearman's ρ and Properties of r

**Bullets:**
- **When:** ranks / ordered judgments, or curved-but-monotone relation; robust to outliers.
- Rank x and y as 1…n; let `d = Rx − Ry`; then `ρ = 1 − 6Σd² / n(n²−1)`.
- Tied ranks: give average rank, use tie-corrected formula.
- Range again **−1 ≤ ρ ≤ 1**, read exactly like r.
- Properties of r: **independent of origin & scale**; symmetric `r(x,y)=r(y,x)`.
- Same sign as regression slopes; `r = 0` kills linear link only, not all pattern.

**Visual:** Rank-difference mini table + gauge −1…+1. Inline:

```
Item  Rx  Ry  d    d²        -1 --- -0.7 --- 0 --- +0.7 --- +1
 A     2   1  +1    1          strong  moderate none moderate strong
 B     1   3  −2    4  Σd²=6
 C     3   2  +1    1
```

**Speaker note:** Spearman is Pearson on ranks — fast, needing only rank gaps, and ideal for judges' scores or surveys. The two memorised properties are origin/scale freedom and symmetry. And the strength guide examiners expect: about 0.7-plus strong, 0.4 to 0.7 moderate, below 0.3 weak.

---

## Slide 7 — Concept 4: Regression Lines + Least Squares (Detailed)

**Type:** Concept (4/4)  
**Title:** Concept 4 — Regression & Least Squares

**Bullets:**
- Correlation measures; **regression predicts**: `y on x` predicts y; `x on y` predicts x.
- Slopes: `b_yx = r·(σ_y/σ_x)`; `b_xy = r·(σ_x/σ_y)` — same sign as r.
- Lines: `(y−ȳ) = b_yx(x−x̄)` and `(x−x̄) = b_xy(y−ȳ)`; meet at `(x̄, ȳ)`.
- Link: `r = ±√(b_yx·b_xy)`; lines coincide only if `|r| = 1`.
- **Least squares:** fit `y = a + bx` by minimising `Σ(yᵢ−a−bxᵢ)²`.
- Normal equations: `Σy = na + bΣx`; `Σxy = aΣx + bΣx²` → `b`, then `a = ȳ − bx̄`.

**Visual:** Scatter with BOTH regression lines crossing at (x̄, ȳ) + residual-gap sketch. Inline:

```
y |      y-on-x /
  |  x-on-y \  /   cross at (x̄, ȳ)
  |         \/     residual = vertical gap minimised
  +---------------- x
```

Search terms: `two regression lines scatter plot`, `least squares residuals diagram`.

**Speaker note:** There are always two regression lines — one per prediction direction — crossing at the means. Least squares is what makes a line best: smallest total squared vertical gap. Solve the two normal equations for slope then intercept; the same recipe extends to curves and to machine-learning linear regression.

---

## Slide 8 — Example 1: Pearson r — Full Calculation

**Type:** Example (1/5)  
**Title:** Example 1 — Pearson r Step by Step

**Bullets:**
- Data (hours x, marks y): (2,40), (4,50), (6,60), (8,70), (10,80); n = 5.
- Sums: Σx = 30, Σy = 300, Σxy = 2000, Σx² = 220, Σy² = 19000.
- Numerator: `nΣxy − ΣxΣy = 5·2000 − 30·300 = 10000 − 9000 = 1000`.
- Denominator: `√[(1100−900)(95000−90000)] = √(200·5000) = 1000`.
- Result: `r = 1000/1000 = +1` — perfect positive linear.
- Read: points lie exactly on a line; scatter would show a straight rise.

**Visual:** Data table + scatter with straight-line fit. Small sum row under table. Search terms: `linear regression worked example table`.

**Speaker note:** This clean dataset is chosen to give plus one, so every step is checkable: build the five sums, plug into the shortcut form, and the numerator equals the denominator. In an exam, always show the sums table first — it earns step marks even if arithmetic slips.

---

## Slide 9 — Example 2: Spearman Rank — Full Calculation

**Type:** Example (2/5)  
**Title:** Example 2 — Spearman ρ Step by Step

**Bullets:**
- Data: 5 students ranked by two judges — Rx: 1,2,3,4,5; Ry: 2,1,4,3,5.
- Gaps: d = −1,+1,−1,+1,0 → d² = 1,1,1,1,0 → **Σd² = 4**.
- Formula: `ρ = 1 − 6·4 / 5(25−1) = 1 − 24/120 = 1 − 0.2 = 0.8`.
- Result: **strong positive agreement** between judges.
- If a tie occurred: average the tied ranks, apply tie correction.
- Contrast: Pearson needs marks; Spearman needs only order.

**Visual:** Rank table with d and d² columns + formula filled with numbers. Inline:

```
Student  Rx  Ry   d   d²
  A       1   2  −1   1
  B       2   1  +1   1
  C       3   4  −1   1
  D       4   3  +1   1
  E       5   5   0   0   Σd² = 4 → ρ = 0.8
```

**Speaker note:** Rank, subtract, square, sum — four columns and one substitution. Point-eight means the judges largely agree. Mention ties proactively: average the tied positions before differencing, otherwise the short formula overstates the value.

---

## Slide 10 — Example 3: Both Regression Lines + r from Slopes

**Type:** Example (3/5)  
**Title:** Example 3 — Finding Both Regression Lines

**Bullets:**
- Given: x̄ = 6, ȳ = 60, σ_x = 2.83, σ_y = 14.14, r = +1 (from Example 1).
- Slope y on x: `b_yx = 1·(14.14/2.83) = 5.0` → `(y−60) = 5(x−6)` → **`y = 5x + 30`**.
- Slope x on y: `b_xy = 1·(2.83/14.14) = 0.2` → `(x−6) = 0.2(y−60)` → **`x = 0.2y − 6`**.
- Check: `√(5·0.2) = √1 = 1 = r` — identity holds, sign positive.
- Both lines cross at **(6, 60)** — always verify this point.
- Use: y on x predicts marks; x on y predicts hours for a target mark.

**Visual:** Plot showing both lines crossing at (6,60) (coincide here since r=1 — note it) + formula card with substitution.

**Speaker note:** This is the favourite exam question: given means, spreads and r, write both lines. Compute each slope as r times the spread ratio, anchor each line at the means, then verify with the product rule and the crossing point. Emphasise direction: use y-on-x only to predict y.

---

## Slide 11 — Example 4: Least-Squares Fit & Prediction

**Type:** Example (4/5)  
**Title:** Example 4 — Least-Squares Line & Forecast

**Bullets:**
- Same data: n=5, Σx=30, Σy=300, Σxy=2000, Σx²=220.
- Slope: `b = [5·2000 − 30·300]/[5·220 − 900] = 1000/200 = 5`.
- Intercept: `a = ȳ − bx̄ = 60 − 5·6 = 30` → line **`y = 30 + 5x`**.
- Predict x = 7 hrs: `y = 30 + 35 = 65 marks` (interpolation — safe).
- Predict x = 12 hrs: `y = 90` — extrapolation, flag as risky.
- Same line as regression y on x — least squares is its engine.

**Visual:** Scatter + fitted line `y = 30+5x` with predicted point (7,65) starred and (12,90) dashed/greyed as extrapolation. Residual gaps drawn.

**Speaker note:** Solve the normal equations in two lines: slope first, intercept from the means. Seven hours sits inside the data so sixty-five is trustworthy; twelve hours goes beyond it, so report ninety with a warning. That interpolation-versus-extrapolation distinction is a guaranteed viva question.

---

## Slide 12 — Example 5: r² Meaning, Outlier Trap & Viva Points

**Type:** Example (5/5)  
**Title:** Example 5 — Reading r Correctly

**Bullets:**
- **r² (determination):** share of y-variation explained — `r=0.8 → r²=0.64 = 64%`.
- Our Example 1: `r=1 → r²=1` — 100% explained (idealised classroom data).
- **Outlier trap:** one stray point (e.g. (10,20)) can crash r from 1.0 → ~0.4 — always plot.
- **Causation trap:** ice-cream vs drowning correlate via heat — hidden third variable.
- Exam checklist: report **plot + r + r²**; state direction; never extrapolate silently.

**Visual:** Venn-style "variation in y" with explained slice labelled r² + two caution icons (outlier point off-line; third-variable triangle). Search terms: `coefficient of determination r squared`, `correlation outlier effect`.

**Speaker note:** Close the numerical arc with interpretation. R-squared translates correlation into explained percentage. Then the two traps examiners probe: a single outlier can halve r, and a strong r never proves cause. End by modelling good practice — plot, number, and squared number together.

---

## Slide 13 — References & Thank You

**Type:** References + Thank-You (single slide)  
**Title:** References & Thank You

**Bullets (References):**
- S. C. Gupta & V. K. Kapoor — *Fundamentals of Mathematical Statistics*.
- Walpole et al. — *Probability and Statistics for Engineers and Scientists*.
- S. M. Ross — *Introduction to Probability and Statistics for Engineers*.
- Montgomery — *Applied Statistics and Probability for Engineers*.
- Course notes — Module 1 (Correlation, Regression, Curve Fitting).

**Thank-You text (bottom):**
- "Thank you for your attention — Questions are welcome."
- Sayantan Bharati | BWU/BTS/25/503 | Section B

**Visual:** Book-cover thumbnails + "Q&A" icon. Search terms: `question and answer icon`.

**Speaker note:** These are the standard references plus the module-1 lecture notes. Thank you — happy to take questions on any of the five examples or the concept pages behind them.
