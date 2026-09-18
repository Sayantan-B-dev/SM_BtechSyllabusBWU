# Syllabus Function Programs Pangram Bubble Sort Palindrome

**Course:** Python Programming Lab  
**Module:** 4 | **Lecture:** 7  
**Date:** 18-Sep-2026  
**Faculty:** PRANAB GHARAI  
**CO:** CO 4  
**Learning Methodology:** Simulation  
**Reference:** Lab Manual

## Lab Objectives

- Pangram check for "the quick brown fox jumps over the lazy dog".
- Count lowercase / uppercase characters with a function.
- Palindrome check without using string reversal/slicing.
- Show local vs global variables with lambda use.
- Linear search, bubble sort, sum of positives via function arguments.

## Theory

A pangram contains all 26 letters; test with `set(filter(str.isalpha, s.lower()))`. Case counting uses `isupper()`/`islower()`. Numeric palindrome reverses digits arithmetically (`rev = rev*10 + n%10`) so no string conversion is used. Bubble sort repeatedly swaps adjacent out-of-order pairs (O(n^2)). `global` keyword lets a function rebind a module-level counter, demonstrating scope.

## Procedure

1. Create a new Python file named lab25.py.
2. Implement `is_pangram`, `count_case`, `is_palindrome_num` functions.
3. Demonstrate local/global scope with a lambda comparator.
4. Implement `linear_search`, `bubble_sort`, `sum_positives(*args)`.

## Source Code

```python
# Module 04 Lab 07: Syllabus function programs
import string

# Program 1: pangram check
def is_pangram(s):
    """Return True if s contains every letter a-z at least once."""
    return set(string.ascii_lowercase) <= set(filter(str.isalpha, s.lower()))

print(is_pangram("the quick brown fox jumps over the lazy dog"))  # True

# Program 2: lowercase / uppercase counter
def count_case(s):
    """Return (lower_count, upper_count) for string s."""
    lower = sum(1 for c in s if c.islower())
    upper = sum(1 for c in s if c.isupper())
    return lower, upper

print(count_case("Hello World"))  # (8, 2)

# Program 3: palindrome without strings
def is_palindrome_num(n):
    """Check palindrome using arithmetic only (no str/slicing)."""
    if n < 0:
        return False
    orig, rev = n, 0
    while n > 0:
        rev = rev * 10 + n % 10
        n //= 10
    return orig == rev

print(is_palindrome_num(121), is_palindrome_num(123))  # True False

# Program 4: local/global + lambda
total_calls = 0

def tracked_max(a, b):
    """Return max using lambda; increments global counter."""
    global total_calls
    total_calls += 1
    bigger = (lambda x, y: x if x > y else y)(a, b)  # local lambda
    return bigger

print(tracked_max(3, 7), tracked_max(10, 2), "calls:", total_calls)

# Program 5: linear search
def linear_search(lst, target):
    """Return index of target or -1."""
    for i, v in enumerate(lst):
        if v == target:
            return i
    return -1

print(linear_search([4, 2, 9, 1], 9))  # 2

# Program 6: bubble sort
def bubble_sort(lst):
    """Return a new sorted list using bubble sort."""
    arr = list(lst)
    n = len(arr)
    for i in range(n):
        swapped = False
        for j in range(n - 1 - i):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
                swapped = True
        if not swapped:
            break
    return arr

print(bubble_sort([5, 1, 4, 2, 8]))  # [1, 2, 4, 5, 8]

# Program 7: sum of positives passed as arguments
def sum_positives(*args):
    """Return sum of positive numbers among args."""
    return sum(x for x in args if x > 0)

print(sum_positives(4, -2, 7, -5, 9))  # 20
```

## Output

```
True
(8, 2)
True False
7 10 calls: 2
2
[1, 2, 4, 5, 8]
20
```

## Conclusion

All seven syllabus Module-IV function tasks implemented as documented, tested functions.
