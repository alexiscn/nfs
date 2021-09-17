#!/bin/sh

cd Sources
rm -rf "nfs"
git clone https://github.com/sahlberg/libnfs nfs

for i in '*.txt' '*.AROS' '*.am' '*.x' '*.def'; do
    find . -name $i -exec rm -f {} \;
done

rm -rf nfs/doc
rm -rf nfs/examples
rm -rf nfs/ps3_ppu
rm -rf nfs/aros
rm -rf nfs/cmake
rm -rf nfs/tests
rm -rf nfs/win32
rm -rf nfs/utils
rm -rf nfs/include/win32
rm -rf nfs/packaging

rm -f nfs/win32build.bat
rm -f nfs/INSTALL
rm -f nfs/bootstrap
rm -f nfs/libnfs.pc.in


cp ../config.h nfs/include/config.h

sed -i '' 's/#include \"libnfs-zdr.h\"/#include \"nfsc\/libnfs.h\"\n#include \"nfsc\/libnfs-zdr.h\"\n#include \"nfsc\/libnfs-raw.h\"/' nfs/include/libnfs-private.h

