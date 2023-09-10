#!/usr/bin/env bash
RESULT=`slang test/Wmissing-top.sv`
RESULT=`echo $RESULT | sed -e "s/[\n]\+//g"`
if [ "$RESULT" = "Build succeeded: 0 errors, 1 warning" ]; then
    echo Slang warning -Wmissing-top execution SUCCESS
    exit 0
else
    echo Slang Warning -Wmissing-top execution FAIL
    exit 1
fi
