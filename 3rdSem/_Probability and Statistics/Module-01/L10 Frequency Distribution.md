# Frequency Distribution

**Course:** Probability and Statistics  
**Module:** 1 | **Lecture:** 10  
**Date:** 11-Jul-2026  
**Faculty:** RITTIKA BHATTACHARYA  
**CO:** CO 1  
**Learning Methodology:** Chalk & Talk  
**Reference:** Fundamentals of Mathematical Statistics (Gupta & Kapoor) Chapter: 2.2-2.8

## Notes

### 1. Raw Data vs Grouped Data

Raw (ungrouped) data lists every observation individually. It is hard to interpret when `n` is large. A **frequency distribution** condenses data by grouping values into classes and counting how many observations fall in each class.

**Example:** Marks of 20 students: 12, 15, 18, 21, 24, 12, 15, 15, 18, 21, 24, 24, 24, 12, 18, 18, 21, 15, 12, 21. As a list this tells us little. As a frequency table it is immediately clear which mark is most common.

### 2. Discrete Frequency Distribution

Used when the variable takes a small number of distinct (usually integer) values. Two columns: value `x` and frequency `f`.

**Example 1:** Number of children in 30 families.

| x (children) | 0 | 1 | 2 | 3 | 4 |
|---|---|---|---|---|---|
| f (families) | 4 | 9 | 10 | 5 | 2 |

```
N = sum f = 4 + 9 + 10 + 5 + 2 = 30
```

### 3. Continuous Frequency Distribution (Grouped Data)

Used when the variable is continuous or takes many values. Data is grouped into **class intervals**.

**Key terms:**
- **Class limits:** stated endpoints, e.g. 10-20 (lower 10, upper 20).
- **Class boundaries:** true endpoints for continuous data, e.g. 9.5-19.5 (removes gap between 10-20 and 20-30).
- **Class mark (midpoint):** `xi = (Lower limit + Upper limit) / 2`.
- **Class width:** `h = Upper boundary - Lower boundary` (keep uniform where possible).
- **Frequency `fi`:** number of observations in class `i`.
- **Total frequency:** `N = sum fi`.

**Example 2:** Heights (cm) of 40 students grouped in width 10.

| Class | 140-150 | 150-160 | 160-170 | 170-180 |
|---|---|---|---|---|
| fi | 6 | 14 | 12 | 8 |
| xi (mark) | 145 | 155 | 165 | 175 |

```
N = 6 + 14 + 12 + 8 = 40
```

**How to choose number of classes:** Sturges' rule `k = 1 + 3.322 * log10(N)`. For N = 40, k ~= 6. Round to a convenient width (5, 10, etc.). Too few classes hides detail; too many defeats the purpose of grouping.

### 4. Cumulative Frequency

- **Less-than cf:** number of observations below the upper boundary of the class.
- **More-than cf:** number of observations above the lower boundary of the class.

**Example 2 continued:**

| Class | fi | Less-than cf | More-than cf |
|---|---|---|---|
| 140-150 | 6 | 6 | 40 |
| 150-160 | 14 | 20 | 34 |
| 160-170 | 12 | 32 | 20 |
| 170-180 | 8 | 40 | 8 |

### 5. Relative and Percentage Frequency

```
Relative frequency = fi / N
Percentage frequency = (fi / N) * 100
```

For Example 2: 6/40 = 0.15 (15%), 14/40 = 0.35 (35%), 12/40 = 0.30 (30%), 8/40 = 0.20 (20%).

### 6. Graphical Representation

1. **Histogram:** bars for each class, width = class width, height = frequency (or frequency density if widths unequal). No gaps between bars for continuous data.
2. **Frequency polygon:** join midpoints of histogram tops with straight lines; close the polygon at both ends on the x-axis.
3. **Frequency curve:** smoothed version of the polygon.
4. **Ogive (cumulative frequency curve):** plot less-than cf vs upper boundary (rising curve) and more-than cf vs lower boundary (falling curve). Their intersection gives the **median** graphically.
5. **Bar diagram:** for discrete frequency distribution (gaps between bars allowed).

### 7. Worked Example

**Problem:** Compute mean from the frequency distribution in Example 2 using `x_bar = (sum fi*xi) / N`.

Solution:
```
fi*xi = 6*145 + 14*155 + 12*165 + 8*175
      = 870 + 2170 + 1980 + 1400
      = 6420
x_bar = 6420 / 40 = 160.5 cm
```

**Problem:** Construct less-than ogive data for Example 2.

Solution: Plot points (150, 6), (160, 20), (170, 32), (180, 40) and join with smooth curve.

---

## Practice Problems

1. Distinguish between discrete and continuous frequency distribution with one example each.
<details>
<summary>Show Answer</summary>
Discrete: small set of distinct values (e.g. children per family table above). Continuous: values grouped into intervals (e.g. heights 140-150, 150-160). Use discrete when values are few integers; group when continuous or many values.
</details>

2. For classes 10-20 (f=5), 20-30 (f=8), 30-40 (f=7), find N, class marks, and relative frequencies.
<details>
<summary>Show Answer</summary>
N = 20. Marks: 15, 25, 35. Relative: 0.25, 0.40, 0.35.
</details>

3. What is an ogive and how is median read from it?
<details>
<summary>Show Answer</summary>
Ogive is the cumulative frequency curve. Plot less-than and more-than ogives; their intersection's x-coordinate is the median. Alternatively, median = value where less-than cf = N/2.
</details>

4. Why is uniform class width preferred?
<details>
<summary>Show Answer</summary>
Histogram bar areas then directly represent frequencies, mean/median/mode formulae for grouped data assume uniform width h, and comparison across classes is fair.
</details>

5. Link to next lecture: how is this table used in L02-L04?
<details>
<summary>Show Answer</summary>
L02 mean for grouped data uses fi and xi from this table. L03 moments use sum fi*(xi-mean)^r. L04 skewness/kurtosis are functions of those moments. Bivariate extension (L05) is a two-way frequency table.
</details>
