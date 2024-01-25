#!/bin/sh
# findgit: Find all Git repos in a dir 

find $HOME -name .git -type d | sed -e "s.$HOME.." -e 's|.git||'
