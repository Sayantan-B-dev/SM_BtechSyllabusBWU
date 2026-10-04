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
| **Deck size** | 14 slides = 1 Cover + 1 Introduction + 1 Index + 10 Content + 1 References & Thank-You |
| **Design** | Use `Empty_Template.pptx` theme, colours, fonts and layouts as-is (do not redesign) |
| **Visuals** | Every slide has a "Visual" block: replace it with an image/diagram. A ready inline ASCII/Mermaid diagram is given where useful. |
| **Speaker notes** | Put each "Speaker note" into the PPT notes pane (not on the slide) |
| **Style** | Light bullets, one idea per line, max ~6 bullets per slide. Do not overfill. Use the special symbols (Σ, x̄, ȳ, ρ, r, σ) — insert them as equation objects or plain Unicode. |

> **How to read this file:** `## Slide N — Title` = one PowerPoint slide. `Bullets` = text on the slide. `Visual` = the picture/diagram to add. `Speaker note` = spoken script. The two framing slides (Cover, References & Thank-You) carry the same branding in every deck.

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

**Visual:** University logo (top-right) + a hero scatter-plot image with a fitted trend line. Search terms: `scatter plot with regression line`, `correlation graph`. Free sources: Wikimedia Commons (`https://commons.wikimedia.org/w/index.php?search=scatter+plot+correlation`), Pexels.

**Speaker note:** Good morning. I am Sayantan Bharati. Today I will present bivariate analysis — the study of how two variables move together — covering correlation, which measures the strength of a relationship, and regression, which uses that relationship to make predictions.

---

## Slide 2 — Introduction

**Type:** Introduction  
**Title:** Introduction — When One Variable Depends on Another

**Bullets:**
- **Bivariate data** = two variables measured on the same subject (x, y).
- Examples: study hours vs marks; price vs demand; temperature vs ice-cream sales.
- Two central questions: *Do they move together?* and *Can we predict one from the other?*
- **Correlation** answers the first: strength and direction of association.
- **Regression** answers the second: a model that predicts y from x.
- Both build on earlier tools — mean, variance and standard deviation.

**Visual:** A simple table of paired observations (x, y) next to a scatter diagram. Inline:

```
Student  Hours(x)  Marks(y)
   A        2         40
   B        5         65
   C        8         85     -> does y rise with x?
```

Search terms: `bivariate data example`, `study hours vs marks scatter plot`.

**Speaker note:** Bivariate simply means two variables measured together. The motivating questions are natural: are they related, and if so, can we use one to predict the other? Correlation and regression are the two standard statistical tools for exactly these questions.

---

## Slide 3 — Index

**Type:** Index / Agenda  
**Title:** Presentation Outline

**Bullets:**
1. Bivariate Data & Scatter Diagrams
2. Types of Correlation
3. Karl Pearson's Coefficient of Correlation
4. Spearman's Rank Correlation
5. Properties & Interpretation of r
6. Regression — Concept & Lines
7. Regression Equations & Coefficients
8. Method of Least Squares & Curve Fitting
9. Worked Example
10. Coefficient of Determination, Limitations & Applications

**Visual:** A numbered "roadmap" graphic (horizontal timeline of the 10 topics). Search terms: `presentation agenda roadmap icons`.

**Speaker note:** I will start with the visual tool — the scatter diagram — then define correlation formally with two coefficients, move to regression and least squares, work a full numerical example, and close with interpretation, limitations and applications.

---

## Slide 4 — Bivariate Data & Scatter Diagrams

**Type:** Content (1/10)  
**Title:** Seeing the Relationship — Scatter Diagrams

**Bullets:**
- A **scatter diagram** plots each pair (x, y) as a point.
- The overall *shape* of the cloud reveals the relationship before any calculation.
- Closer to a straight line → stronger **linear** relationship.
- No pattern → little or no linear relationship.
- A scatter plot is the first, free check — always plot before computing.
- It also exposes **outliers** and non-linear (curved) patterns.

**Visual:** Four scatter diagrams side by side: strong positive, weak positive, negative, and no correlation. Inline mini-sketches:

```
Pos:  ...'        Neg: '...        None:  . ..
     ..'               '..              .  . .
    ''                    ''           . ..  .
```

Search terms: `types of scatter plots positive negative no correlation`.

**Speaker note:** Before touching a formula, we plot the data. The scatter diagram tells us at a glance whether the relationship is strong or weak, positive or negative, straight or curved. Only after that do we compute a number to summarise what we have seen.

---

## Slide 5 — Types of Correlation

**Type:** Content (2/10)  
**Title:** Types of Correlation

**Bullets:**
- **Positive correlation:** x and y rise together (height vs weight).
- **Negative correlation:** one rises as the other falls (price vs demand).
- **No correlation:** no consistent pattern.
- **Linear vs non-linear:** points near a line vs near a curve.
- **Simple / multiple / partial:** two variables, more than two, or controlling others.
- Correlation is about **association**, not necessarily **causation**.

**Visual:** A labelled grid of scatter plots (positive, negative, none, non-linear) with arrows. Search terms: `correlation types positive negative infographic`.

**Speaker note:** The sign matters: positive means both increase together, negative means they move oppositely. We also distinguish straight-line relationships from curved ones. And one warning that recurs throughout statistics: correlation does not automatically prove causation.

---

## Slide 6 — Karl Pearson's Coefficient of Correlation

**Type:** Content (3/10)  
**Title:** Karl Pearson's Coefficient of Correlation

**Bullets:**
- Measures the strength of **linear** relationship between x and y.
- Definition: `r = Σ(x−x̄)(y−ȳ) / √[ Σ(x−x̄)² · Σ(y−ȳ)² ]`.
- Shortcut (raw scores): `r = [ nΣxy − Σx·Σy ] / √[ (nΣx²−(Σx)²)(nΣy²−(Σy)²) ]`.
- Range: **−1 ≤ r ≤ 1**.
- `r = +1` perfect positive, `r = −1` perfect negative, `r = 0` no linear relation.
- Also called the **product-moment correlation coefficient**.

**Visual:** The formula displayed prominently as an equation object, with a small scatter plot annotated. Inline formula layout:

```
        Σ(x−x̄)(y−ȳ)
 r = ------------------------
      √[ Σ(x−x̄)² · Σ(y−ȳ)² ]
```

Search terms: `Pearson correlation coefficient formula`, `product moment correlation`.

**Speaker note:** Pearson's r is the workhorse. It standardises the co-variation of x and y by their spreads, which is why it always lands between minus one and plus one. The shortcut form is easier for hand calculation because it uses only the raw sums Σx, Σy, Σxy, Σx² and Σy².

---

## Slide 7 — Spearman's Rank Correlation

**Type:** Content (4/10)  
**Title:** Spearman's Rank Correlation

**Bullets:**
- Used when data are **ranks** or when the relationship is not strictly linear.
- Rank each variable 1…n, then work with **differences of ranks** `d = Rx − Ry`.
- Formula: `ρ = 1 − ( 6 Σd² ) / ( n(n² − 1) )`.
- Range again **−1 ≤ ρ ≤ 1**, interpreted like r.
- If ranks **tie**, use the corrected formula (average ranks).
- Useful for qualitative rankings (judges' scores, satisfaction surveys).

**Visual:** A small table of ranks with computed `d` and `d²`, plus the formula. Inline:

```
Item  Rx  Ry   d = Rx−Ry   d²
 A     2   1      +1        1
 B     1   3      −2        4
 C     3   2      +1        1        Σd² = 6
```

Search terms: `spearman rank correlation example table`.

**Speaker note:** When the data are ranks rather than measurements — for instance two judges ranking contestants — the rank correlation is the right tool. It needs only the differences between ranks, which makes it quick to compute and robust to outliers.

---

## Slide 8 — Properties & Interpretation of r

**Type:** Content (5/10)  
**Title:** Properties and Interpretation of r

**Bullets:**
- `r` is **independent of origin and scale** — shifting or rescaling doesn't change it.
- Symmetric: `r(x,y) = r(y,x)`.
- `r` has the **same sign** as the regression coefficients.
- `r = 0` means no **linear** relation (a non-linear pattern may still exist).
- Rough guide: |r| > 0.7 strong, 0.4–0.7 moderate, < 0.3 weak.
- **Correlation ≠ causation** — a hidden third variable can create it.

**Visual:** A horizontal gauge from −1 to +1 with coloured zones (strong negative, weak, strong positive). Inline:

```
 -1 ------ -0.7 ---- 0 ---- +0.7 ------ +1
  strong   moderate   none   moderate   strong
  negative negative        positive   positive
```

Search terms: `correlation coefficient strength interpretation chart`.

**Speaker note:** Two properties are worth memorising: r does not change if we change units or origin, and r is symmetric between the two variables. For interpretation, a rough rule is that beyond about point-seven is strong. And the classic caution applies — even a strong correlation may be produced by a third, hidden factor.

---

## Slide 9 — Regression — Concept & Lines

**Type:** Content (6/10)  
**Title:** Regression — Predicting One Variable from Another

**Bullets:**
- Correlation measures relationship; **regression fits a model** to predict.
- **Line of regression of y on x** predicts y from x.
- **Line of regression of x on y** predicts x from y.
- The two lines are different unless `|r| = 1`.
- They intersect at the point `(x̄, ȳ)` — the means.
- "Regression" comes from Galton: extreme values tend toward the mean.

**Visual:** A scatter plot with **both** regression lines drawn (they cross at the means). Inline:

```
 y |        y on x  /
   |              /
   |     x on y  /
   |    \       /
   |     \     /   (intersect at x̄, ȳ)
   +------------------- x
```

Search terms: `two regression lines scatter plot`, `line of regression y on x`.

**Speaker note:** Regression turns a relationship into a prediction. Notice there are always two lines — one for predicting y from x and one for predicting x from y — and they are not the same line. They meet at the means of the two variables, and they coincide only in the perfect-correlation case.

---

## Slide 10 — Regression Equations & Coefficients

**Type:** Content (7/10)  
**Title:** Regression Equations and Coefficients

**Bullets:**
- Regression coefficient of y on x: `b_yx = r · (σ_y / σ_x)`.
- Regression coefficient of x on y: `b_xy = r · (σ_x / σ_y)`.
- Line of y on x: `(y − ȳ) = b_yx (x − x̄)`.
- Line of x on y: `(x − x̄) = b_xy (y − ȳ)`.
- Key identity: `r = ± √( b_yx · b_xy )` — sign follows r.
- Both coefficients share the sign of r.

**Visual:** A formula card with the two lines and their coefficients, plus a mini plotted example. Search terms: `regression coefficient formula b_yx b_xy`.

**Speaker note:** These two equations are the practical output of the whole topic. The slope of each line — the regression coefficient — is the correlation scaled by the ratio of the standard deviations. The elegant identity that r equals plus or minus the square root of the product of the two slopes links correlation and regression tightly together.

---

## Slide 11 — Method of Least Squares & Curve Fitting

**Type:** Content (8/10)  
**Title:** Fitting the Line — Least Squares

**Bullets:**
- Goal: choose a line `y = a + bx` that best fits the points.
- **Principle of least squares:** minimise `Σ (yᵢ − a − b xᵢ)²`.
- Normal equations: `Σy = n·a + b·Σx` and `Σxy = a·Σx + b·Σx²`.
- Solving gives `b = [nΣxy − ΣxΣy] / [nΣx² − (Σx)²]`, then `a = ȳ − b·x̄`.
- The same method fits curves (`y = a + bx + cx²`, etc.) by treating them as linear in the coefficients.
- This is the foundation of **linear regression** in data science.

**Visual:** A scatter plot with vertical residuals from each point to the fitted line (highlighted as segments). Inline:

```
 y |     .    /
   |   .  \  /
   | .     \/       residual = vertical gap to line
   |       / \
   +------------- x
```

Search terms: `least squares regression residuals diagram`.

**Speaker note:** Least squares is the criterion that makes the fit "best": we reduce the sum of the squared vertical gaps between points and line. Solving the two normal equations gives the slope and intercept. The same recipe extends to quadratic and higher curves, which is why it underpins modern linear regression.

---

## Slide 12 — Worked Example

**Type:** Content (9/10)  
**Title:** Worked Example — Correlation & Regression

**Bullets:**
- Data (x = study hours, y = marks): (2,40), (4,50), (6,60), (8,70), (10,80).
- Σx = 30, Σy = 300, Σxy = 2000, Σx² = 220, Σy² = 19000, n = 5.
- `r = [5·2000 − 30·300] / √[(5·220 − 900)(5·19000 − 90000)] = 1000 / 1000 = 1`.
- Perfect positive correlation (`r = 1`) for this cleanly linear data.
- Regression line: means `x̄ = 6`, `ȳ = 60`; `b_yx = 5` → `y = 5x + 30`.
- Predict for x = 7 hours: `y = 5·7 + 30 = 65` marks.

**Visual:** The data table, the scatter plot with the fitted line `y = 5x + 30`, and the predicted point highlighted. Search terms: `linear regression worked example table`.

**Speaker note:** Here is the whole method on one small dataset. The numbers are chosen to be perfectly linear, so r equals one, and the regression line comes out as y equals five x plus thirty. Using it, seven hours of study predicts sixty-five marks — which shows exactly how regression is used in practice.

---

## Slide 13 — Coefficient of Determination, Limitations & Applications

**Type:** Content (10/10)  
**Title:** Meaning, Limitations & Applications

**Bullets:**
- **Coefficient of determination** `r²` = fraction of variation in y explained by x.
- Example: `r = 0.8 → r² = 0.64`, i.e. 64% of variation explained.
- **Limitations:** assumes linearity; sensitive to outliers; correlation ≠ causation.
- Extrapolating beyond the observed x-range is risky.
- **Applications:** forecasting, economics, quality control, machine learning (linear & logistic regression).
- Always report `r` or `r²` with the plot — never the number alone.

**Visual:** A Venn-style diagram of "variation in y" with an "explained by x" region labelled r², plus an icon row of applications. Search terms: `coefficient of determination r squared`, `regression applications icons`.

**Speaker note:** A single number, r, can be misleading, so we often report r-squared — the share of the variation in y explained by x. I want to stress the limitations: keep to a linear model, watch out for outliers, and never claim causation from correlation. With those caveats, these tools power forecasting, quality control and machine learning.

---

## Slide 14 — References & Thank You

**Type:** References + Thank-You (single slide)  
**Title:** References & Thank You

**Bullets (References):**
- S. C. Gupta & V. K. Kapoor — *Fundamentals of Mathematical Statistics*, Sultan Chand & Sons.
- R. E. Walpole, R. H. Myers, S. L. Myers & K. Ye — *Probability and Statistics for Engineers and Scientists*, Pearson.
- S. M. Ross — *Introduction to Probability and Statistics for Engineers and Scientists*.
- D. C. Montgomery — *Applied Statistics and Probability for Engineers*, Wiley.
- Course lecture notes — Probability & Statistics, Module 1 (Correlation, Regression, Curve Fitting).

**Thank-You text (bottom):**
- "Thank you for your attention — Questions are welcome."
- Sayantan Bharati | BWU/BTS/25/503 | Section B

**Visual:** Book-cover thumbnails of the reference texts, plus a "Q&A" icon. Search terms: `question and answer icon`.

**Speaker note:** These are the standard references behind this presentation. Thank you for listening — I am happy to take any questions.
