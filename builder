#!/bin/bash

dir=$(pwd)

pkg install git cmake make python clang libandroid-sysv-semaphore libandroid-spawn

git clone https://github.com/ptitSeb/box86 && git clone https://github.com/ptitSeb/box64

if [ "$1" = "86" ]; then
    # Build box86
    cd $dir/box86
    mkdir build; cd build; cmake .. -DTERMUX=1 -DCMAKE_C_COMPILER=clang -DARM64=1 -DARM_DYNAREC=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DBAD_SIGNAL=ON -DSD888=ON; make -j8
    #make install
elif [ "$1" = "64" ]; then
    # Build box64
    cd $dir/box64
    mkdir build; cd build; cmake .. -DTERMUX=1 -DARM_DYNAREC=1 -DCMAKE_C_COMPILER=clang -DCMAKE_BUILD_TYPE=RelWithDebInfo -DBAD_SIGNAL=ON -DSD888=ON; make -j8
    #make install
fi

