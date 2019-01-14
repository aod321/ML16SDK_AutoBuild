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

if [ ! -n "$1" ] ;then
        echo "[Tanway ML16 Smart-Build] Compile for 'arm' or 'local'"
fi 
while [ $# -gt 0 ]; do
        case "$1" in
                arm)
                        echo "Target Compile:arm"

                        rm -rf build/
                        mkdir build/
                        cd build
                        cmake -DCMAKE_INSTALL_PREFIX=/opt/ML16 -DCMAKE_TOOLCHAIN_FILE=../toolchains/arm-linux-toolChain.cmake ..
                        make
                        $sh_c "make install"

                        echo "OK"

                        ;;
                arm64|aarch64)
                        echo "Target Compile:aarch64(arm64)"

                        rm -rf build/
                        mkdir build/
                        cd build
                        cmake -DCMAKE_INSTALL_PREFIX=/opt/ML16 -DCMAKE_TOOLCHAIN_FILE=../toolchains/aarch64-linux-toolchain.cmake ..

                        make
                        $sh_c "make install"

                        echo "OK"

                        ;;
                local)
                        echo "Target Compile:local"

                        rm -rf build/
                        mkdir build/
                        cd build
                        cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_TOOLCHAIN_FILE=../toolchains/local-toolChain.cmake ..
                        make
                        $sh_c "make install"

                        echo "OK"

                        ;;
        esac
        shift $(( $# > 0 ? 1 : 0 ))
done
