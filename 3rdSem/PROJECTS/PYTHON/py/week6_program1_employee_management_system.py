# =====================================================
#  EMPLOYEE MANAGEMENT SYSTEM
# =====================================================

import random
import sys



WIDTH = 100

BANNER = r"""
███████╗███╗   ███╗██████╗ ██╗      ██████╗ ██╗   ██╗███████╗███████╗
██╔════╝████╗ ████║██╔══██╗██║     ██╔═══██╗╚██╗ ██╔╝██╔════╝██╔════╝
█████╗  ████╗ ████║██████╔╝██║     ██║   ██║ ╚████╔╝ █████╗  █████╗
██╔══╝  ██╔████╔██║██╔═══╝ ██║     ██║   ██║  ╚██╔╝  ██╔══╝  ██╔══╝
███████╗██║╚██╔╝██║██║     ███████╗╚██████╔╝   ██║   ███████╗███████╗
╚══════╝╚═╝ ╚═╝ ╚═╝╚═╝     ╚══════╝ ╚═════╝    ╚═╝   ╚══════╝╚══════╝
"""

# ---------- DATA ----------
EMPLOYEES = {}
DEPARTMENTS = ['HR', 'IT', 'SALES', 'MARKETING']

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

# ---------- HELPERS ----------
def generate_id():
    """Generate a unique 4-digit employee ID, e.g. E1234."""
    while True:
        emp_id = "E" + str(random.randint(1000, 9999))
        if emp_id not in EMPLOYEES:
            return emp_id

def valid_department(dept):
    return dept.strip().upper() in DEPARTMENTS

def get_employee_details():
    """Prompt for name, department and salary with validation."""
    name = input("> Employee name: ").strip()
    while name == "":
        name = input("> Name cannot be empty. Employee name: ").strip()

    department = input(f"> Department {DEPARTMENTS}: ").strip().upper()
    while department not in DEPARTMENTS:
        print_boxed([f"Invalid department. Choose from: {', '.join(DEPARTMENTS)}"])
        department = input(f"> Department {DEPARTMENTS}: ").strip().upper()

    salary = input("> Salary (₹): ").strip()
    while not salary.isdigit():
        print_boxed(["Invalid salary. Please enter a number."])
        salary = input("> Salary (₹): ").strip()

    return name, department, int(salary)

# ---------- CRUD OPERATIONS ----------
def add_employee():
    emp_id = generate_id()
    name, department, salary = get_employee_details()
    EMPLOYEES[emp_id] = {'name': name, 'department': department, 'salary': salary}
    print_boxed([f"Employee added successfully!  ID: {emp_id}"])

def update_employee(emp_id):
    if emp_id not in EMPLOYEES:
        print_boxed(["Employee not found."])
        return
    name, department, salary = get_employee_details()
    EMPLOYEES[emp_id] = {'name': name, 'department': department, 'salary': salary}
    print_boxed([f"Employee {emp_id} updated successfully!"])

def delete_employee(emp_id):
    if emp_id not in EMPLOYEES:
        print_boxed(["Employee not found."])
        return
    name = EMPLOYEES[emp_id]['name']
    del EMPLOYEES[emp_id]
    print_boxed([f"Employee {name} ({emp_id}) deleted successfully!"])

def search_employee(emp_id):
    if emp_id not in EMPLOYEES:
        print_boxed(["Employee not found."])
        return
    emp = EMPLOYEES[emp_id]
    print_boxed([
        f"Employee ID : {emp_id}",
        f"Name        : {emp['name']}",
        f"Department  : {emp['department']}",
        f"Salary      : ₹{emp['salary']:,}"
    ])

def see_all_employees():
    if not EMPLOYEES:
        print_boxed(["No employees in the system yet."])
        return
    rows = ["  ID     |  Name                  |  Department  |  Salary"]
    rows.append("  " + "-" * 72)
    for emp_id, emp in EMPLOYEES.items():
        rows.append(
            f"  {emp_id:<7}|  {emp['name']:<20} |  {emp['department']:<10} |  ₹{emp['salary']:,}"
        )
    print_boxed(rows)

# ---------- MENU ----------
def main():
    print(BANNER)
    print("      Employee Management System".center(WIDTH))
    print()

    while True:
        print_boxed([
            "  [1] Add a new employee",
            "  [2] Update an employee",
            "  [3] Delete an employee",
            "  [4] Search an employee",
            "  [5] See all employees",
            "  [6] Exit"
        ])
        choice = input("> Enter option: ").strip()

        if choice == "1":
            print()
            add_employee()
            print()
        elif choice == "2":
            emp_id = input("> Enter employee ID to update: ").strip().upper()
            print()
            update_employee(emp_id)
            print()
        elif choice == "3":
            emp_id = input("> Enter employee ID to delete: ").strip().upper()
            print()
            delete_employee(emp_id)
            print()
        elif choice == "4":
            emp_id = input("> Enter employee ID to search: ").strip().upper()
            print()
            search_employee(emp_id)
            print()
        elif choice == "5":
            print()
            see_all_employees()
            print()
        elif choice == "6":
            print()
            print_boxed(["Goodbye!"])
            print()
            break
        else:
            print_boxed(["Invalid option, try again."])
            print()

if __name__ == "__main__":
    main()