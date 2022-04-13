#!/usr/bin/env python3

# Copyright (c) 2021 Tuncay D.
# MIT License, see LICENSE

import sys
import pathlib
import json
import urllib.request
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-f', '--filter', default='',
        help='print emoji only if name contains filter')
parser.add_argument('-l', '--limit', default=0, type=int,
        help='limit the number of output emojis, defaults to 0 (no limit')
parser.add_argument('-N', '--no-name', default=False, action='store_true',
        help='do not output emoji names')
parser.add_argument('-w', '--wipe', default=False, action='store_true',
        help='delete temporary emoji files, redownload and recreate them')
parser.add_argument('-c', '--lower-case', default=False, action='store_true',
        help='convert output to lower case only')
parser.add_argument('-i', '--input',
        help='path to file with additional newline separated content')
args = parser.parse_args()

cdir = pathlib.Path('~/.cache/emojiget')
cdir = cdir.expanduser()
jfile = pathlib.Path(cdir / 'emoji.json')
jfile_filtered = pathlib.Path(cdir / 'emoji_filtered.json')
ifile = ''

if args.wipe:
    jfile.unlink(missing_ok=True)
    jfile_filtered.unlink(missing_ok=True)
    cdir.rmdir()
    sys.exit(0)

if args.input:
    ifile = pathlib.Path(args.input)
    ifile = ifile.expanduser()

if jfile_filtered.exists():
    jtext = jfile_filtered.read_text()
    emojis = json.loads(jtext)
else:
    if jfile.exists():
        jtext = jfile.read_text()
    else:
        cdir.mkdir(exist_ok=True)
        # Source: overatgithub/emoji.json
        # Alternate = 'https://gist.githubusercontent.com/thingsiplay/1f500459bc117cf0b63e1f5c11e03963/raw/d8e4b78cfe66862cf3809443c1dba017f37b61db/emojis.json'
        jurl = 'https://gist.githubusercontent.com/oliveratgithub/0bf11a9aff0d6da7b46f1490f86a71eb/raw/d8e4b78cfe66862cf3809443c1dba017f37b61db/emojis.json'
        jresponse = urllib.request.urlopen(jurl)
        jdata = jresponse.read()
        jtext = jdata.decode('utf-8')
        jfile.write_text(jtext)

    emojis = json.loads(jtext)

    # The alternate filter by "skin" compared to the "order" method will
    # include more stuff in the end, but makes it very slow and unusable in
    # dmenu. There is no problem in rofi, if you want switch. But remember
    # to wipe the cache with -w option.
    #emojis['emojis'] = [em for em in emojis['emojis'] if not 'skin' in em['name']]
    emojis['emojis'] = [em for em in emojis['emojis'] if em['order'] != '']

    jfile_filtered.write_text(json.dumps(emojis))

if args.input and ifile.exists():
    output = ifile.read_text()
else:
    output = ''

for index, emoji in enumerate(emojis['emojis']):
    if args.filter in emoji['name']:
        output += emoji['emoji']
        if not args.no_name:
            output += ' ' + emoji['name'] + ' ~ ' + emoji['category']
        if args.limit > 0 and index >= args.limit - 1:
            break
        output += '\n'
if args.lower_case:
    output = output.lower()
if output:
    print(output)
