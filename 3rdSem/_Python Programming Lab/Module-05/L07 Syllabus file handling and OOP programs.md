# Syllabus File Handling and OOP Programs

**Course:** Python Programming Lab  
**Module:** 5 | **Lecture:** 7  
**Date:** 25-Sep-2026  
**Faculty:** PRANAB GHARAI  
**CO:** CO 5  
**Learning Methodology:** Simulation  
**Reference:** Lab Manual

## Lab Objectives

- Square root via math module; search a value by index with exception handling.
- Compute harmonic series 1 + 1/2 + ... + 1/n.
- Open, read/write, and copy text files (with try/except/finally).
- Inheritance: CSEStudent extends Student with graduation year + overridden print_info.
- Polymorphism: register() accepts Student or CSEStudent objects.

## Theory

`math.sqrt` raises `ValueError` on negatives — caught per syllabus exception-handling theme. Index search catches `ValueError` (missing) and `IndexError`. File copy reads source and writes destination inside `with` blocks (auto-close) wrapped in `try/except OSError`, plus a `finally` demo. Inheritance uses `super().__init__`; overriding `print_info` in the child demonstrates method overriding; a shared `register(obj)` function calling `obj.print_info()` demonstrates duck-typed polymorphism.

## Procedure

1. Create a new Python file named lab31.py.
2. Implement sqrt demo, index search, harmonic series with math/exception handling.
3. Implement open/read-write/copy on `source.txt` -> `backup.txt`.
4. Implement Student/CSEStudent classes with overridden print_info and register().

## Source Code

```python
# Module 05 Lab 07: Syllabus file handling and OOP programs
import math

# Program 1: square root using math (with exception handling)
def demo_sqrt(x):
    try:
        print(f"sqrt({x}) = {math.sqrt(x):.4f}")
    except ValueError as e:
        print(f"sqrt({x}) error: {e}")

demo_sqrt(25)
demo_sqrt(-4)

# Program 2: search a value by index
def search_by_index(lst, idx):
    try:
        return lst[idx]
    except IndexError:
        return f"Index {idx} out of range."
    except TypeError:
        return "Index must be an integer."

print(search_by_index([10, 20, 30], 1))  # 20
print(search_by_index([10, 20, 30], 5))  # out of range

# Program 3: harmonic series 1 + 1/2 + ... + 1/n
def harmonic(n):
    return sum(1 / i for i in range(1, n + 1))

print(f"1 + 1/2 + 1/3 + 1/4 = {harmonic(4):.4f}")  # 2.0833

# Programs 4-6: open, read-write, copy (with try/except/finally)
with open("source.txt", "w") as f:
    f.write("Hello CSE\nLab file handling demo.\n")

try:
    with open("source.txt", "r") as f:
        content = f.read()
    print("source.txt content:")
    print(content)
    with open("backup.txt", "w") as f:
        f.write(content)
    print("Copied source.txt -> backup.txt")
except OSError as e:
    print(f"File error: {e}")
finally:
    print("File operations attempted (finally block).")

# Program 7: inheritance + polymorphism
class Student:
    def __init__(self, name, roll):
        self.name = name
        self.roll = roll

    def print_info(self):
        print(f"Student: {self.name}, Roll: {self.roll}")


class CSEStudent(Student):
    def __init__(self, name, roll, graduation_year):
        super().__init__(name, roll)
        self.graduation_year = graduation_year

    def print_info(self):  # override
        print(f"CSE Student: {self.name}, Roll: {self.roll}, "
              f"Graduation: {self.graduation_year}")


def register(obj):
    """Polymorphic: works with Student or CSEStudent."""
    obj.print_info()


register(Student("Asha", 101))
register(CSEStudent("Ravi", 102, 2027))
```

## Output

```
sqrt(25) = 5.0000
sqrt(-4) error: math domain error
20
Index 5 out of range.
1 + 1/2 + 1/3 + 1/4 = 2.0833
source.txt content:
Hello CSE
Lab file handling demo.

Copied source.txt -> backup.txt
File operations attempted (finally block).
Student: Asha, Roll: 101
CSE Student: Ravi, Roll: 102, Graduation: 2027
```

## Conclusion

Modules (math), exception handling (try/except/finally), file open/read-write/copy, inheritance with override, and polymorphic register() all verified.
