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
