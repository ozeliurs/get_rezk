# file_operations.py

import os


class SecurityException(Exception):
    pass


def unsafe_file_access(user_input):
    # BAD: Unsafe direct use of user input in file path
    file_path = f"/home/user/files/{user_input}"
    with open(file_path, "r") as file:
        return file.read()


def safe_file_access(user_input):
    # GOOD: Sanitize and validate the file path
    base_dir = "/home/user/files"
    sanitized_input = os.path.basename(user_input)
    file_path = os.path.join(base_dir, sanitized_input)

    # Additional validation
    if not os.path.abspath(file_path).startswith(base_dir):
        raise SecurityException("Path traversal attempt detected")

    with open(file_path, "r") as file:
        return file.read()


# Example web route handler
def handle_file_request(request):
    filename = request.GET.get("filename", "")
    return unsafe_file_access(filename)  # Vulnerable to path traversal
