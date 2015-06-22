#!/usr/bin/env python

"""
Usage: Instead of using "cd", use "j"

Add this to .bashrc

j () {
    $(jmp $@)
}
"""

import os
import sys

env_homedir = os.environ['HOME']
db_file = os.path.join(env_homedir, '.j.db')
HIST_SIZE = 1000

def full_filename(partial):
    return os.path.abspath(
        os.path.join(os.getcwd(), os.path.expanduser(partial))
    )

def search_history(history, needle):
    nlen = len(needle)
    min_cruft = float('Inf')
    match = None
    for directory in history:
        pos = directory.rfind(needle)
        if pos >= 0:
            # how much extra cruft?
            extra = len(directory) - pos - nlen
            if extra <= min_cruft:
                min_cruft = extra
                match = directory
    return match or full_filename(needle)

def read_history():
    hist_hash = {}
    if os.path.exists(db_file):
        with open(db_file) as db_file_fh:
            history = db_file_fh.read().split('\n')
            for i, item in enumerate(history):
                hist_hash[item] = i
    else:
        history = []
    return history, hist_hash

def write_history(history):
    with open(db_file, 'w') as db_file_fh:
        if len(history) > (HIST_SIZE * 1.4):
            history = history[-HIST_SIZE:]
        db_file_fh.write('\n'.join(history))

def save_match(history, hist_hash, match):
    idx = hist_hash.get(match)
    if idx is not None:
        history.pop(idx)
    history.append(match)
    write_history(history)

if __name__ == '__main__':
    if not len(sys.argv) > 1:
        # Handle the case when you just type "j"
        print 'cd %s' % env_homedir
        sys.exit(0)

    history, hist_hash = read_history()
    needle = sys.argv[1]
    match = full_filename(needle)

    if os.path.isdir(match):
        # Handle the case when the input is a valid directory
        save_match(history, hist_hash, match)
    else:
        # Perform a search for a partial match
        match = search_history(history, needle)
        if os.path.isdir(match):
            save_match(history, hist_hash, match)
        else:
            match = needle
    print 'cd %s' % (match)
