
import random
EMPLOYEES={}
DEPARTMENET=['HR','IT','SALES','MARKETING']

def generate_id():
  return "E"+str(random.randint(1000,9999))

def add_employee():
  id=generate_id()
  name=input("Enter employee name: ")
  department=input("Enter employee department: ")
  salary=input("Enter employee salary: ")
  EMPLOYEES[id]=[("name",name),("department",department),("salary",salary)]
  print("Employee added successfully")

def update_employee(emp_id):
  for id,employee in EMPLOYEES.items():
    if id==emp_id:
      name=input("Enter employee name: ")
      department=input("Enter employee department: ")
      salary=input("Enter employee salary: ")
      EMPLOYEES[id]=[("name",name),("department",department),("salary",salary)]
      print("Employee updated successfully")
      break
  else:
    print("Employee not found")

def delete_employee(emp_id):
  for id,employee in EMPLOYEES.items():
    if id==emp_id:
      del EMPLOYEES[id]
      print("Employee deleted successfully")
      break
  else:
    print("Employee not found")

def search_employee(emp_id):
  for id,employee in EMPLOYEES.items():
    if id==emp_id:
      print(employee)
      break
  else:
    print("Employee not found")

def see_all_employees():
  for id,employee in EMPLOYEES.items():
    print(str(id)+" : "+str(employee))

def separator():
  print("***********************************")

def main():
  while True:
    separator()
    print("Employee Record Management System")
    print("1. Add a new employee")
    print("2. Update an employee")
    print("3. Remove an employee")
    print("4. Search an employee")
    print("5. See all employees")
    print("6. Exit")
    choice = int(input("Enter your choice: "))
    separator()

    if choice == 1:
      add_employee()
      separator()
    elif choice == 2:
      emp_id = input("Enter employee ID: ")
      update_employee()
      separator()
    elif choice == 3:
      emp_id = input("Enter employee ID: ")
      delete_employee()
      separator()
    elif choice == 4:
      emp_id = input("Enter employee ID: ")
      search_employee()
      separator()
    elif choice == 5:
      see_all_employees()
      separator()
    elif choice == 6:
      break
    else:
      print("Invalid choice")

main()
