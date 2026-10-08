# Hospital Appointment System

Simplified modular menu-driven system. 6 modules.

```
.
├── main.py
└── hospital/
    ├── __init__.py
    ├── doctor.py
    ├── patient.py
    ├── appointment.py
    ├── data.py
    └── io.py
```

Run:
```bash
python main.py
```

Run both projects with one command (from the folder containing Calculator and Hospital):
```bash
run.bat
```

Startup shows an ASCII art banner (see `banner()` in `hospital/io.py`).

Flow: Main menu `1 Doctors / 2 Patients / 3 Appointments / 0 Exit` → sub-menu `1 Add / 2 View / 9 Back`. Appointment needs existing Patient ID + Doctor ID.

## `hospital/__init__.py`
```python
from .doctor import Doctor
from .patient import Patient
from .appointment import Appointment
from . import data, io
```

## `hospital/doctor.py`
```python
"""Doctor model."""
class Doctor:
    def __init__(self, did, name, specialty):
        self.id, self.name, self.specialty = did, name, specialty
    def __str__(self):
        return f"[{self.id}] {self.name} ({self.specialty})"
```

## `hospital/patient.py`
```python
"""Patient model."""
class Patient:
    def __init__(self, pid, name, age, condition):
        self.id, self.name, self.age, self.condition = pid, name, age, condition
    def __str__(self):
        return f"[{self.id}] {self.name}, {self.age}yrs - {self.condition}"
```

## `hospital/appointment.py`
```python
"""Appointment model."""
class Appointment:
    def __init__(self, aid, pid, did, date, time):
        self.id, self.pid, self.did, self.date, self.time = aid, pid, did, date, time
    def __str__(self):
        return f"[{self.id}] P{self.pid} + D{self.did} @ {self.date} {self.time}"
```

## `hospital/data.py`
```python
"""In-memory storage + find helpers."""
doctors, patients, appointments = [], [], []

def add(lst, item): lst.append(item)
def all_of(lst): return lst
def find(lst, _id): return next((x for x in lst if x.id == _id), None)
```

## `hospital/io.py`
```python
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
```

## `main.py`
```python
"""Hospital System - simplified, menu driven."""
from hospital.doctor import Doctor
from hospital.patient import Patient
from hospital.appointment import Appointment
from hospital import data
from hospital.io import inp, int_inp, show, banner

did = pid = aid = 1

def manage(title, add_fn, lst):
    while True:
        print(f"\n--- {title} ---\n1. Add  2. View  9. Back")
        ch = int_inp("Choice: ")
        if ch == 1: add_fn()
        elif ch == 2:
            print("Empty." if not lst else "\n".join(str(x) for x in lst))
        elif ch == 9: break
        else: show("Invalid choice.")

def add_doctor():
    global did
    d = Doctor(did, inp("Name: "), inp("Specialty: "))
    data.add(data.doctors, d); show(f"Doctor added ID={did}"); did += 1

def add_patient():
    global pid
    p = Patient(pid, inp("Name: "), int_inp("Age: "), inp("Condition: "))
    data.add(data.patients, p); show(f"Patient added ID={pid}"); pid += 1

def add_appt():
    global aid
    p = data.find(data.patients, int_inp("Patient ID: "))
    if not p: return show("Patient not found.")
    d = data.find(data.doctors, int_inp("Doctor ID: "))
    if not d: return show("Doctor not found.")
    a = Appointment(aid, p.id, d.id, inp("Date: "), inp("Time: "))
    data.add(data.appointments, a); show(f"Booked ID={aid}"); aid += 1

def main():
    banner()
    while True:
        print("\n=== HOSPITAL ===\n1. Doctors  2. Patients  3. Appointments  0. Exit")
        ch = int_inp("Choice: ")
        if ch == 1: manage("Doctors", add_doctor, data.doctors)
        elif ch == 2: manage("Patients", add_patient, data.patients)
        elif ch == 3: manage("Appointments", add_appt, data.appointments)
        elif ch == 0: show("Goodbye!"); break
        else: show("Invalid choice.")

if __name__ == "__main__":
    main()
```
