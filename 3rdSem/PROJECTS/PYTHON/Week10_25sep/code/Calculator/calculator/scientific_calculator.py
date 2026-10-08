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
