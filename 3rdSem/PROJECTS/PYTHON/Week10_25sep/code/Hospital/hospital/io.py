"""Input/Output helpers."""
def inp(p): return input(p).strip()
def int_inp(p):
    while True:
        try: return int(input(p))
        except ValueError: print("Enter a number.")
def show(msg): print(f"\n-- {msg} --")
def show_list(items, empty="None registered."):
    if not items:
        print(empty)
    else:
        for x in items:
            print(x)

BANNER = [
    "  _____  ",
    " |  +  | ",
    "-+ + + +-",
    " |  +  | ",
    "  -----  ",
    "",
    "H O S P I T A L  S Y S T E M",
]

def banner():
    print("=" * 46)
    for line in BANNER:
        print(line.center(46))
    print("=" * 46)
