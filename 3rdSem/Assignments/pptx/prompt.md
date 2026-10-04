# PPTX Generation Prompts

This file contains **one shared instruction block** plus **4 sub-prompts** (one per subject).
For each subject, paste the **Shared Rules** + the matching **Sub-prompt** into Claude, ChatGPT, or any PPTX-making agent/tool, together with the corresponding `ppt_content_*.md` file and the `Empty_Template.pptx` design file.

The content files live in the same folder:

| Subject | Content file | Template |
|---|---|---|
| Computer Organization & Architecture | `coa/ppt_content_coa.md` | `Empty_Template.pptx` |
| Database Management Systems | `dbms/ppt_content_dbms.md` | `Empty_Template.pptx` |
| Probability & Statistics | `math/ppt_content_math.md` | `Empty_Template.pptx` |
| Python Programming | `python/ppt_content_python.md` | `Empty_Template.pptx` |

---

## Shared Rules (paste before every sub-prompt)

You are an expert presentation designer. You will turn a Markdown content spec into a finished `.pptx` file.

**Inputs you are given:**
1. A design template: `Empty_Template.pptx`.
2. A content spec: `ppt_content_<subject>.md` (14 slide sections).

**Absolute design rule — do not break this:**
- **Reuse the provided `Empty_Template.pptx` as the starting file.** Open it and build the deck *inside* it.
- **Do not change the template's design in any way:** do NOT change the slide master, slide layouts, theme colours, theme fonts, background, logo, header/footer, or decorative elements.
- **Do not create a new blank deck and "style it similarly".** Keep the template's existing look exactly.
- Use the template's existing layouts (title slide for the cover, title-and-content for the rest). Only replace the *placeholder text* and *place images inside the content area*.
- Preserve the slide size / aspect ratio of the template.

**Slide count and order (exactly 14 slides, in this order):**
1. Cover page
2. Introduction
3. Index / Agenda
4–13. Ten content slides (in the order given in the MD)
14. References & Thank-You (one combined slide)

**Text rules:**
- Keep the slide text light and readable: **max ~6 bullets per slide**, short lines, no paragraphs on the slide.
- Follow the MD exactly for wording, formulas, tables and code. Insert formulas as real equation/text objects.
- If a slide's content is too tall, **reduce font size or trim wording to fit** — do **not** add extra slides and do **not** remove whole bullet points that carry the meaning.
- Keep the small framing slides (Cover, References & Thank-You) visually consistent across all four decks.

**Visual / image rules:**
- The MD gives a **`Visual`** block for every slide. Replace it with an actual picture or diagram placed inside the template's content area (do not cover the logo/footer).
- If the MD provides a **Mermaid** or **ASCII** diagram, recreate it as a **native PowerPoint diagram** (boxes + arrows in the theme colours) so it stays editable.
- Otherwise, use the **search terms** in the MD to find a suitable free image (Wikimedia Commons / Pexels / Unsplash) and insert it. Prefer clean, high-resolution, uncluttered images.
- Preserve image aspect ratio; never stretch. Keep images inside the content bounds.
- Caption each visual briefly where useful, in the template's small caption font.

**Speaker notes:**
- Put the MD's **`Speaker note`** text into the PowerPoint **notes pane** of that slide (not on the slide). This is the spoken script.

**Output:**
- Save as `PPT_<SUBJECT-CODE>_Sayantan_Bharati.pptx` (see each sub-prompt for the exact name).
- After generating, verify: exactly 14 slides, template design unchanged, no placeholder text left, no overflowing content, and notes present on every slide.

---

## Sub-prompt 1 — Computer Organization & Architecture

Build the presentation from `coa/ppt_content_coa.md`.

**Deck details (for the cover slide and footer):**
- Title: *Digital Decibel Sound Level Indicator with Peak-Hold*
- Course: Computer Organization & Architecture (BTS30101)
- Student: Sayantan Bharati | BWU/BTS/25/503 | Section B
- Faculty: Dr. Subhankar Shome
- Department of Computer Science & Engineering, Brainware University
- Programme: B.Tech (CSE), Batch 2025, AY 2026-27 (Odd Semester 3)
- Date: 03-11-2026

**Subject-specific emphasis:**
- Recreate the system block diagram (Slide 5), the FSM state diagram (Slide 9) and the peak-hold timing diagram (Slide 8) as **native editable PowerPoint diagrams**.
- Present the VHDL snippet on Slides 11 and 12 in a monospace "code card" that matches the theme.
- Keep the reference books as short one-line entries, not full citations.

**Output file:** `PPT_BTS30101_COA_Sayantan_Bharati.pptx`

---

## Sub-prompt 2 — Database Management Systems

Build the presentation from `dbms/ppt_content_dbms.md`.

**Deck details (for the cover slide and footer):**
- Title: *Temporal Databases: Concepts and Applications*
- Course: Database Management Systems (BTS30102)
- Student: Sayantan Bharati | BWU/BTS/25/503 | Section B
- Faculty: Ataul Hoque Mandal
- Department of Computer Science & Engineering, Brainware University
- Programme: B.Tech (CSE), Batch 2025, AY 2026-27 (Odd Semester 3)
- Date: 13-10-2026

**Subject-specific emphasis:**
- Present the **valid-time / transaction-time axis diagram** (Slide 5), the **model comparison table** (Slide 6) and the **Allen interval-relations diagram** (Slide 9) clearly.
- Show SQL examples on a syntax-highlighted code card consistent with the theme.
- Keep all comparison tables neat; use the template's table style.

**Output file:** `PPT_BTS30102_DBMS_Sayantan_Bharati.pptx`

---

## Sub-prompt 3 — Probability & Statistics

Build the presentation from `math/ppt_content_math.md`.

**Deck details (for the cover slide and footer):**
- Title: *Bivariate Analysis: Correlation & Regression*
- Course: Probability & Statistics (BBS00014)
- Student: Sayantan Bharati | BWU/BTS/25/503 | Section B
- Faculty: Mrs. Rittika Bhattacharya
- Department of Mathematics, Brainware University
- Programme: B.Tech (CSE), Batch 2025, AY 2026-27 (Odd Semester 3)
- Date: 14-10-2026

**Subject-specific emphasis:**
- Render all formulas as clean equation objects (use Σ, x̄, ȳ, ρ, r, σ correctly).
- Draw the **scatter diagrams** (Slides 4, 5, 8, 11, 12) as proper plotted charts where possible, not just text.
- Present the **worked example** (Slide 12) as a small table + fitted-line plot with the predicted point marked.

**Output file:** `PPT_BBS00014_Math_Sayantan_Bharati.pptx`

---

## Sub-prompt 4 — Python Programming

Build the presentation from `python/ppt_content_python.md`.

**Deck details (for the cover slide and footer):**
- Title: *Email Validation System*
- Course: Python Programming (BES00007)
- Student: Sayantan Bharati | BWU/BTS/25/503 | Section B
- Faculty: Pranab Gharai
- Department of Computer Science & Engineering, Brainware University
- Programme: B.Tech (CSE), Batch 2025, AY 2026-27 (Odd Semester 3)
- Date: 02-11-2026

**Subject-specific emphasis:**
- Show all Python code in a monospace **code card** with syntax highlighting, using the template's colours.
- Recreate the **program flow** (Slide 8) and the **class diagram** (Slide 9) as native editable diagrams.
- Keep the valid/invalid e-mail test table (Slide 11) neat and readable.

**Output file:** `PPT_BES00007_Python_Sayantan_Bharati.pptx`

---

## Quick checklist before you finish (all four decks)

- [ ] Built **inside** `Empty_Template.pptx`; master, layouts, theme colours and fonts **unchanged**.
- [ ] Exactly **14 slides** in the order: Cover → Introduction → Index → 10 Content → References & Thank-You.
- [ ] Cover carries the correct course, code, faculty name and student details.
- [ ] Every slide has the marked visual (image or native diagram); no placeholder text left.
- [ ] Max ~6 bullets per slide; nothing overflowing or cut off.
- [ ] Speaker notes present on every slide.
- [ ] Saved with the correct file name.
