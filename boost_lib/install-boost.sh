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
        echo "[Tanway ML16 Warning] choose 'arm' ,'aarch64'(or 'arm64'),'x86'"
fi 
while [ $# -gt 0 ]; do
        case "$1" in
                arm)
                        echo "Installing..."
                        $sh_c "cp -vr ./armhf/boost /opt/boost"
                        echo "OK"

                        ;;
                x86)
                        echo "Installing..."
                        $sh_c "cp -vr ./x86/include /usr/local/"
                        $sh_c "cp -vr ./x86/lib /usr/local/"
                        echo "OK"

                        ;;
                arm64|aarch)
                        echo "Installing..."
                        $sh_c "cp -vr ./aarch64/boost /opt/boost"
                        echo "OK"

                        ;;
        esac
        shift $(( $# > 0 ? 1 : 0 ))
done
