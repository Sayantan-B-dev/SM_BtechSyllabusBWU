# Email Validation System

A simple Python project that checks whether an e-mail address is correctly formatted.

## Features

- Removes extra spaces using `strip()`
- Checks that there is exactly one `@`
- Checks the local-part
- Checks that the domain contains a dot
- Uses Regular Expression (`re`) for syntax validation
- Uses a class and `dataclass`
- Gives a clear valid/invalid result

## How to Run

Make sure Python is installed.

Run:

```bash
python email_validator_simple.py
```

Then enter an e-mail address, for example:

```text
Enter e-mail (or 'quit'): alice@mail.com
Valid: Valid e-mail address
```

For an invalid address:

```text
Enter e-mail (or 'quit'): user@@mail.com
Invalid: Must contain exactly one @
```

Type `quit` to close the program.

## Examples

Valid:
- `alice@mail.com`
- `user+tag@mail.com`
- `a.b@sub.example.co.uk`

Invalid:
- `user@@mail.com`
- `user@mail`
- `.user@mail.com`
- `user..name@mail.com`

## Python Concepts Used

- Variables
- Strings and string methods
- Functions
- Regular expressions
- Modules
- Classes and objects
- `dataclass`
- Conditional statements
- Loops

## Project Topic

**Email Validation System**

The project demonstrates practical Python programming by checking the syntax and basic structure of e-mail addresses.
