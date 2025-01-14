# Path Traversal Vulnerability Demo

A deliberately vulnerable Flask application demonstrating path traversal (CWE-22).

## The Vulnerability
The code flow shows a classic path traversal:

1. **Source**: User input from URL parameter `<string:payload>`
2. **Sink**: Direct use in `open(payload, "r")` without any validation
3. **Impact**: Attacker can read any file accessible to the application process


## Fixing the Vulnerability
To fix this path traversal vulnerability, implement these security controls:

1. **Path Sanitization**: Use `os.path.abspath()` and `os.path.join()` to create safe file paths
4. **Path Normalization**: Remove path traversal sequences (../) before use

```python
from flask import Flask, abort
import os

app = Flask(__name__)

# Define a safe base directory
BASE_DIR = os.path.abspath("safe_directory")

@app.route("/pt/<string:payload>")
def definite_pt(payload: str) -> str:
    # Normalize the path to prevent traversal
    safe_path = os.path.abspath(os.path.join(BASE_DIR, payload))

    # Ensure the path is within the base directory
    if not safe_path.startswith(BASE_DIR):
        abort(403)  # Forbidden

    try:
        with open(safe_path, "r") as f:
            text = f.read()
        return text
    except FileNotFoundError:
        abort(404)  # Not Found
    except Exception as e:
        abort(500)  # Internal Server Error

if __name__ == "__main__":
    app.run(debug=True)
```
