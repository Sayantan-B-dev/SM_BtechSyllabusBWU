# Presentation Content — Database Management Systems (BTS30102)
<!-- Deck spec for AI PPTX generators. Keep the Empty_Template.pptx design untouched. -->

| | |
|---|---|
| **Student** | Sayantan Bharati |
| **Student Code** | BWU/BTS/25/503 |
| **Section** | B |
| **Programme** | B.Tech (CSE), Batch 2025, AY 2026-27, Odd Semester 3 |
| **Course** | Database Management Systems (BTS30102) |
| **Faculty** | Ataul Hoque Mandal |
| **Presentation Date** | 13-10-2026 |
| **Topic** | Temporal Databases: Concepts and Applications |
| **Deck size** | 14 slides = 1 Cover + 1 Introduction + 1 Index + 10 Content + 1 References & Thank-You |
| **Design** | Use `Empty_Template.pptx` theme, colours, fonts and layouts as-is (do not redesign) |
| **Visuals** | Every slide has a "Visual" block: replace it with an image/diagram. A ready inline ASCII/Mermaid diagram is given where useful. |
| **Speaker notes** | Put each "Speaker note" into the PPT notes pane (not on the slide) |
| **Style** | Light bullets, one idea per line, max ~6 bullets per slide. Do not overfill. |

> **How to read this file:** `## Slide N — Title` = one PowerPoint slide. `Bullets` = text on the slide. `Visual` = the picture/diagram to add. `Speaker note` = spoken script. The two framing slides (Cover, References & Thank-You) carry the same branding in every deck.

---

## Slide 1 — Cover Page

**Type:** Cover  
**Title:** Temporal Databases: Concepts and Applications  
**Subtitle:** Managing Data That Changes Over Time

**On-slide details (left-aligned, template title layout):**
- Course: Database Management Systems (BTS30102)
- Presented by: Sayantan Bharati | BWU/BTS/25/503 | Section B
- Programme: B.Tech (CSE), Batch 2025, AY 2026-27 (Odd Semester 3)
- Faculty: Ataul Hoque Mandal
- Department of Computer Science & Engineering, Brainware University
- Date: 13-10-2026

**Visual:** University logo (top-right) + a hero image of a "timeline / history clock" merged with a database cylinder. Search terms: `database timeline history icon`, `time database illustration`. Free sources: Wikimedia Commons (`https://commons.wikimedia.org/w/index.php?search=temporal+database`), Pexels (`https://www.pexels.com/search/database%20time/`).

**Speaker note:** Good morning. I am Sayantan Bharati. My topic is Temporal Databases — how a database can store not just the current value of data, but its entire history over time, and why that matters in the real world.

---

## Slide 2 — Introduction

**Type:** Introduction  
**Title:** Introduction — Why Do We Need Time in Databases?

**Bullets:**
- A conventional DBMS keeps only the **current state** — the old value is overwritten.
- But many questions are about the **past**: "What was the salary in 2023?"
- Overwriting data destroys the **audit trail** and the ability to reproduce past decisions.
- **Temporal databases** store time as a first-class part of every fact.
- They answer *when* a fact was true and *when* the database believed it was true.
- Built on standard DBMS ideas — schema, keys, transactions, indexing — extended with time.

**Visual:** A "before vs after" image: a single row being overwritten vs a stack of timestamped versions of the same row. Inline sketch:

```
Conventional:  Emp101 | Salary = 70000        (old value GONE)

Temporal:      Emp101 | Salary = 50000 | 2020-2023
               Emp101 | Salary = 70000 | 2023-now   (history kept)
```

Search terms: `database update overwrite vs version history`.

**Speaker note:** The core problem is simple: a normal database only shows today. The moment we update a salary, the previous salary is gone forever. Temporal databases fix this by keeping every version with a time stamp, so historical questions can still be answered.

---

## Slide 3 — Index

**Type:** Index / Agenda  
**Title:** Presentation Outline

**Bullets:**
1. The Need for Time in Data
2. Core Concepts & Time Dimensions
3. Temporal Data Models
4. Real-World Applications
5. SQL:2011 Temporal Features
6. Temporal Querying & Interval Algebra
7. Implementation & Indexing
8. Worked Example — Salary History
9. Temporal Databases & Transactions
10. Challenges, Best Practices & Future

**Visual:** A numbered "roadmap" graphic (horizontal timeline of the 10 topics). Search terms: `presentation agenda roadmap icons`.

**Speaker note:** I will start with the motivation, define the two kinds of time, survey the models and the SQL standard, look at real applications, then show implementation, a worked example, and finally the challenges and future of the field.

---

## Slide 4 — The Need for Time in Data

**Type:** Content (1/10)  
**Title:** Why Conventional Databases Fall Short

**Bullets:**
- Conventional DBMS = **snapshot database**: only the current moment is stored.
- An `UPDATE` or `DELETE` **physically destroys** the previous value.
- Audit, legal and analytical questions then become impossible or costly.
- Common workarounds are weak: history tables, shadow copies, log mining.
- History tables duplicate schema, drift over time and are hard to query uniformly.
- A temporal DBMS makes history a **built-in, queryable dimension**.

**Visual:** A diagram of a snapshot table next to a chain of versions over a timeline, with a red "X" over the overwritten value. Search terms: `snapshot database vs temporal database`, `audit trail data`.

**Speaker note:** Before defining anything, it is worth seeing the gap. Normal updates erase history. People patch this with manual history tables, but those are clumsy and error-prone. A temporal database treats time as a natural part of the schema instead of an afterthought.

---

## Slide 5 — Core Concepts & Time Dimensions

**Type:** Content (2/10)  
**Title:** The Two Kinds of Time

**Bullets:**
- **Valid time** (application time): when the fact is true in the real world.
- **Transaction time** (system time): when the fact was stored/believed by the DBMS.
- **Bitemporal** databases track *both* at once.
- Examples: "the price *was* valid in March" vs "the price *was recorded* on 2 April".
- **Timestamp** = a single instant; **interval/period** = a start and end.
- These dimensions give rise to the **bitemporal cube** of possible questions.

**Visual:** A 2-D axis diagram: x-axis = valid time, y-axis = transaction time, with data points. Inline:

```
transaction time (belief)
        ^
        |   *--*   recorded later, but valid earlier
        |  *  *
        | *  *  *
        +-----------------> valid time (truth)
```

Search terms: `valid time transaction time bitemporal`, `bitemporal data model diagram`.

**Speaker note:** The single most important idea today is that there are two different clocks. Valid time says when something was true in the real world; transaction time says when our database learned it. A bitemporal system keeps both, which lets us ask questions like "what did we believe last month, and what was actually true then?"

---

## Slide 6 — Temporal Data Models

**Type:** Content (3/10)  
**Title:** Temporal Data Models

**Bullets:**
- **Snapshot model** — no time; classic DBMS.
- **Rollback / transaction-time model** — versions by when they were stored.
- **Valid-time (historical) model** — versions by real-world validity.
- **Bitemporal model** — both valid and transaction time.
- **SQL:2011** standardised these as **system-versioned** and **application-time period** tables.
- Each model trades storage and complexity for richer history.

**Visual:** A comparison table (model | time axes | typical use) plus a small timeline illustration. Inline table:

```
Model              Valid time  Trans. time  Typical use
Snapshot               -           -        Current-only apps
Rollback               -          Yes       Auditing, recovery
Valid-time            Yes          -        Contract/price history
Bitemporal            Yes         Yes       Regulatory, finance
```

Search terms: `temporal database models comparison table`.

**Speaker note:** There is a ladder of models. A snapshot database remembers nothing. A rollback database remembers when data was written. A valid-time database remembers when data was true. Bitemporal combines both. SQL 2011 gave us standard syntax for the first and third of these.

---

## Slide 7 — Real-World Applications

**Type:** Content (4/10)  
**Title:** Where Temporal Databases Are Used

**Bullets:**
- **Banking & finance** — balances, interest rates and transaction histories.
- **Insurance** — policies valid over ranges; claims recorded later.
- **Healthcare** — patient conditions valid over time vs when entered.
- **Audit & compliance** — immutable, queryable audit trails.
- **Supply chain & telecom** — pricing, inventory and billing history.
- **Data warehousing** — type-2 slowly changing dimensions are temporal by nature.

**Visual:** An icon grid of industries (bank, hospital, factory, warehouse, phone) each with a small clock overlay. Search terms: `industry icons banking healthcare supply chain`, `temporal data applications`.

**Speaker note:** Temporal databases are not academic. Every time you see a bank statement, an insurance policy history, or a patient record that shows changes over time, you are seeing temporal data. Regulators increasingly require that this history is retained and queryable.

---

## Slide 8 — SQL:2011 Temporal Features

**Type:** Content (5/10)  
**Title:** Querying Time with SQL:2011

**Bullets:**
- **System-versioned tables** start with: `WITH SYSTEM VERSIONING`.
- **Application-time period tables** declare: `PERIOD FOR valid_time (start_date, end_date)`.
- Query a past state: `SELECT ... FOR SYSTEM_TIME AS OF TIMESTAMP '2023-06-01'`.
- Update only a portion of history: `UPDATE ... FOR PORTION OF valid_time FROM ... TO ...`.
- Temporal primary keys prevent overlapping valid periods.
- This turns history queries into normal SQL instead of hand-written joins.

**Visual:** A syntax-highlighted code card with the statements above and a small "AS OF" clock icon. Inline snippet:

```sql
CREATE TABLE salary (
  emp_id     INT,
  amount     DECIMAL(10,2),
  valid_time PERIOD FOR valid_time (from_date, to_date),
  PRIMARY KEY (emp_id, valid_time WITHOUT OVERLAPS)
) WITH SYSTEM VERSIONING;

-- What did the system store on 1 June 2023?
SELECT * FROM salary FOR SYSTEM_TIME AS OF TIMESTAMP '2023-06-01';
```

Search terms: `SQL 2011 temporal syntax`, `system versioned table SQL example`.

**Speaker note:** The beauty of SQL 2011 is that it hides all the complexity behind familiar syntax. `FOR SYSTEM_TIME AS OF` gives you the database as it looked on any past date. Application-time periods let updates affect only a slice of history. So the developer writes ordinary SQL.

---

## Slide 9 — Temporal Querying & Interval Algebra

**Type:** Content (6/10)  
**Title:** Asking Questions About Intervals

**Bullets:**
- Time can be an **instant** (timestamp) or an **interval/period** (start, end).
- **Allen's interval algebra** defines 13 possible relations between two intervals.
- Examples: `before`, `after`, `meets`, `overlaps`, `contains`, `during`, `equals`.
- Temporal SQL extends joins and predicates with these relations.
- Finding overlaps is the most common operation (e.g., "who held the role then?").
- Efficient interval logic is what separates temporal query languages from plain SQL.

**Visual:** Allen's 13 interval relations as a classic diagram of horizontal bars. Inline simplification:

```
A: [----]
B:   [----]     overlaps
C:       [----] after / meets
D: [----------] contains A
```

Search terms: `Allen interval algebra 13 relations diagram`, `temporal interval relations`.

**Speaker note:** Once time is a period rather than a point, comparisons multiply. Allen's algebra enumerates all thirteen ways two intervals can relate — before, overlaps, contains and so on. Temporal query languages embed these so that "overlapping" queries become one predicate instead of a tangle of greater-than and less-than conditions.

---

## Slide 10 — Implementation & Indexing

**Type:** Content (7/10)  
**Title:** How Temporal Databases Are Built

**Bullets:**
- **Tuple versioning:** store one row per version, each with start/end timestamps.
- **Attribute-level timestamping:** timestamp individual changed columns (saves space).
- **Transaction-time** gives an append-only, immutable store — high write throughput.
- Indexing must handle **ranges**, not just points — e.g., interval / temporal B+ trees.
- Common structures: R-trees for intervals, temporal B+ trees, append-only LSM stores.
- MVCC and timestamping (from the concurrency unit) are close cousins of temporal storage.

**Visual:** A diagram of a B+ tree index keyed on (id, time) with an interval scan highlighted, plus tuple-versioning layout. Search terms: `temporal index B+ tree`, `MVCC multi-version storage`.

**Speaker note:** Implementation choices matter. The simplest is to store every version as its own row with a start and end time. That makes writes append-only and fast, and it links naturally to MVCC and transaction logging from the concurrency chapter. The tricky part is indexing ranges efficiently, which is why interval-aware trees are used.

---

## Slide 11 — Worked Example — Salary History

**Type:** Content (8/10)  
**Title:** Worked Example — Tracking Salaries

**Bullets:**
- Scenario: an employee's salary changes over time; we must answer past questions.
- Store each version with `from_date`, `to_date` (**valid time**).
- Query 1: salary on a given date → select the row whose period contains it.
- Query 2: full raise history → order rows by `from_date`.
- Query 3: total cost over a period → join with interval overlap.
- With system versioning, also ask "what did the DB believe on date X?".

**Visual:** A small timeline with two salary periods and the three queries annotated. Inline data:

```
emp_id  amount   from_date    to_date
101     50000    2020-01-01   2023-01-01
101     70000    2023-01-01   9999-12-31

-- salary on 2021-05-10 (period contains the date)
SELECT amount FROM salary
WHERE emp_id = 101 AND DATE '2021-05-10' BETWEEN from_date AND to_date;
```

Search terms: `slowly changing dimension type 2 example`, `salary history timeline`.

**Speaker note:** This is the same idea we just discussed, made concrete. Each salary change becomes a new row with a validity period instead of an overwrite. Finding the salary on any date is now just a range check, and the full raise history is simply all the rows in order.

---

## Slide 12 — Temporal Databases & Transactions

**Type:** Content (9/10)  
**Title:** Ties to Transactions & Concurrency

**Bullets:**
- Transaction time is exactly what a **transaction log / recovery** already records.
- **MVCC** keeps multiple versions of a row — the same versioning idea.
- Timestamp-based schedulers already order operations by time.
- Temporal storage is naturally **append-only**, so it is rollback-friendly.
- Serializability still applies: history must reflect a consistent order of transactions.
- This connects directly to the course's transaction, ACID and recovery modules.

**Visual:** A diagram linking the transaction log → MVCC versions → bitemporal store, with the ACID letters highlighted. Search terms: `MVCC version chain`, `database transaction log`.

**Speaker note:** Temporal databases are not a completely separate world. Transaction time is essentially the story a transaction log already tells, and multi-version concurrency control already stores several versions of a row. Temporal storage simply promotes that internal mechanism to a first-class, user-queryable feature.

---

## Slide 13 — Challenges, Best Practices & Future

**Type:** Content (10/10)  
**Title:** Challenges, Best Practices & Future

**Bullets:**
- **Storage growth** — every change becomes a permanent version.
- **Performance** — range/interval indexes are costlier than point indexes.
- **Complexity** — developers must reason about two timelines.
- **Privacy** — "right to be forgotten" conflicts with immutable history; needs crypto-shredding.
- **Best practices:** define retention policy, choose the right model, index intervals, separate hot/cold data.
- **Future:** cloud temporal services, ML on history, blockchain-anchored audit trails.

**Visual:** A balanced scorecard graphic (benefits vs challenges) plus a small "future" arrow. Search terms: `data retention policy icon`, `blockchain audit trail`.

**Speaker note:** Every powerful idea has a cost. Keeping all history means storage grows forever, interval queries are slower than point queries, and privacy law can clash with immutability. The practical answer is a clear retention policy and the right model, and the field is moving toward cloud-hosted temporal services.

---

## Slide 14 — References & Thank You

**Type:** References + Thank-You (single slide)  
**Title:** References & Thank You

**Bullets (References):**
- A. Silberschatz, H. Korth, S. Sudarshan — *Database System Concepts* (7th ed.), McGraw Hill.
- R. Elmasri & S. Navathe — *Fundamentals of Database Systems*, Addison-Wesley.
- ISO/IEC 9075 — **SQL:2011** temporal features (system-versioned & application-time tables).
- R. T. Snodgrass — *Developing Time-Oriented Database Applications in SQL*.
- Course lecture notes — DBMS Modules 1–3 (data models, transactions, storage).

**Thank-You text (bottom):**
- "Thank you for your attention — Questions are welcome."
- Sayantan Bharati | BWU/BTS/25/503 | Section B

**Visual:** Book-cover thumbnails of Korth & Silberschatz and Elmasri & Navathe, plus a "Q&A" icon. Search terms: `question and answer icon`.

**Speaker note:** These are the standard references behind this presentation. Thank you for listening — I am happy to take any questions.
