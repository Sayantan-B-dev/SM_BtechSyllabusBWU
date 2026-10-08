import re
from dataclasses import dataclass


@dataclass
class ValidationResult:
    valid: bool
    reason: str


class EmailValidator:
    PATTERN = re.compile(
        r"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"
    )

    def normalise(self, email):
        email = email.strip()
        local, separator, domain = email.partition("@")

        if separator:
            return f"{local}@{domain.lower()}"

        return email

    def validate(self, email):
        email = self.normalise(email)

        if not email:
            return ValidationResult(False, "E-mail is empty")

        if email.count("@") != 1:
            return ValidationResult(False, "Must contain exactly one @")

        local, domain = email.split("@")

        if not local:
            return ValidationResult(False, "Local-part is empty")

        if local.startswith(".") or local.endswith("."):
            return ValidationResult(False, "Local-part cannot start/end with dot")

        if ".." in local:
            return ValidationResult(False, "Local-part cannot contain two dots")

        if "." not in domain:
            return ValidationResult(False, "Domain needs a dot")

        if len(local) > 64:
            return ValidationResult(False, "Local-part is too long")

        if len(email) > 254:
            return ValidationResult(False, "E-mail is too long")

        if not self.PATTERN.fullmatch(email):
            return ValidationResult(False, "Invalid e-mail syntax")

        return ValidationResult(True, "Valid e-mail address")


def manual_check(email):
    """Simple string-method version."""
    email = email.strip()

    if email.count("@") != 1:
        return False, "must contain exactly one @"

    local, domain = email.split("@")

    if not local or local.startswith(".") or ".." in local:
        return False, "bad local-part"

    if "." not in domain:
        return False, "domain needs a dot"

    return True, "ok"


def main():
    validator = EmailValidator()

    print("Email Validation System")
    print("-" * 30)

    while True:
        email = input("Enter e-mail (or 'quit'): ")

        if email.lower() == "quit":
            print("Goodbye!")
            break

        result = validator.validate(email)

        if result.valid:
            print("Valid:", result.reason)
        else:
            print("Invalid:", result.reason)

        print()


if __name__ == "__main__":
    main()
