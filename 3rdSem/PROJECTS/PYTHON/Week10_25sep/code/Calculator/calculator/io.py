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
