#!/usr/bin/python
# -*- coding: utf-8 -*-
from http.server import SimpleHTTPRequestHandler
import socketserver

PORT = 8033
DIRECTORY = "Documents/notes_html/todo/"

socketserver.TCPServer.allow_reuse_address = True
SimpleHTTPRequestHandler.extensions_map = {
        k: v + ';charset=UTF-8' for k, v
        in SimpleHTTPRequestHandler.extensions_map.items()
}


class Handler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)


with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print("Server started at localhost:" + str(PORT))
    # Prevent 'cannot bind to address' errors on restart
    httpd.serve_forever()

# python3 -c "from http.server import test,
#  SimpleHTTPRequestHandler as RH;
#RH.extensions_map={k:v+';charset=UTF-8' for k,v in RH.extensions_map.items()};
#test(RH)"
