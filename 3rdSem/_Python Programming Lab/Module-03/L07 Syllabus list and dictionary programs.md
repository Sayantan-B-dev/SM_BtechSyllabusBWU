# Syllabus List and Dictionary Programs

**Course:** Python Programming Lab  
**Module:** 3 | **Lecture:** 7  
**Date:** 04-Sep-2026  
**Faculty:** PRANAB GHARAI  
**CO:** CO 3  
**Learning Methodology:** Simulation  
**Reference:** Lab Manual

## Lab Objectives

- Remove duplicates, find second max, list squares of first 20 numbers.
- Check symmetric / skew-symmetric matrix, row-wise sums.
- Build positive-only tuple, alphabet-occurrence dict, marks-sorted dict, DOB menu-driven dict.

## Theory

Second max is found in one pass tracking `first` and `second`. A matrix `A` is symmetric if `A == transpose(A)`, skew-symmetric if `A == -transpose(A)` with zero diagonal. Row-wise sums use `sum(row)`. Positive-only tuple is `tuple(x for x in lst if x > 0)`. Alphabet occurrence uses `dict.get(ch, 0) + 1`. Marks sorting uses `sorted(d.items(), key=lambda kv: kv[1], reverse=True)`. The DOB book demonstrates insert/update/delete/pop with a menu loop.

## Procedure

1. Create a new Python file named lab18.py.
2. Implement list tasks: dedup (order-preserving), second max, squares 1-20.
3. Implement matrix tasks: symmetric/skew check, row-wise sums.
4. Implement tuple/dict tasks: positive-only tuple, alphabet count, marks descending, DOB menu program.

## Source Code

```python
# Module 03 Lab 07: Syllabus list and dictionary programs

# --- List tasks ---
data = [5, 3, 8, 3, 9, 5, 1, 8]
unique = list(dict.fromkeys(data))
print(f"Without duplicates: {unique}")

first = second = float('-inf')
for x in data:
    if x > first:
        second, first = first, x
    elif first > x > second:
        second = x
print(f"Second max of {data} is {second}")

squares = [x ** 2 for x in range(1, 21)]
print(f"Squares 1-20: {squares}")

# --- Matrix tasks ---
def transpose(m):
    return [[m[j][i] for j in range(len(m))] for i in range(len(m[0]))]

def check_matrix(m):
    t = transpose(m)
    neg_t = [[-v for v in row] for row in t]
    if m == t:
        return "symmetric"
    if m == neg_t:
        return "skew-symmetric"
    return "neither symmetric nor skew-symmetric"

A = [[1, 2, 3], [2, 4, 5], [3, 5, 6]]
B = [[0, 2, -3], [-2, 0, 4], [3, -4, 0]]
print(f"A is {check_matrix(A)}; B is {check_matrix(B)}")
print(f"Row-wise sums of A: {[sum(row) for row in A]}")

# --- Tuple from positives ---
mixed = [4, -2, 0, 7, -5, 9]
positives = tuple(x for x in mixed if x > 0)
print(f"Positive-only tuple from {mixed}: {positives}")

# --- Alphabet occurrence dict ---
s = input("Enter a string for alphabet count: ").lower()
freq = {}
for ch in s:
    if ch.isalpha():
        freq[ch] = freq.get(ch, 0) + 1
print(f"Alphabet occurrences: {freq}")

# --- Marks dict sorted descending ---
marks = {"Asha": 82, "Ravi": 95, "Mina": 76, "Dev": 88}
ranked = sorted(marks.items(), key=lambda kv: kv[1], reverse=True)
print("Names by marks (desc):")
for name, m in ranked:
    print(f"  {name}: {m}")

# --- DOB menu-driven dict ---
dob = {"Asha": "2005-04-12", "Ravi": "2004-11-02"}
while True:
    print("\nDOB book: 1=Insert 2=Delete 3=Update 4=Show 0=Exit")
    choice = input("Choice: ").strip()
    if choice == "0":
        break
    elif choice == "1":
        dob[input("Name: ")] = input("DOB (YYYY-MM-DD): ")
    elif choice == "2":
        dob.pop(input("Name to delete: "), None)
    elif choice == "3":
        name = input("Name to update: ")
        if name in dob:
            dob[name] = input("New DOB: ")
        else:
            print("Not found.")
    elif choice == "4":
        print(dob)
    else:
        print("Invalid choice.")
```

## Output

```
Without duplicates: [5, 3, 8, 9, 1]
Second max of [5, 3, 8, 3, 9, 5, 1, 8] is 8
Squares 1-20: [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400]
A is symmetric; B is skew-symmetric
Row-wise sums of A: [6, 11, 14]
Positive-only tuple from [4, -2, 0, 7, -5, 9]: (4, 7, 9)
Alphabet occurrences: {'h': 1, 'e': 1, 'l': 2, 'o': 1}
Names by marks (desc):
  Ravi: 95
  Dev: 88
  Asha: 82
  Mina: 76
```

## Conclusion

All nine syllabus Module-III tasks covered in one runnable lab file.
