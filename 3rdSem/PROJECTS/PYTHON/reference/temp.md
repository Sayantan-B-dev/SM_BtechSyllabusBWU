# 7. Core Logic

### Program 1 - Inventory Management System

```python
def receive_stock(pid, qty):
    if pid not in PRODUCTS: return False, "Product not found"
    if qty is None or qty <= 0: return False, "Qty must be >0"
    STOCK[pid] = STOCK.get(pid, 0) + qty
    return True, STOCK[pid]

def add_product(name, cat, price):
    if not name or not cat or price is None: return None
    pid = _next_pid()
    PRODUCTS[pid] = {"name": name, "category": cat, "price": float(price)}
    STOCK.setdefault(pid, 0)
    return pid

def check_low_stock(threshold=10):
    return [(pid, PRODUCTS[pid]["name"], STOCK.get(pid, 0))
            for pid in PRODUCTS if STOCK.get(pid, 0) < threshold]

def adjust_stock(pid, qty):
    if pid not in PRODUCTS: return False, "Not found"
    if qty is None or qty < 0: return False, "Qty >=0 required"
    STOCK[pid] = int(qty)
    return True, qty

def update_price(pid, price):
    if pid not in PRODUCTS or price is None: return False
    PRODUCTS[pid]["price"] = float(price)
    return True
```

### Program 2 - Online Shopping Cart

```python
def add_to_cart(pid, qty):
    if pid not in CATALOG: return False, "Not in catalog"
    if qty is None or qty <= 0: return False, "Qty must be >0"
    CART[pid] = CART.get(pid, 0) + int(qty)
    return True, f"{CATALOG[pid]['name']} x{qty} added"

def add_new_product(name, cat, price):
    if not name or not cat or price is None: return None
    pid = _next_id()
    CATALOG[pid] = {"name": name.strip(), "category": cat.strip(), "price": float(price)}
    return pid

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
```
