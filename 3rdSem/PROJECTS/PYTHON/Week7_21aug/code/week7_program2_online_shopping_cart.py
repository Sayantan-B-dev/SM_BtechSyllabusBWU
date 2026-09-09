BANNER = r"""
  ██████╗ ███╗   ██╗██╗     ██╗███╗   ██╗███████╗
 ██╔═══██╗████╗  ██║██║     ██║████╗  ██║██╔════╝
 ██║   ██║██╔██╗ ██║██║     ██║██╔██╗ ██║█████╗
 ██║   ██║██║╚██╗██║██║     ██║██║╚██╗██║██╔══╝
 ╚██████╔╝██║ ╚████║███████╗██║██║ ╚████║███████╗
  ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝
   ███████╗██╗  ██╗ ██████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗
   ██╔════╝██║  ██║██╔═══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝
   ███████╗███████║██║   ██║██████╔╝██████╔╝██║██╔██╗ ██║██║  ███╗
   ╚════██║██╔══██║██║   ██║██╔═══╝ ██╔═══╝ ██║██║╚██╗██║██║   ██║
   ███████║██║  ██║╚██████╔╝██║     ██║     ██║██║ ╚████║╚██████╔╝
   ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝
        ONLINE SHOPPING CART
"""
# Online Shopping Cart - Catalog + Cart
CATALOG = {}  # id -> {name, category, price}
CART = {}     # id -> qty
CART_PRODUCTS = CATALOG  # alias for old imports

def _next_id(): return max(CATALOG, default=0) + 1

def _int(prompt, allow_zero=True):
    try:
        v = int(input(prompt).strip())
        if v < 0 or (not allow_zero and v == 0): return None
        return v
    except: return None

def _float(prompt):
    try:
        v = float(input(prompt).strip())
        return None if v < 0 else v
    except: return None

def _str(prompt):
    s = input(prompt).strip()
    return s if s else None

def sep(c="-"): print(c*50)

# ---- why UI layer? ----
# Core functions (add_new_product, add_to_cart, etc.) handle ONLY data logic
# and return values. UI handlers (handle_*) handle ONLY input()/print().
# Helpers _get_catalog_pid(), _get_cart_pid(), _prompt_new_product() avoid
# repeating "enter ID -> validate -> error" in 6 places. Good names like
# handle_add_to_cart / handle_show_cart make menu mapping obvious.

def _get_catalog_pid(msg="Product ID: "):
    """Helper: prompt for catalog ID and validate."""
    pid = _int(msg)
    if pid not in CATALOG:
        print("Invalid / Not in catalog.")
        return None
    return pid

def _get_cart_pid(msg="Product ID in cart: "):
    """Helper: prompt for cart ID and validate."""
    pid = _int(msg)
    if pid not in CART:
        print("Not in cart.")
        return None
    return pid

def _prompt_new_product():
    """Helper: prompt for name/category/price. Returns tuple or None."""
    n = _str("Product Name: "); c = _str("Category: "); p = _float("Price: ")
    if not n or not c or p is None:
        print("Invalid product details.")
        return None
    return n, c, p

# ---- core (business logic, no I/O) ----
def add_new_product(name, cat, price):
    if not name or not cat or price is None: return None
    pid = _next_id()
    CATALOG[pid] = {"name": name.strip(), "category": cat.strip(), "price": float(price)}
    return pid

def add_to_cart(pid, qty):
    if pid not in CATALOG: return False, "Not in catalog"
    if qty is None or qty <= 0: return False, "Qty must be >0"
    CART[pid] = CART.get(pid, 0) + int(qty)
    return True, f"{CATALOG[pid]['name']} x{qty} added"

def get_cart_items():
    items = []; total = 0
    for pid, qty in CART.items():
        if pid not in CATALOG: continue
        unit = CATALOG[pid]["price"]; line = qty * unit; total += line
        items.append((pid, CATALOG[pid]["name"], qty, unit, line))
    return items, total

def update_cart_item(pid, qty):
    if pid not in CART: return False, "Not in cart"
    if qty is None or qty < 0: return False, "Qty >=0 required"
    if qty == 0: del CART[pid]; return True, "Removed (qty 0)"
    CART[pid] = int(qty); return True, "Updated"

def remove_from_cart(pid):
    if pid not in CART: return False, "Not in cart"
    del CART[pid]; return True, "Removed"

def clear_cart(): CART.clear(); return True

# ---- UI handlers (well-named, each does one user action) ----
def handle_add_new_product_to_cart():
    """UI: create new catalog product and add to cart."""
    details = _prompt_new_product()
    if not details: return
    n, c, p = details
    pid = add_new_product(n, c, p)
    print(f"Catalog ID {pid} | {n} ${p:.2f}")
    q = _int("Qty to add to cart: ", False)
    if q is None:
        print(f"Added to catalog only. Use ID {pid} later.")
        return
    ok, m = add_to_cart(pid, q)
    print(m if ok else f"Error: {m}")

def handle_add_existing_to_cart():
    """UI: show catalog and add existing product to cart."""
    if not CATALOG: print("Catalog empty. Add new first."); return
    for pid, pr in sorted(CATALOG.items()):
        print(f" ID {pid} | {pr['name']} ({pr['category']}) ${pr['price']:.2f}")
    pid = _get_catalog_pid()
    if pid is None: return
    q = _int("Quantity: ", False)
    ok, m = add_to_cart(pid, q)
    print(m if ok else f"Error: {m}")

def handle_show_cart():
    """UI: display cart with line totals and grand total."""
    items, total = get_cart_items()
    if not items: print("Cart empty."); return
    print(f"{'ID':<4} {'Name':<14} {'Qty':<4} {'Unit':<8} {'Total'}"); sep()
    for pid, n, qty, unit, line in items:
        print(f"{pid:<4} {n:<14} {qty:<4} ${unit:<7.2f} ${line:.2f}")
    sep(); print(f"TOTAL: ${total:.2f} ({len(items)} items)")

def handle_show_catalog():
    """UI: display catalog with cart quantity hint."""
    if not CATALOG: print("Catalog empty."); return
    print(f"{'ID':<4} {'Name':<14} {'Category':<12} {'Price'}"); sep()
    for pid, pr in sorted(CATALOG.items()):
        tag = f" (in cart {CART[pid]})" if pid in CART else ""
        print(f"{pid:<4} {pr['name']:<14} {pr['category']:<12} ${pr['price']:.2f}{tag}")

def handle_edit_cart_item():
    """UI: show cart, prompt for ID + new qty, update cart."""
    if not CART: print("Cart empty."); return
    handle_show_cart()
    pid = _get_cart_pid()
    if pid is None: return
    q = _int(f"Current {CART[pid]} -> New Qty (0=remove): ")
    ok, m = update_cart_item(pid, q)
    print(m if ok else f"Error: {m}")

def handle_remove_from_cart():
    """UI: prompt for ID and remove from cart."""
    if not CART: print("Cart empty."); return
    pid = _get_cart_pid()
    if pid is None: return
    ok, m = remove_from_cart(pid)
    print(m if ok else f"Error: {m}")

def main():
    print(BANNER)
    while True:
        sep("="); print("ONLINE SHOPPING CART"); sep("=")
        print("1.Add to Cart  2.View Cart  3.Edit Cart  4.Remove Item")
        print("5.Clear Cart   6.View Catalog  7.Exit")
        sep("-")
        ch = input("Choice: ").strip()
        sep("-")
        if ch == "1":
            c = input("Add NEW product? (y/n): ").strip().lower()
            handle_add_new_product_to_cart() if c == "y" else handle_add_existing_to_cart()
        elif ch == "2": handle_show_cart()
        elif ch == "3": handle_edit_cart_item()
        elif ch == "4": handle_remove_from_cart()
        elif ch == "5": print("Cleared." if clear_cart() else "")
        elif ch == "6": handle_show_catalog()
        elif ch == "7": print("Goodbye!"); break
        else: print("Invalid choice.")

if __name__ == "__main__": main()
