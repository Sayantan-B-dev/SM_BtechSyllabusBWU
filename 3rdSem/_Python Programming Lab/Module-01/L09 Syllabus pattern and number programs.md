# Syllabus Pattern and Number Programs

**Course:** Python Programming Lab  
**Module:** 1 | **Lecture:** 9  
**Date:** 18-Aug-2026  
**Faculty:** PRANAB GHARAI  
**CO:** CO 1  
**Learning Methodology:** Simulation  
**Reference:** Lab Manual

## Lab Objectives

- Reverse a two-digit number using arithmetic (// and %).
- Check character case (uppercase / lowercase / digit / special).
- Print the syllabus letter pattern (AAAA / BBB / CC / D).
- Print the syllabus number pattern (1 / 2 2 2 / 3 3 3 3 3).

## Theory

A two-digit number `n = 10*a + b` reverses to `10*b + a`, where `a = n // 10` and `b = n % 10`. Character case is tested with string methods `isupper()`, `islower()`, `isdigit()`. Both syllabus patterns use nested loops: the outer loop selects the row, the inner loop repeats the row symbol. Letter pattern row `i` prints `chr(ord('A') + i)` exactly `4 - i` times; number pattern row `r` prints `str(r)` exactly `2*r - 1` times.

## Procedure

1. Create a new Python file named lab09.py.
2. Read a two-digit number, validate range 10-99, print its reverse.
3. Read one character, report uppercase / lowercase / digit / special character.
4. Print the AAAA/BBB/CC/D pattern with nested loops.
5. Print the 1 / 2 2 2 / 3 3 3 3 3 pattern with nested loops.

## Source Code

```python
# Module 01 Lab 09: Syllabus number and pattern programs

# Program 1: Reverse a two-digit number
n = int(input("Enter a two-digit number: "))
if 10 <= abs(n) <= 99:
    a, b = abs(n) // 10, abs(n) % 10
    rev = 10 * b + a
    rev = rev if n > 0 else -rev
    print(f"Reverse of {n} is {rev}")
else:
    print("Not a two-digit number.")

# Program 2: Check case of a character
ch = input("Enter a single character: ")
if len(ch) == 1:
    if ch.isupper():
        print(f"'{ch}' is UPPERCASE.")
    elif ch.islower():
        print(f"'{ch}' is lowercase.")
    elif ch.isdigit():
        print(f"'{ch}' is a digit.")
    else:
        print(f"'{ch}' is a special character.")
else:
    print("Please enter exactly one character.")

# Program 3: Syllabus letter pattern
# AAAA
# BBB
# CC
# D
print("Letter pattern:")
for i in range(4):
    print(chr(ord('A') + i) * (4 - i))

# Program 4: Syllabus number pattern
# 1
# 2 2 2
# 3 3 3 3 3
print("Number pattern:")
for r in range(1, 4):
    print((' '.join([str(r)] * (2 * r - 1))))
```

## Output

```
Enter a two-digit number: 47
Reverse of 47 is 74
Enter a single character: g
'g' is lowercase.
Letter pattern:
AAAA
BBB
CC
D
Number pattern:
1
2 2 2
3 3 3 3 3
```

## Conclusion

Two-digit reversal, case checking, and both exact syllabus patterns verified with nested loops and arithmetic operators.
