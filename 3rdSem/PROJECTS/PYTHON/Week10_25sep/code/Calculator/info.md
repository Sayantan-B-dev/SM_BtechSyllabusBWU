# Scientific Calculator

Simplified modular menu-driven calculator. 3 modules.

```
.
├── main.py
└── calculator/
    ├── __init__.py
    ├── scientific_calculator.py
    └── io.py
```

Run:
```bash
python main.py
```

Run both projects with one command (from the folder containing Calculator and Hospital):
```bash
run.bat
```

Startup shows an ASCII art banner (see `banner()` in `calculator/io.py`).

## `calculator/__init__.py`
```python
# Calculator package
from .scientific_calculator import *
from .io import *
```

## `calculator/scientific_calculator.py`
```python
"""Core math logic: 2-number ops + 1-number ops."""
import math

# --- basic (a, b) ---
def add(a, b): return a + b
def subtract(a, b): return a - b
def multiply(a, b): return a * b
def division(a, b): return "Error: /0" if b == 0 else a / b
def floor_division(a, b): return "Error: /0" if b == 0 else a // b
def power(a, b): return a ** b
def mod(a, b): return "Error: %0" if b == 0 else a % b

# --- scientific (a) ---
def sin(a): return math.sin(math.radians(a))
def cos(a): return math.cos(math.radians(a))
def tan(a): return math.tan(math.radians(a))
def log(a, base=10):
    if a <= 0: return "Error: log(a<=0)"
    if base <= 0 or base == 1: return "Error: bad base"
    return math.log(a, base)
def ln(a): return "Error: ln(a<=0)" if a <= 0 else math.log(a)
def sqrt(a): return "Error: sqrt(-ve)" if a < 0 else math.sqrt(a)
```

## `calculator/io.py`
```python
"""Input/Output helpers."""
def get2():
    return float(input("First: ")), float(input("Second: "))

def get1():
    return float(input("Number: "))

def show(res, name):
    print(f"\n--- {name} = {res} ---")

BANNER = [
    " ____    _    _      ____ ",
    "/ ___|  / \\  | |    / ___|",
    "| |    / _ \\ | |   | |    ",
    "| |___/ ___ \\| |___| |___ ",
    "\\____/_/   \\_\\_____\\____|",
    "",
    "S C I E N T I F I C  C A L C U L A T O R",
]

def banner():
    print("=" * 46)
    for line in BANNER:
        print(line.center(46))
    print("=" * 46)
```

## `main.py`
```python
"""Scientific Calculator - menu driven (simplified)."""
import calculator.scientific_calculator as c
from calculator.io import get1, get2, show, banner

# (menu_no: label, func, needs_2_inputs)
MENU = {
    1: ("Add", c.add, 2), 2: ("Subtract", c.subtract, 2),
    3: ("Multiply", c.multiply, 2), 4: ("Divide", c.division, 2),
    5: ("Floor Div", c.floor_division, 2), 6: ("Power", c.power, 2),
    7: ("Mod", c.mod, 2), 8: ("Sin", c.sin, 1),
    9: ("Cos", c.cos, 1), 10: ("Tan", c.tan, 1),
    11: ("Log", c.log, 1), 12: ("Ln", c.ln, 1), 13: ("Sqrt", c.sqrt, 1),
}

def main():
    banner()
    while True:
        print("\n--- CALCULATOR ---")
        for k, (name, _, _) in MENU.items():
            print(f"{k}. {name}")
        print("0. Exit")
        try:
            ch = int(input("Choice: "))
        except ValueError:
            print("Enter a number."); continue
        if ch == 0:
            print("Bye!"); break
        if ch not in MENU:
            print("Invalid choice."); continue
        name, fn, n = MENU[ch]
        try:
            if n == 2:
                a, b = get2()
                show(fn(a, b), name)
            elif ch == 11:  # log with optional base
                a = get1()
                b = input("Base [10]: ") or 10
                show(fn(a, float(b)), name)
            else:
                show(fn(get1()), name)
        except ValueError:
            print("Invalid number.")

if __name__ == "__main__":
    main()
```

Menu: `1 Add, 2 Subtract, 3 Multiply, 4 Divide, 5 Floor Div, 6 Power, 7 Mod, 8 Sin, 9 Cos, 10 Tan, 11 Log, 12 Ln, 13 Sqrt, 0 Exit`.
