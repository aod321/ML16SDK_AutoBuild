#!/bin/sh
command_exists() {
	command -v "$@" > /dev/null 2>&1
}
sh_c='sh -c'
if [ "$user" != 'root' ]; then
    if command_exists sudo; then
       sh_c='sudo -E sh -c'
    elif command_exists su; then
       sh_c='su -c'
    else
       exit 1
     fi
fi

export ML16_CROSSCOMPILLING=0
if [ ! -n "$1" ] ;then
        echo "[Tanway ML16 Smart-Build] Compile for 'arm' or 'local'"
fi 
while [ $# -gt 0 ]; do
        case "$1" in
                arm)
                        echo "Target Compile:arm"

                        export ML16_CROSSCOMPILLING=1
                        export CMAKE_INCLUDE_PATH=/opt/ML16/include/ML16:/opt/boost/include/
                        export CMAKE_LIBRARY_PATH=/opt/ML16/lib:/opt/boost/lib
                        rm -rf build/
                        mkdir build/
                        cd build
                        cmake -DCMAKE_INSTALL_PREFIX=../arm-bin -DCMAKE_TOOLCHAIN_FILE=../toolchains/arm-linux-toolChain.cmake ..
                        make
                        make install

                        echo "OK"

                        ;;
                arm64(aarch64)
                echo "Target Compile:aarch64(arm64)"

                        export ML16_CROSSCOMPILLING=1
                        export CMAKE_INCLUDE_PATH=/opt/ML16/include/ML16:/opt/boost/include/
                        export CMAKE_LIBRARY_PATH=/opt/ML16/lib:/opt/boost/lib
                        rm -rf build/
                        mkdir build/
                        cd build
                        cmake -DCMAKE_INSTALL_PREFIX=../arm-bin -DCMAKE_TOOLCHAIN_FILE=../toolchains/aarch64-linux-toolchain.cmake ..
                        make
                        make install

                        echo "OK"

                        ;;
                local)
                        echo "Target Compile:local"

                        export ML16_CROSSCOMPILLING=0
                        export CMAKE_INCLUDE_PATH=/usr/local/include/ML16:/usr/local/include
                        export CMAKE_LIBRARY_PATH=/usr/local/lib
                        rm -rf build/
                        mkdir build/
                        cd build
                        cmake -DCMAKE_INSTALL_PREFIX=../local-bin -DCMAKE_TOOLCHAIN_FILE=../toolchains/local-toolChain.cmake ..
                        make
                        make install

                        echo "OK"

                        ;;
        esac
        shift $(( $# > 0 ? 1 : 0 ))
done
