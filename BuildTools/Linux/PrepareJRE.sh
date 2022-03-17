#!/bin/sh

#mkdir JRE
#cd JRE

# You can get the archives from Ubuntu repos
#ArA=openjdk-8-jre_8u312-b07-0ubuntu1_18.04
#ArB=openjdk-8-jre-headless_8u312-b07-0ubuntu1_18.04
#for Pk in \
#	${ArA}_amd64.deb \
#	${ArA}_i386.deb \
#	${ArB}_amd64.deb \
#	${ArB}_i386.deb
#do
#	rm -rf control.tar.xz data.tar.xz debian-binary etc/ usr/
#	ar x $Pk
#	
#done

mv java-8-openjdk-amd64/jre amd64
mv java-8-openjdk-i386/jre i386
rm -rf java-8-openjdk-amd64
rm -rf java-8-openjdk-i386

ln -s i386 i686
ln -s i386 x86
ln -s amd64 x86_64

cd i386/lib
ln -s i386 i686
ln -s i386 x86
cd ../..

cd amd64/lib
ln -s amd64 x86_64
cd ../..
