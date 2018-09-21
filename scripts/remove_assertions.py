#!/usr/bin/python3 -O

"""Remove some lines in Ada source code. First argument is the file to
be treated. The created filename will have \"_wo_lines\" added. You
can give more arguments to eliminate lines containing some strings,
for instance to remove call to lemmas.

Beware, this is a cheap and dirty script, it may not work with your
code!

"""

import os
import sys

multi_line_pragma = False
pragma_end = False
excluding_list = [ ]

if len(sys.argv) >= 2:
    excluding_list = excluding_list + sys.argv[2:]

with open(sys.argv[1]) as source_file, open(os.path.splitext(sys.argv[1])[0] + "_wo_lines.adb", 'w') as dest_file:
    for row in source_file:
        if pragma_end:
            pragma_end = False
            if row == "\n":
                continue
        if multi_line_pragma and ";" not in row:
            continue
        else:
            if any(s in row for s in excluding_list):
                if ";" not in row:
                    multi_line_pragma = True
                else:
                    pragma_end = True
                continue
            elif multi_line_pragma and ";" in row:
                multi_line_pragma = False
                pragma_end = True
                continue
            else:
                dest_file.write(row)
