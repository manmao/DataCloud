set -e  # exit immediately on error
set -x  # display all commands

mkdir -p third_party;

cd third_party;

if [ ! -f libevent ]; then
	git clone https://github.com/libevent/libevent.git libevent
	cd libevent

	mkdir build && cd build
 	cmake ..     # Default to Unix Makefiles.
 	make
 	make verify  # (optional)
 	cd ../../../
fi

mkdir -p build;
cd build

cmake ..

make

exit $?