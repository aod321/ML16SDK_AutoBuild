FIND_PACKAGE(Boost REQUIRED COMPONENTS 
        thread)
include_directories(${Boost_INCLUDE_DIRS})
message("${Boost_INCLUDE_DIRS}")
message("${Boost_LIBRARIES}")

SET(HEADR_FINDPATH /usr/local/include/ML16)
SET(LIB_FINDPATH /usr/local/lib)
message($ENV{ML16_CROSSCOMPILLING})
IF($ENV{ML16_CROSSCOMPILLING} EQUAL "1")
        message("cross compilling")
        SET(HEADR_FINDPATH /opt/ML16/include/ML16)
        SET(LIB_FINDPATH /opt/ML16/lib)
        message(${HEADR_FINDPATH})
        message(${LIB_FINDPATH})

ELSEIF($ENV{ML16_CROSSCOMPILLING} EQUAL "0")
        message("local compilling")
        SET(HEADR_FINDPATH /usr/local/include/ML16)
        SET(LIB_FINDPATH /usr/local/lib)
        message(${HEADR_FINDPATH})
        message(${LIB_FINDPATH})
ENDIF()


FIND_PATH(myHeader ML16lidar.h ${HEADR_FINDPATH})
MESSAGE(${myHeader})
IF(myHeader)
        INCLUDE_DIRECTORIES(${myHeader})
ELSE()
        message("Can not find ML16 include")
ENDIF(myHeader)

FIND_LIBRARY(ML16_LIBRARIES NAMES ML16 PATHS ${LIB_FINDPATH})

MESSAGE("${ML16_LIBRARIES}")

SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)

ADD_EXECUTABLE(testprint printframe.cpp)

SET_TARGET_PROPERTIES(testprint PROPERTIES VERSION 1.1 SOVERSION 1)
SET_TARGET_PROPERTIES(testprint PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE)

TARGET_LINK_LIBRARIES(testprint pthread ${Boost_LIBRARIES} ${ML16_LIBRARIES})

INSTALL(TARGETS testprint
        RUNTIME DESTINATION bin
        )

