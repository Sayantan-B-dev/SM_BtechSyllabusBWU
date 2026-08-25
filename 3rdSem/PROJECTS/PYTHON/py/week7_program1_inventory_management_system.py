BANNER = r"""
 ██╗███╗   ██╗██╗   ██╗███████╗███╗   ██╗████████╗ ██████╗ ██████╗ ██╗   ██╗
 ██║████╗  ██║██║   ██║██╔════╝████╗  ██║╚══██╔══╝██╔═══██╗██╔══██╗╚██╗ ██╔╝
 ██║██╔██╗ ██║██║   ██║█████╗  ██╔██╗ ██║   ██║   ██║   ██║██████╔╝ ╚████╔╝
 ██║██║╚██╗██║╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║   ██║   ██║██╔══██╗  ╚██╔╝
 ██║██║ ╚████║ ╚████╔╝ ███████╗██║ ╚████║   ██║   ╚██████╔╝██║  ██║   ██║
 ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝
        INVENTORY MANAGEMENT SYSTEM
"""
# Inventory Management System - CRUD with Stock & Suppliers
PRODUCTS = {}   # id -> {name, category, price}
SUPPLIERS = {}  # id -> {name, address}
STOCK = {}      # product_id -> qty
LOW_STOCK = 10

def _next_pid(): return max(PRODUCTS, default=0) + 1
def _next_sid(): return max(SUPPLIERS, default=0) + 1

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
# Core functions (add_product, receive_stock, etc.) contain ONLY business logic
# and take explicit arguments / return values. UI functions (handle_*) contain
# ONLY input()/print() and call core functions. This separation makes core
# logic testable without user interaction and avoids repeating validation.
# Helpers _get_pid() and _prompt_product_details() remove duplicated
# "enter ID -> validate -> error" code from 7 places.

def _get_valid_pid(msg="Enter Product ID: "):
    """Helper: prompt for product ID and validate existence. Returns pid or None."""
    pid = _int(msg)
    if pid not in PRODUCTS:
        print("Invalid / Not found.")
        return None
    return pid

def _prompt_product_details():
    """Helper: prompt for name/category/price together. Returns tuple or None."""
    n = _str("Enter Product Name: ")
    c = _str("Enter Product Category: ")
    p = _float("Enter Product Price: ")
    if not n or not c or p is None:
        print("Invalid product details.")
        return None
    return n, c, p

# ---- core (business logic, no I/O) ----
def add_product(name, cat, price):
    if not name or not cat or price is None: return None
    pid = _next_pid()
    PRODUCTS[pid] = {"name": name, "category": cat, "price": float(price)}
    STOCK.setdefault(pid, 0)
    return pid

def receive_stock(pid, qty):
    if pid not in PRODUCTS: return False, "Product not found"
    if qty is None or qty <= 0: return False, "Qty must be >0"
    STOCK[pid] = STOCK.get(pid, 0) + qty
    return True, STOCK[pid]

def add_supplier(name, addr):
    if not name or not addr: return None
    sid = _next_sid()
    SUPPLIERS[sid] = {"name": name, "address": addr}
    return sid

def update_product(pid, name, cat, price):
    if pid not in PRODUCTS or not name or not cat or price is None: return False
    PRODUCTS[pid] = {"name": name, "category": cat, "price": float(price)}
    return True

def adjust_stock(pid, qty):
    if pid not in PRODUCTS: return False, "Not found"
    if qty is None or qty < 0: return False, "Qty >=0 required"
    STOCK[pid] = int(qty)
    return True, qty

def update_price(pid, price):
    if pid not in PRODUCTS or price is None: return False
    PRODUCTS[pid]["price"] = float(price)
    return True

def remove_product(pid):
    if pid not in PRODUCTS: return False
    del PRODUCTS[pid]; STOCK.pop(pid, None)
    return True

def delete_supplier(sid):
    if sid not in SUPPLIERS: return False
    del SUPPLIERS[sid]; return True

# ---- UI handlers (I/O only, each name describes user action) ----
def handle_create_product():
    """UI: prompt for product details and create product."""
    details = _prompt_product_details()
    if not details: return
    n, c, p = details
    pid = add_product(n, c, p)
    print(f"Added {n} (ID {pid}) ${p:.2f}")

def handle_increase_stock():
    """UI: prompt for product ID + quantity and increase stock."""
    pid = _get_valid_pid()
    if pid is None: return
    q = _int("Enter Quantity: ", False)
    ok, r = receive_stock(pid, q)
    print(f"Stock -> {r} units" if ok else f"Error: {r}")

def handle_create_supplier():
    """UI: prompt for supplier details and create supplier."""
    n = _str("Enter Supplier Name: "); a = _str("Enter Supplier Address: ")
    if not n or not a: print("Invalid input."); return
    sid = add_supplier(n, a)
    print(f"Supplier {n} (ID {sid}) added")

def handle_show_product():
    """UI: prompt for ID and display single product."""
    pid = _get_valid_pid()
    if pid is None: return
    p = PRODUCTS[pid]
    print(f"ID {pid}: {p['name']} | {p['category']} | ${p['price']:.2f} | Stock {STOCK.get(pid,0)}")

def handle_show_all_products():
    """UI: display all products in tabular form."""
    if not PRODUCTS: print("No products."); return
    print(f"{'ID':<4} {'Name':<16} {'Category':<12} {'Price':<10} {'Qty'}"); sep()
    for pid in sorted(PRODUCTS):
        p = PRODUCTS[pid]
        print(f"{pid:<4} {p['name']:<16} {p['category']:<12} ${p['price']:<9.2f} {STOCK.get(pid,0)}")

def handle_show_low_stock():
    """UI: display products below LOW_STOCK threshold."""
    low = [(pid, PRODUCTS[pid]["name"], STOCK.get(pid,0)) for pid in PRODUCTS if STOCK.get(pid,0) < LOW_STOCK]
    if not low: print(f"All stocks >= {LOW_STOCK}"); return
    print(f"Low stock (<{LOW_STOCK}):")
    for pid, n, q in low: print(f" ID {pid} | {n} -> {q}")

def handle_edit_product():
    """UI: prompt for ID + new details and update product."""
    pid = _get_valid_pid()
    if pid is None: return
    details = _prompt_product_details()
    if not details: return
    n, c, p = details
    print("Updated." if update_product(pid, n, c, p) else "Failed.")

def handle_set_stock():
    """UI: prompt for ID + new quantity and set stock directly."""
    pid = _get_valid_pid()
    if pid is None: return
    q = _int(f"Current {STOCK.get(pid,0)} -> New Qty: ")
    ok, r = adjust_stock(pid, q)
    print(f"Stock set to {r}" if ok else f"Error: {r}")

def handle_edit_price():
    """UI: prompt for ID + new price and update price."""
    pid = _get_valid_pid()
    if pid is None: return
    p = _float(f"Current ${PRODUCTS[pid]['price']:.2f} -> New Price: ")
    print("Price updated." if update_price(pid, p) else "Invalid price.")

def handle_delete_product():
    """UI: prompt for ID and delete product."""
    pid = _get_valid_pid("Enter Product ID to remove: ")
    print("Removed." if pid and remove_product(pid) else "Not found.")

def handle_delete_supplier():
    """UI: list suppliers, prompt for ID and delete supplier."""
    if not SUPPLIERS: print("No suppliers."); return
    for sid, s in SUPPLIERS.items(): print(f" ID {sid} | {s['name']} | {s['address']}")
    sid = _int("Enter Supplier ID to delete: ")
    print("Deleted." if delete_supplier(sid) else "Not found.")

def main():
    print(BANNER)
    while True:
        sep("="); print("INVENTORY MANAGEMENT SYSTEM"); sep("=")
        print("1.Add Product  2.Receive Stock  3.Add Supplier  4.Show Product")
        print("5.List All     6.Low Stock      7.Edit Product  8.Set Stock")
        print("9.Edit Price  10.Delete Product 11.Delete Supplier 12.Exit")
        sep("-")
        ch = input("Choice: ").strip()
        sep("-")
        if ch == "1": handle_create_product()
        elif ch == "2": handle_increase_stock()
        elif ch == "3": handle_create_supplier()
        elif ch == "4": handle_show_product()
        elif ch == "5": handle_show_all_products()
        elif ch == "6": handle_show_low_stock()
        elif ch == "7": handle_edit_product()
        elif ch == "8": handle_set_stock()
        elif ch == "9": handle_edit_price()
        elif ch == "10": handle_delete_product()
        elif ch == "11": handle_delete_supplier()
        elif ch == "12": print("Goodbye!"); break
        else: print("Invalid choice.")

if __name__ == "__main__": main()
