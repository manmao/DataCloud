#set -e  # exit immediately on error
set -x  # display all commands

rm -rf third_party;

mkdir -p third_party;
cd third_party;

if [ ! -f libevent ]; then
	git clone https://github.com/libevent/libevent.git libevent
	cd libevent

 	cmake .     # Default to Unix Makefiles.
 	make
 	#make verify  # (optional)
 	cd ../
fi

cd ../

rm -rf build;
mkdir -p build;
cd build

cmake ..

make

exit $?
