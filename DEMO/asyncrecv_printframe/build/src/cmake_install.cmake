# Install script for directory: /home/yinzi/Desktop/ML16SDK_AutoBuild/DEMO/asyncrecv_printframe/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/yinzi/Desktop/ML16SDK_AutoBuild/DEMO/asyncrecv_printframe/arm-bin")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/testprint-1.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/testprint"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "/opt/boost/lib:/opt/ML16/lib")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES
    "/home/yinzi/Desktop/ML16SDK_AutoBuild/DEMO/asyncrecv_printframe/build/bin/testprint-1.1"
    "/home/yinzi/Desktop/ML16SDK_AutoBuild/DEMO/asyncrecv_printframe/build/bin/testprint"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/testprint-1.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/testprint"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/opt/boost/lib:/opt/ML16/lib:"
           NEW_RPATH "/opt/boost/lib:/opt/ML16/lib")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/opt/poky/2.4.2/sysroots/x86_64-pokysdk-linux/usr/bin/aarch64-poky-linux/aarch64-poky-linux-strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

