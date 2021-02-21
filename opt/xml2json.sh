#!/bin/sh


# Usage
#
#
# $> xml2json <input>.xml > <output>.json

cat "$@" | python3 -c "import json,xmltodict,sys,os; print(json.dumps(xmltodict.parse(sys.stdin.read()), indent=4, sort_keys=True))" 
