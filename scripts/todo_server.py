#!/usr/bin/python
import http.server
import socketserver

PORT = 8033
DIRECTORY = "Documents/notes_html/todo/"

socketserver.TCPServer.allow_reuse_address = True


class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)


with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print("Server started at localhost:" + str(PORT))
    # Prevent 'cannot bind to address' errors on restart
    httpd.serve_forever()
