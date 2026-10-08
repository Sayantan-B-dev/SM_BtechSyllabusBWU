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
