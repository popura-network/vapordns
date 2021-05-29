#!/bin/sh

if [ -d build/ ]; then
	echo Build directory already exists
	exit 2
fi

echo Building vapordns

mkdir build

git clone -b v1.8.3 https://github.com/coredns/coredns.git build

cd build

go get github.com/wealdtech/coredns-ens@v1.3.1
go get github.com/zhoreeq/coredns-meshname
go mod download

cp ../plugin.cfg plugin.cfg

if [ "$GOOS" = "windows" ]; then
	# requires gcc-mingw-w64 package

	make BINARY=vapordns.exe SHELL='sh -x' CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc SYSTEM="GOOS=windows GOARCH=amd64" CHECKS="" BUILDOPTS="" && \
		mv vapordns.exe ../
else
	make SHELL='sh -x' CGO_ENABLED=1 && \
		mv coredns ../vapordns
fi

cd ../

rm -rf build

