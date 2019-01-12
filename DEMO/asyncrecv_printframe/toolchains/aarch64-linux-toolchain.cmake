SET(CMAKE_SYSTEM_NAME  Linux)
SET(MYSYSROOT "/opt/poky/2.4.2/sysroots/aarch64-poky-linux")
SET(CMAKE_SYSROOT ${MYSYSROOT})
SET(CMAKE_SYSROOT_LINK ${MYSYSROOT})
SET(CMAKE_C_COMPILER "/opt/poky/2.4.2/sysroots/x86_64-pokysdk-linux/usr/bin/aarch64-poky-linux/aarch64-poky-linux-gcc")
SET(CMAKE_C_FLAGS "-march=armv8-a -mtune=cortex-a57.cortex-a53")
SET(CMAKE_CXX_COMPILER "/opt/poky/2.4.2/sysroots/x86_64-pokysdk-linux/usr/bin/aarch64-poky-linux/aarch64-poky-linux-g++")
SET(CMAKE_CXX_FLAGS "-march=armv8-a -mtune=cortex-a57.cortex-a53")
SET(CMAKE_LINKER "/opt/poky/2.4.2/sysroots/x86_64-pokysdk-linux/usr/bin/aarch64-poky-linux/aarch64-poky-linux-ld")

SET(BOOST_ROOT /opt/boost)

