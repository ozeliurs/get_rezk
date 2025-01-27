import os

from django.http import HttpRequest, HttpResponse


def pt(request: HttpRequest) -> HttpResponse:
    filename = request.GET["filename"]

    file_path = os.path.join("/data", filename)

    try:
        with open(file_path, "r") as file:
            content = file.read()
    except FileNotFoundError:
        return HttpResponse("File not found", status=404)
    except Exception as e:
        return HttpResponse(f"An error occurred: {str(e)}", status=500)

    return HttpResponse(content)
