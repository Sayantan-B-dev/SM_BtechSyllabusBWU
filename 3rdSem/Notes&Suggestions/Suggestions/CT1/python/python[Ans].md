# Python CT1 — Complete Answers

> Same content as `python[Ans].txt`, formatted for Markdown.
> All code blocks are copy-paste ready.

---

## Part A: 22/07/2026 — Basics + Control Flow

### Q1. Explain the key features of Python programming language.

1. Simple and readable — English-like syntax.
2. Interpreted — runs line by line, no compilation needed.
3. Dynamically typed — no need to declare `int`, `float`, etc. Example: `x = 10`.
4. High-level + portable — same code runs on Windows / Linux with interpreter.
5. Large library — `math`, `string`, `random`, etc.
6. Object-oriented + functional support.
7. Free and open source.
8. Used in AI, web, automation, data science.

### Q2. Discuss different data types in Python with uses.

| Type | Example | Use |
|------|---------|-----|
| `int` | `x = 10` | count, factorial, age |
| `float` | `p = 10.5` | average, percentage |
| `str` | `s = "hello"` | name, sentence processing |
| `bool` | `True` / `False` | conditions, flags |
| `list` | `[1,2,3]` | marks, item list (changeable) |
| `tuple` | `(1,2,3)` | fixed data like date (unchangeable) |
| `dict` | `{"a":1}` | student record, phone book |
| `set` | `{1,2,3}` | remove duplicates |

```python
x = 10          # int
y = 10.5        # float
s = "hello"     # str
l = [1, 2, 3]   # list
t = (1, 2, 3)   # tuple
d = {"a": 1}    # dict
```

### Q3. Explain the structure of if, elif, else with functionality.

Used for decision making.

```python
if condition1:
    statement-1
elif condition2:
    statement-2
else:
    statement-3
```

- **if**: checked first. If True, its block runs.
- **elif**: checked only if previous if/elif is False. Any number allowed.
- **else**: runs when all above are False. Optional.

```python
marks = 75
if marks >= 90:
    print("A")
elif marks >= 60:
    print("B")
else:
    print("C")
# Output: B
```

### Q4. Explain the use of break and continue in loops.

- **break**: stops the loop fully and comes out.
- **continue**: skips current round, goes to next round. Loop does NOT stop.

```python
for i in range(1, 6):
    if i == 3:
        break
    print(i)
# Output: 1 2  (loop stops at 3)

for i in range(1, 6):
    if i == 3:
        continue
    print(i)
# Output: 1 2 4 5  (3 is skipped)
```

---

## Part B: 5 Marks — Theory

### Q5. Write a Python program and explain its working procedure.

Steps:

1. Write source code in `.py` file.
2. Interpreter reads line by line.
3. Converts to bytecode (`.pyc`).
4. PVM (Python Virtual Machine) converts bytecode to machine code.
5. Output is shown.

```python
# add.py
a = 10
b = 20
c = a + b
print("Sum =", c)
# Output: Sum = 30
```

Explanation: `a`, `b` store 10, 20. `c` stores sum. `print()` displays result.

### Q6. Explain the features and advantages of Python.

Same as Q1. For 5 marks write 6–7 points:

1. Easy to learn and read.
2. No header / semicolon / brackets needed.
3. Dynamic typing saves time.
4. Huge libraries reduce code length.
5. Portable across OS.
6. Supports OOP, used in real projects.
7. Less code: 5-line Python = 20-line C/Java.

### Q7. Describe and differentiate various operators.

1. **Arithmetic**: `+ - * / // % **` — e.g. `7 // 2 = 3`, `2 ** 3 = 8`
2. **Relational**: `== != > < >= <=` — e.g. `5 > 3` gives `True`
3. **Logical**: `and, or, not` — e.g. `(a>5 and b<10)`
4. **Assignment**: `= += -= *= /=` — e.g. `x += 2`
5. **Membership**: `in, not in` — e.g. `"a" in "apple"`
6. **Identity**: `is, is not`
7. **Bitwise**: `& | ^ << >>`

### Q8. Application of for and while loops + real life.

- **for**: when number of times is known.
- **while**: when condition-based, times unknown.

```python
# for: print names
names = ["A", "B", "C"]
for n in names:
    print(n)

# while: ask password till correct
pwd = ""
while pwd != "1234":
    pwd = input("Enter pwd: ")
```

Real life:

- `for`: attendance list, marks of 60 students.
- `while`: ATM pin retry, game loop till exit, sensor reading.

### Q9. Uses of break, continue, pass + loop control.

- **break**: exit loop. Ex: stop search when item found.
- **continue**: skip one iteration. Ex: skip absent student.
- **pass**: do-nothing placeholder where Python expects a block.

```python
for i in range(5):
    if i == 2:
        pass      # do nothing, go ahead
    print(i)
```

Loop control flow:

```text
start loop
    |
 condition?
  /    \
True   False -> exit
 |
break? -> Yes -> exit loop
 |
continue? -> Yes -> next round
 |
normal body -> next round
```

### Q10. What is source code, byte code, machine code? How connected?

1. **Source code (`.py`)**: human-readable code you write.
2. **Byte code (`.pyc`)**: intermediate code in `__pycache__`. Portable.
3. **Machine code (0/1)**: CPU-readable binary. Actually executed.

```text
Source (.py)
    |
    v  [compile]
Bytecode (.pyc)
    |
    v  [PVM interprets]
Machine code (0/1)
    |
    v
CPU executes -> Output
```

---

## Part C: Programs

### Q11. Reverse a 2-digit number.

```python
n = int(input("Enter 2-digit no: "))
rev = (n % 10) * 10 + (n // 10)
print("Reverse =", rev)
# Input 42 -> Output 24
```

Method: `42 % 10 = 2`, `42 // 10 = 4`, so `2*10+4 = 24`.

### Q12. Check case of a character.

```python
ch = input("Enter a character: ")
if ch.isupper():
    print(ch, "is UPPERCASE")
elif ch.islower():
    print(ch, "is lowercase")
else:
    print(ch, "is not a letter")
```

### Q13. Maximum among three numbers.

```python
a = int(input("Enter a: "))
b = int(input("Enter b: "))
c = int(input("Enter c: "))
m = max(a, b, c)
print("Maximum =", m)
```

Without `max`:

```python
if a >= b and a >= c:
    print(a)
elif b >= a and b >= c:
    print(b)
else:
    print(c)
```

### Q14. Factorial of a number.

```python
n = int(input("Enter n: "))
fact = 1
for i in range(1, n + 1):
    fact = fact * i
print("Factorial =", fact)
# Input 5 -> 120
```

### Q15. GCD of two numbers.

```python
import math
a = int(input("Enter a: "))
b = int(input("Enter b: "))
print("GCD =", math.gcd(a, b))
```

Manual method:

```python
a, b = 12, 18
while b != 0:
    a, b = b, a % b
print(a)  # 6
```

### Q16. Prime or composite.

```python
n = int(input("Enter n: "))
if n < 2:
    print("Neither prime nor composite")
else:
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            print("Composite")
            break
    else:
        print("Prime")
```

### Q17. Pattern 1

```text
AAAA
 BBB
  CC
   D
```

```python
s = "ABCD"
for i in range(4):
    print(" " * i + s[i] * (4 - i))
```

### Q18. Pattern 2

```text
  1
 222
33333
```

```python
for i in range(1, 4):
    sp = " " * (3 - i)
    print(sp + str(i) * (2 * i - 1) + sp)
```

Logic: spaces = `3-i`, digits = `2*i-1`.

---

## Part D: 05/08/2026 — Strings

### Q19. Various string functions with examples.

- `len("abc")` = 3
- `"hi".upper()` = `"HI"`
- `" a ".strip()` = `"a"`
- `"a b".split()` = `["a","b"]`
- `"-".join(["a","b"])` = `"a-b"`
- `"hi".replace("h","b")` = `"bi"`
- `"abc".find("b")` = 1
- `"aaa".count("a")` = 3

### Q20. Difference between slicing and indexing.

- **Indexing**: gets ONE character. `s="hello"`, `s[0]="h"`.
- **Slicing**: gets a PART. `s[start:stop:step]`, `s[1:4]="ell"`, `s[::-1]` reverses.

```text
s =  h  e  l  l  o
idx  0  1  2  3  4
s[1] = e      (indexing, 1 char)
s[1:4] = ell  (slicing, many chars)
```

### Q21. String methods with examples.

1. `capitalize()`: `"hello"` → `"Hello"`
2. `title()`: `"my name"` → `"My Name"`
3. `startswith()` / `endswith()`: returns True/False
4. `isalpha()` / `isdigit()` / `isalnum()`: type check
5. `zfill()`: `"5".zfill(3)` = `"005"`

### Q22. Program using slicing + indexing to extract data.

```python
s = "2026-08-05:Marks=85"
date = s[0:10]        # slicing
marks = s[-2:]        # last 2 chars
print("Date:", date)  # 2026-08-05
print("Marks:", marks)  # 85
print("First char:", s[0])
print("Reverse:", s[::-1][:10])
```

### Q23. Output of concatenation and repetition.

- `+` joins: `"a"+"b" = "ab"`
- `*` repeats: `"hi"*3 = "hihihi"`

```python
print("Python" + " " + "Lab")  # Python Lab
print("Ha" * 3)                # HaHaHa
print(len("ab" * 4))           # 8
```

### Q24. Develop string results using multiple methods.

```python
s = "  Hello, Python World!  "
print(s.strip().lower().replace("world", "lab"))
# hello, python lab!
words = s.split()
print(words)            # ['Hello,', 'Python', 'World!']
print("-".join(words))  # Hello,-Python-World!
```

Effectiveness: chaining reduces lines, faster than manual loops.

---

## Part E: 12/08/2026 — List / Tuple / Dict

### Q25. Difference between tuple and list + uses.

| List `[]` | Tuple `()` |
|-----------|------------|
| Changeable | Unchangeable |
| Slower | Faster, less memory |
| Ex: `[1,2,3]` | Ex: `(1,2,3)` |
| Use: marks, cart | Use: date, coords |

```python
l = [1, 2]
l.append(3)   # OK
t = (1, 2)
# t.append(3) # ERROR
```

### Q26. Structure and use of dictionaries with example.

Structure: `{key: value}`. Keys unique.

```python
student = {"name": "Asha", "roll": 5, "marks": 90}
print(student["name"])  # Asha
student["marks"] = 95
print(student)
```

Use: phone book, student record, word count.

### Q27. Functions and methods on dictionaries.

- `get(k)`, `keys()`, `values()`, `items()`, `update()`, `pop(k)`, `setdefault()`

```python
d = {"a": 1, "b": 2}
print(d.keys())    # dict_keys(['a','b'])
print(d.values())  # dict_values([1,2])
d.update({"c": 3})
print(d.pop("a"))  # 1
```

### Q28. Program to demonstrate list operations.

```python
l = [5, 2, 8, 1]
print("Original:", l)
l.append(9)
print("After append:", l)
l.remove(2)
print("After remove 2:", l)
l.sort()
print("After sort:", l)
l.insert(1, 100)
print("After insert:", l)
```

### Q29. Tuple + indexing/slicing.

```python
t = (10, 20, 30, 40, 50)
print(t[0])     # 10
print(t[-1])    # 50
print(t[1:4])   # (20, 30, 40)
print(t[::-1])  # reverse
print(len(t))   # 5
```

### Q30. Manipulation of dictionary — impacts.

- `update()`: adds/overwrites, size grows.
- `keys()`: live view.
- `pop()`: shrinks dict, returns value.
- `clear()`: empties dict.

### Q31. insert(), remove(), sort() effects.

- `insert(i,x)`: adds at position `i`, shifts right. Size +1.
- `remove(x)`: deletes first `x`, shifts left. Size −1.
- `sort()`: rearranges ascending, same size.

### Q32. list vs tuple vs dict.

- **list**: ordered, mutable, duplicates allowed. Use: dynamic collection.
- **tuple**: ordered, immutable, duplicates allowed. Use: fixed record.
- **dict**: key-value, keys unique. Use: lookup table.

### Q33. update(), keys(), values().

```python
d = {"x": 10, "y": 20}
print(list(d.keys()))    # ['x', 'y']
print(list(d.values()))  # [10, 20]
d.update({"z": 30})
print(d)  # {'x':10,'y':20,'z':30}
```

### Q34. Various operations on list.

`append, extend, insert, remove, pop, clear, index, count, sort, reverse, copy, len, max, min, sum, slicing, + and *`.

```python
a = [1, 2] + [3, 4]  # [1,2,3,4]
b = [1] * 3          # [1,1,1]
print(sum(a), max(a), min(a))
```

---

## Part F: 17/08/2026 — List/Tuple/Dict Programs

### Q35. Second maximum in a list.

```python
l = list(map(int, input("Enter nos: ").split()))
uniq = sorted(set(l))
if len(uniq) < 2:
    print("No second max")
else:
    print("Second max =", uniq[-2])
# Input: 5 2 8 8 1 -> Second max = 5
```

### Q36. Remove all occurrences of given element.

```python
l = [1, 2, 3, 2, 4, 2]
x = int(input("Remove: "))
l = [i for i in l if i != x]
print(l)
```

### Q37. Remove duplicates keeping order.

```python
l = [1, 2, 2, 3, 1, 4]
seen = set()
res = []
for i in l:
    if i not in seen:
        seen.add(i)
        res.append(i)
print(res)  # [1, 2, 3, 4]
```

### Q38. Tuple even/odd split.

```python
t = tuple(map(int, input("Enter tuple: ").split()))
even = tuple(x for x in t if x % 2 == 0)
odd = tuple(x for x in t if x % 2 != 0)
print("Original:", t)
print("Even:", even)
print("Odd:", odd)
```

### Q39. Dictionary key check till exit.

```python
d = {"a": 1, "b": 2}
while True:
    k = input("Enter key (exit to stop): ")
    if k == "exit":
        break
    if k in d:
        print("Value =", d[k])
    else:
        v = input("Not found. Enter value: ")
        d[k] = v
        print("Added:", d)
```

---

## Part G: 19/08/2026 — Mixed Programs

### Q40. Hollow rectangle.

```python
r = 4
c = 6
for i in range(r):
    for j in range(c):
        if i == 0 or i == r-1 or j == 0 or j == c-1:
            print("*", end="")
        else:
            print(" ", end="")
    print()
```

### Q41. Double space detection.

```python
s = input("Enter string: ")
pos = s.find("  ")
if pos != -1:
    print("Double space at index", pos)
else:
    print("No double space")
```

### Q42. 6 inputs, unique only.

```python
nums = []
for i in range(6):
    nums.append(int(input("Enter no: ")))
print("Unique:", list(set(nums)))
uniq = list(dict.fromkeys(nums))
print("Unique ordered:", uniq)
```

### Q43. Spam word finder.

```python
spam = ["win", "free", "money", "lottery"]
para = input("Enter para: ").lower()
found = [w for w in spam if w in para]
if found:
    print("Spam found:", found)
else:
    print("No spam")
```

### Q44. Sentence clean + analysis.

```python
s = input("Enter sentence: ")
for p in ":,!.?;":
    s = s.replace(p, "")
s = s.lower()
words = s.split()
print("Total words:", len(words))
if words:
    longest = max(words, key=len)
    print("Longest:", longest)
    c = sum(1 for w in words if "a" in w)
    print("Words with a:", c)
    print("Hyphen join:", "-".join(words))
```

---

## Part H: 26/08/2026 — Revision

Most repeat from Part A/B. Key additions:

- **Syntax rules**: indentation, colon, case-sensitive, quotes, `#` comments.
- **Dynamic typing**: `x=10` (int), then `x="hi"` (now str) — type changes at runtime.

### Nested loops.

```python
for i in range(1, 4):       # outer
    for j in range(1, 4):   # inner
        print(i, "*", j, "=", i*j)
```

Inner runs fully for each outer round. Use: tables, patterns, matrix.

---

## Part I: 31/08/2026 — Functions

```python
def fact(n):
    f = 1
    for i in range(1, n+1):
        f *= i
    return f
print(fact(5))  # 120
```

```python
def is_prime(n):
    if n < 2:
        return False
    for i in range(2, int(n**0.5)+1):
        if n % i == 0:
            return False
    return True
```

```python
def reverse_num(n):
    r = 0
    while n > 0:
        r = r*10 + n%10
        n //= 10
    return r
print(reverse_num(123))  # 321
```

```python
def is_pal(s):
    s = str(s).lower()
    return s == s[::-1]
print(is_pal("madam"))  # True
```

```python
def count_vowels(s):
    c = 0
    for ch in s.lower():
        if ch in "aeiou":
            c += 1
    return c
print(count_vowels("Hello"))  # 2
```

```python
def fib(n):
    a, b = 0, 1
    for _ in range(n):
        print(a, end=" ")
        a, b = b, a+b
fib(7)  # 0 1 1 2 3 5 8
```

---

> Tip: In exam write code with comments + sample output for full marks.
