#!/bin/bash
#PS4='+($?) $BASH_SOURCE:$FUNCNAME:$LINENO:'

#test script to mimic fail/warning/info handlers for wercker locally

export WERCKER_PHPCS_DIRECTORY="./src"

. build-esen.sh

. run.sh

RESULT=$?
if [[ $RESULT -ne "0" ]]; then
    echo "Test: FAIL -> $RESULT"
    return 1 2>/dev/null || exit 1
else
	echo "done"
fi
