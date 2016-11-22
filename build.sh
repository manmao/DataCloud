#set -e  # exit immediately on error
set -x  # display all commands

mkdir -p third_party;

cd third_party;

if [ ! -d libevent ]; then
	git clone https://github.com/libevent/libevent.git libevent
	cd libevent

 	cmake .     # Default to Unix Makefiles.
 	make
 	#make verify  # (optional)
 	cd ../
fi

cd ../

mkdir -p build;
cd build

cmake ..

make

exit $?
