"""Patient model."""
class Patient:
    def __init__(self, pid, name, age, condition):
        self.id, self.name, self.age, self.condition = pid, name, age, condition
    def __str__(self):
        return f"[{self.id}] {self.name}, {self.age}yrs - {self.condition}"
