"""In-memory storage + find helpers."""
doctors, patients, appointments = [], [], []

def add(lst, item): lst.append(item)
def all_of(lst): return lst
def find(lst, _id): return next((x for x in lst if x.id == _id), None)
