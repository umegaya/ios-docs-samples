#!/bin/bash

set -eu

out="/Users/iyatomi/Documents/hl/mgo/Client/Src/Network/RPC"

libs=("BoringSSL" "Protobuf" "gRPC-Core" "gRPC-ProtoRPC" "gRPC" "gRPC-RxLibrary")
dsts=("BoringSSL" "Protobuf" "gRPC-Core" "ProtoRPC" "GRPCClient" "RxLibrary")

i=0
for name in ${libs[@]}; do
	dest=${dsts[${i}]}
	echo "${name} => ${dest}"
	i=$i+1
	rm -rf ${out}/${dest}
	if [ "$dest" = "gRPC-Core" ]; then
		mkdir -p ${out}/${dest}
		cp ./Release-iphoneos/${name}/lib${name}.a ${out}/${dest}/
	else
		cp -r ./Release-iphoneos/${name} ${out}/${dest}
	fi
	touch ${out}/${dest}/lib${name}.a.lipo
	xcrun -sdk iphoneos lipo -create ./Release-iphonesimulator/${name}/lib${name}.a ./Release-iphoneos/${name}/lib${name}.a -output ${out}/${dest}/lib${name}.a
done

