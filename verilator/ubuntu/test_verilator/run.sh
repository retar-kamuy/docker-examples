#!/usr/bin/env bash
verilator --cc --exe --build -j 0 -Wall --Mdir test_our/obj_dir sim_main.cpp our.v
RESULT=`obj_dir/Vour`
RESULT=`echo $RESULT | sed -e "s/[\n]\+//g"`
if [ "$RESULT" = "Hello World - our.v:2: Verilog \$finish" ]; then
    echo Verilator example C++ execution SUCCESS
    exit 0
else
    echo Verilator example C++ execution FAIL
    exit 1
fi
