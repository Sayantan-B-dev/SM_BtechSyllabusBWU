# Syllabus String Programs with for Loop

**Course:** Python Programming Lab  
**Module:** 2 | **Lecture:** 5  
**Date:** 25-Aug-2026  
**Faculty:** PRANAB GHARAI  
**CO:** CO 2  
**Learning Methodology:** Simulation  
**Reference:** Lab Manual

## Lab Objectives

- Reverse a string using a for loop (no slicing, no reversed()).
- Remove all vowels from a string.
- Count occurrences of a given character.

## Theory

Reversal with a for loop builds the result by prepending each character: `rev = ch + rev`. Vowel removal keeps characters not in `aeiouAEIOU`. Counting increments a counter on each match; `str.count()` is shown only to cross-check the manual loop.

## Procedure

1. Create a new Python file named lab14.py.
2. Reverse an input string with a for loop and print it.
3. Remove vowels from an input string and print the result.
4. Count a given character in a string with a loop; verify with `count()`.

## Source Code

```python
# Module 02 Lab 05: Syllabus string programs (for-loop style)

# Program 1: Reverse a string using a for loop
s = input("Enter a string to reverse: ")
rev = ""
for ch in s:
    rev = ch + rev
print(f"Reversed: {rev}")

# Program 2: Remove vowels from a string
text = input("Enter a string to remove vowels: ")
vowels = "aeiouAEIOU"
no_vowels = ""
for ch in text:
    if ch not in vowels:
        no_vowels += ch
print(f"Without vowels: {no_vowels}")

# Program 3: Count a given character
hay = input("Enter a string to search: ")
target = input("Enter the character to count: ")
count = 0
for ch in hay:
    if ch == target:
        count += 1
print(f"'{target}' occurs {count} times (verified: {hay.count(target)})")
```

## Output

```
Enter a string to reverse: hello
Reversed: olleh
Enter a string to remove vowels: programming
Without vowels: prgrmmng
Enter a string to search: banana
Enter the character to count: a
'a' occurs 3 times (verified: 3)
```

## Conclusion

All three syllabus string tasks implemented with explicit for loops, as required.
