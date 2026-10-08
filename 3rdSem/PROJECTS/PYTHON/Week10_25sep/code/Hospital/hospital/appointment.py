"""Appointment model."""
class Appointment:
    def __init__(self, aid, pid, did, date, time):
        self.id, self.pid, self.did, self.date, self.time = aid, pid, did, date, time
    def __str__(self):
        return f"[{self.id}] P{self.pid} + D{self.did} @ {self.date} {self.time}"
