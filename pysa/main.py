import os
from typing import Any


class SecurityException(Exception):
    pass


# Add type annotations for better analysis
def unsafe_file_access(user_input: str) -> str:
    file_path = (
        f"/home/user/files/{user_input}"  # TaintFlow[RequestSource -> FileSystem]
    )
    with open(file_path, "r") as file:
        return file.read()


def safe_file_access(user_input: str) -> str:
    base_dir = "/home/user/files"
    sanitized_input = os.path.basename(user_input)
    file_path = os.path.join(base_dir, sanitized_input)

    if not os.path.abspath(file_path).startswith(base_dir):
        raise SecurityException("Path traversal attempt detected")

    with open(file_path, "r") as file:
        return file.read()


def handle_file_request(request: Any) -> str:
    filename = request.GET.get("filename", "")  # Marked as TaintSource[RequestSource]
    return unsafe_file_access(filename)  # Shows flow from source to sink
