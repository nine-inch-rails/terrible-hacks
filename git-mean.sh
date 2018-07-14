#!/bin/bash
git filter-branch --tree-filter '
    for f in $(git ls-files)
    do
        sed -i '"'"'s/^.*$/& /'"'"' "$f"
    done'
