#!/bin/bash

# First pull all required targets. e.g.:
#   bst pull --deps all all.bst
#
# Then disable artifacts cache in both 'project.conf's. Then call it with .bst file
#
#   bash utils/reproducible.sh freedesktop-sdk all.bst
#
# Extra parameters are passed to bst. That is useful to pass architecture
# options.
#
# It will not go through external project. So you need to verify
# sdk and bootstrap separately.
#
# To test the bootstrap you can replace the command above with
#
#   bash utils/reproducible.sh freedesktop-sdk-bootstrap bootstrap-extract.bst
#
# Standard output will tell whether artifacts are reproducible.  File
# "reproducible.log" contains extra logs.  File "results" will be a
# cache of all results to not have to re-test already tested
# artifacts.

# Inspired by
# https://gitlab.com/jmacarthur/buildstream/blob/jmac/reproducible/contrib/repro.py

set -e

project=$1
element=$2
shift 2
bst="bst $@"
castool="utils/castool.py"
global_result=0

tmp=
clean_tmp() {
    if [ -n "${tmp}" ] && [ -d "${tmp}" ]; then
        rm -rf "${tmp}"
    fi
}

trap clean_tmp EXIT

touch results

${bst} show --deps all $element --format '%{name},%{full-key},%{state}' 2>/dev/null |
while IFS=, read -r name ref state; do
    case "${name}" in
        *:*)
            continue
            ;;
    esac
    reproducible="$(sed "\|^${name}:${ref}:|{;s///;q;};d" results)"
    case "${reproducible}" in
         true)
             echo "${name} ${ref} is reproducible"
             ;;
         false)
             echo "${name} ${ref} is not reproducible"
             global_result=1
             ;;
         *)
             sed -i "\|^${name}:${ref}:|d" results
             case "${state}" in
                 cached)
                     ;;
                 *)
                     ${bst} build "${name}" &>>reproducible.log
                     ;;
             esac
             tmp=$(mktemp -td reproducible.XXXXXXXXXX)
             element_name=$(echo "${name/\//-}" | cut -f 1 -d '.')
             echo "Checking ${name} for reproducibility"
             ${castool} checkout ${project} ${element_name} ${ref} "${tmp}/a" &>>reproducible.log
             ${castool} delete ${project} ${element_name} ${ref} &>>reproducible.log
             ${bst} build "${name}" &>>reproducible.log
             ${castool} checkout ${project} ${element_name} ${ref} "${tmp}/b" &>>reproducible.log
             if diff -r --no-dereference "${tmp}/a/files" "${tmp}/b/files" --exclude="*.pyc" --exclude="*.pyo" &>>reproducible.log; then
                 echo "${name} ${ref} is reproducible"
                 reproducible=true
             else
                 echo "${name} ${ref} is not reproducible"
                 global_result=1
                 reproducible=false
             fi
             rm -rf "${tmp}"
             tmp=
             echo "${name}:${ref}:${reproducible}" >>results
             ;;
    esac
done
