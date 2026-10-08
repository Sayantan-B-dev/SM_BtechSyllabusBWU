"""Doctor model."""
class Doctor:
    def __init__(self, did, name, specialty):
        self.id, self.name, self.specialty = did, name, specialty
    def __str__(self):
        return f"[{self.id}] {self.name} ({self.specialty})"
