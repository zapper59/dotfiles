#!/usr/bin/env python

import inspect
import os
import sys

def repository_path():
    'Returns the repository given a path inside one.'
    path = os.path.realpath(inspect.getfile(inspect.currentframe()))
    while not os.path.exists(os.path.join(path, '.hg')):
        if path == '/': return None
        path = os.path.dirname(path)

    return path

def process_bundle(line):
    bundle_start = line.find("'") + 1
    bundle_end = line.find("'", bundle_start)
    slash = line.rfind('/', bundle_start, bundle_end) + 1

    return 'vim/bundle/%s = [git]https://github.com/%s.git' % (
        line[slash:bundle_end], line[bundle_start:bundle_end])

def main():
    repo = repository_path()
    if repo is None:
        return 0

    bundles_path = os.path.join(repo, 'vim', 'bundles')
    hgsub_path = os.path.join(repo, '.hgsub')

    bundles = {
        process_bundle(line): 1 for line in open(bundles_path, 'r').readlines()
            if line.startswith('Bundle')
    }

    hgsub = { line.strip(): 1 for line in open(hgsub_path, 'r').readlines() }
    hgsub.update(bundles)

    with open(hgsub_path, 'w') as hgsub_file:
        for line in sorted(hgsub.iterkeys()):
            print >> hgsub_file, line

if __name__ == "__main__":
    sys.exit(main())
