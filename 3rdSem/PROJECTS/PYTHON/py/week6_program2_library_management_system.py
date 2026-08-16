# =====================================================
#  LIBRARY MANAGEMENT SYSTEM
#  Members + Books + Issue / Return
# =====================================================

import random
import sys


WIDTH = 100

BANNER = r"""
██╗     ██╗██████╗ ██████╗  █████╗ ██████╗ ██╗   ██╗
██║     ██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝
██║     ██║██████╔╝██████╔╝███████║██████╔╝ ╚████╔╝
██║     ██║██╔══██╗██╔══██╗██╔══██║██╔══██╗  ╚██╔╝
███████╗██║██████╔╝██║  ██║██║  ██║██║  ██║   ██║
╚══════╝╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝
███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗███╗   ███╗███████╗███╗   ██╗████████╗
████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝████╗ ████║██╔════╝████╗  ██║╚══██╔══╝
██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██╔████╔██║█████╗  ██╔██╗ ██║   ██║
██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║
██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██║ ╚═╝ ██║███████╗██║ ╚████║   ██║
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝
███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗
██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║
███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║
╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║
███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║
╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝
"""

# ---------- BOX DRAWING ----------
def box_top(w=WIDTH):
    return "╔" + "═" * (w - 2) + "╗"

def box_bottom(w=WIDTH):
    return "╚" + "═" * (w - 2) + "╝"

def box_divider(w=WIDTH):
    return "╠" + "═" * (w - 2) + "╣"

def box_line(text, w=WIDTH):
    pad = max(w - 4 - len(text), 0)
    return f"║ {text}{' ' * pad} ║"

def print_boxed(lines, w=WIDTH):
    print(box_top(w))
    for line in lines:
        print(box_line(line, w))
    print(box_bottom(w))

# ---------- DATA ----------
BOOKS = {}
MEMBERS = {}
ISSUED = {}

# ---------- ID GENERATION ----------
def generate_id(prefix):
    """Generate a unique ID like B1234, M5678, I9012."""
    while True:
        new_id = prefix + str(random.randint(1000, 9999))
        if new_id not in BOOKS and new_id not in MEMBERS and new_id not in ISSUED:
            return new_id

# ---------- MEMBER OPERATIONS ----------
def add_member():
    name = input("> Member name: ").strip()
    while name == "":
        name = input("> Name cannot be empty. Member name: ").strip()

    email = input("> Member email: ").strip()
    while "@" not in email:
        print_boxed(["Invalid email. Must contain '@'."])
        email = input("> Member email: ").strip()

    phone = input("> Member phone: ").strip()
    while not phone.isdigit() or len(phone) < 10:
        print_boxed(["Invalid phone. Must be at least 10 digits."])
        phone = input("> Member phone: ").strip()

    student_id = input("> Member student ID: ").strip()
    while student_id == "":
        student_id = input("> Student ID cannot be empty: ").strip()

    member_id = generate_id("M")
    MEMBERS[member_id] = {
        "name": name,
        "email": email,
        "phone": phone,
        "student_id": student_id,
    }
    print_boxed([f"Member added successfully!  ID: {member_id}"])

def update_member():
    member_id = input("> Enter member ID: ").strip().upper()
    if member_id not in MEMBERS:
        print_boxed(["Member not found."])
        return
    name = input("> Member name: ").strip()
    email = input("> Member email: ").strip()
    phone = input("> Member phone: ").strip()
    student_id = input("> Member student ID: ").strip()
    MEMBERS[member_id] = {
        "name": name,
        "email": email,
        "phone": phone,
        "student_id": student_id,
    }
    print_boxed([f"Member {member_id} updated successfully!"])

def delete_member():
    member_id = input("> Enter member ID: ").strip().upper()
    if member_id not in MEMBERS:
        print_boxed(["Member not found."])
        return
    # Cannot delete a member who still has books issued
    active = [i for i, rec in ISSUED.items() if rec["member"] == member_id]
    if active:
        print_boxed([f"Cannot delete. Member has {len(active)} book(s) still issued."])
        return
    name = MEMBERS[member_id]["name"]
    del MEMBERS[member_id]
    print_boxed([f"Member {name} ({member_id}) deleted successfully!"])

def see_all_members():
    if not MEMBERS:
        print_boxed(["No members in the system yet."])
        return
    lines = [f"  {'ID':<10}{'Name':<20}{'Email':<28}{'Phone':<14}{'Student ID':<12}",
             "-" * (WIDTH - 8)]
    for member_id, member in MEMBERS.items():
        lines.append(
            f"  {member_id:<10}{member['name']:<20}{member['email']:<28}{member['phone']:<14}{member['student_id']:<12}"
        )
    print_boxed(lines)

# ---------- BOOK OPERATIONS ----------
def add_book():
    title = input("> Book title: ").strip()
    while title == "":
        title = input("> Title cannot be empty. Book title: ").strip()
    author = input("> Book author: ").strip()
    while author == "":
        author = input("> Author cannot be empty. Book author: ").strip()

    book_id = generate_id("B")
    BOOKS[book_id] = {"title": title, "author": author}
    print_boxed([
        "BOOK ADDED:",
        "",
        f"  Book ID : {book_id}",
        f"  Title   : {title}",
        f"  Author  : {author}",
        f"  Status  : Available"
    ])

def search_book():
    term = input("> Search term (ID / title / author): ").strip().lower()
    if not term:
        print_boxed(["Search term cannot be empty."])
        return
    matches = [
        (book_id, book)
        for book_id, book in BOOKS.items()
        if term in book_id.lower() or term in book["title"].lower() or term in book["author"].lower()
    ]
    if not matches:
        print_boxed(["No books matched your search."])
        return
    lines = ["SEARCH RESULTS:", ""]
    for book_id, book in matches:
        status = "Issued" if book_id in [r["book_id"] for r in ISSUED.values()] else "Available"
        lines.append(f"  {book_id} | {book['title']} | {book['author']} | {status}")
    print_boxed(lines)

def see_all_books():
    if not BOOKS:
        print_boxed(["No books in the library yet."])
        return
    lines = [f"  {'ID':<12}{'Title':<30}{'Author':<22}{'Status':<10}{'Issued To':<12}",
             "-" * (WIDTH - 8)]
    issued_map = {r["book_id"]: r["member"] for r in ISSUED.values()}
    for book_id, book in BOOKS.items():
        if book_id in issued_map:
            status, issued_to = "Issued", issued_map[book_id]
        else:
            status, issued_to = "Available", ""
        lines.append(f"  {book_id:<12}{book['title']:<30}{book['author']:<22}{status:<10}{issued_to:<12}")
    print_boxed(lines)

# ---------- ISSUE / RETURN ----------
def issue_book():
    book_id = input("> Enter book ID: ").strip().upper()
    if book_id not in BOOKS:
        print_boxed(["Book not found."])
        return
    if any(r["book_id"] == book_id for r in ISSUED.values()):
        print_boxed(["ERROR: Book is already issued."])
        return

    member_id = input("> Enter member ID: ").strip().upper()
    if member_id not in MEMBERS:
        print_boxed(["Member not found."])
        return

    issue_id = generate_id("I")
    ISSUED[issue_id] = {"book_id": book_id, "member": member_id}
    print_boxed([
        "BOOK ISSUED:",
        "",
        f"  Issue ID  : {issue_id}",
        f"  Book ID   : {book_id}",
        f"  Title     : {BOOKS[book_id]['title']}",
        f"  Issued to : {member_id} ({MEMBERS[member_id]['name']})"
    ])

def return_book():
    issue_id = input("> Enter issue ID: ").strip().upper()
    if issue_id not in ISSUED:
        print_boxed(["Issue record not found."])
        return
    rec = ISSUED[issue_id]
    book_id = rec["book_id"]
    del ISSUED[issue_id]
    print_boxed([
        "BOOK RETURNED:",
        "",
        f"  Book ID : {book_id}",
        f"  Title   : {BOOKS[book_id]['title']}"
    ])

def see_issued_books():
    if not ISSUED:
        print_boxed(["No books are currently issued."])
        return
    lines = [f"  {'Issue ID':<10}{'Book ID':<10}{'Title':<30}{'Member':<12}", "-" * (WIDTH - 8)]
    for issue_id, rec in ISSUED.items():
        title = BOOKS.get(rec["book_id"], {}).get("title", "?")
        lines.append(f"  {issue_id:<10}{rec['book_id']:<10}{title:<30}{rec['member']:<12}")
    print_boxed(lines)

# ---------- MENU ----------
def main():
    print(BANNER)
    print("      Library Management System".center(WIDTH))
    print()

    while True:
        print_boxed([
            "  --- MEMBERS ---",
            "  [1] Add a member",
            "  [2] Update a member",
            "  [3] Delete a member",
            "  [4] See all members",
            "  --- BOOKS ---",
            "  [5] Add a book",
            "  [6] Search a book",
            "  [7] See all books",
            "  [8] Issue a book",
            "  [9] Return a book",
            "  [10] See issued books",
            "  [0] Exit"
        ])
        choice = input("> Enter option: ").strip()

        if choice == "1":
            print(); add_member(); print()
        elif choice == "2":
            print(); update_member(); print()
        elif choice == "3":
            print(); delete_member(); print()
        elif choice == "4":
            print(); see_all_members(); print()
        elif choice == "5":
            print(); add_book(); print()
        elif choice == "6":
            print(); search_book(); print()
        elif choice == "7":
            print(); see_all_books(); print()
        elif choice == "8":
            print(); issue_book(); print()
        elif choice == "9":
            print(); return_book(); print()
        elif choice == "10":
            print(); see_issued_books(); print()
        elif choice == "0":
            print(); print_boxed(["Goodbye!"]); print()
            break
        else:
            print_boxed(["Invalid option, try again."])
            print()

if __name__ == "__main__":
    main()