#!/bin/bash

dir=$(pwd)

#pkg install -y git cmake make python clang libandroid-sysv-semaphore libandroid-spawn
#pkg upgrade -y
#pkg update -y

if [ ! -f "$dir/box86" ]; then
    git clone https://github.com/ptitSeb/box86 && git clone https://github.com/ptitSeb/box64
fi


# Build box86
cd $dir/box86
mkdir build; cd build; cmake .. -DARM64=1 -DARM_DYNAREC=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DBAD_SIGNAL=ON -DSD888=ON; make -j8
#make install
# Build box64
cd $dir/box64
mkdir build; cd build; cmake .. -DARM_DYNAREC=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DBAD_SIGNAL=ON -DSD888=ON; make -j8
#make install


clear
if [ -f $dir/box64/build/box64 ] && [ -f $dir/box86/build/box86 ]; then
    echo "Box Binaries built successfully. You can found them in"
    echo "BOX64: $dir/box64/build/box64"
    echo "BOX86: $dir/box86/build/box86"
else
    echo "Box Binaries Build Process FAILED!"
fi
