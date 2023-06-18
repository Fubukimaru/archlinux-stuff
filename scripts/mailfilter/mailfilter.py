#!/usr/bin/env python3

import os
import re
import json
import shutil
import signal
import sys
from subprocess import run

cfg_path = os.path.expanduser('~/.config/mailfilter/mailfilter_cfg.json')
use_grep = True

def signal_handler(sig, frame):
    print('Forcing exit')
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)

# conf = []
# conf.append(dict())
# 
# conf[0]['root']="/home/fubu/.mail/alberto.gutierrez@bsc.es/"
# conf[0]['filters']=[]
# conf[0]['filters'].append(dict())
# conf[0]['filters'][0]['in_path']="Inbox"
# conf[0]['filters'][0]['out_path']="Incisive"
# conf[0]['filters'][0]['query']="Subject:.*INCISIVE"
# conf[0]['filters'][0]['type']="list"

def grep(filter, path, use_grep=True):
    if use_grep:
        query = filter['query']
        p = run(['/usr/bin/grep', '-i', query, path])
        # -i -> Case insensitive
        if p.returncode == 0: # if exit of st is 0, there is a match
            match = True
        else:
            match = None
    else: 
        # This approach can give probems when reading codifications other
        # than UTF8
        text = open(path).read()
        match = re.search(filter['query'], text) # match query
    return match


with open(cfg_path) as f:
    conf = json.loads(f.read())

for account in conf:
    root=account['root']

    for filter in account['filters']:
        print("Processing filter...")
        in_path = os.path.join(root, filter['in_path'])
        out_path = os.path.join(root, filter['out_path'])

        walk = [(dp.split('/')[-1], os.path.join(dp, f)) for dp, dn, filenames in os.walk(in_path) for f in filenames ]
        filt = [(folder, path) for folder, path in walk if (folder == 'cur' or folder == 'new')]

        for (b_folder, path)  in filt:
            match = grep(filter, path, use_grep)
            if match is None:
                continue

            # Matched, proceed with action type
            if filter['type'] == "move":
                print(f'Moving: {path}')
                shutil.move(path, os.path.join(out_path, b_folder))
            else: # List
                print(f'{path} -> {os.path.join(out_path, b_folder)}')
