list(APPEND CMAKE_MESSAGE_CONTEXT "src")
message(STATUS "src begin")
#[[ 
    blow is required to be presented in the top-level CMakeLists.txt file
    which is "When configure a project using CMake, you need to specify source directory and build directory.
    (by 'cmake -S ./project -B ./build')
    The top-level CMakeLists.txt is the one located in the source directory. 
    This CMakeLists.txt is processed first."
    https://stackoverflow.com/questions/67209004/whats-the-definition-of-top-level-in-cmake
]]
cmake_minimum_required(VERSION 2.6)

project(echo CXX)

# 配置编译选项
set(CXX_FLAGS
 -g
 # -DVALGRIND
 # -DMUDUO_STD_STRING
 -Wall
 -Wextra
 # -m32
 -Werror
 -Wconversion
 -Wno-unused-parameter
 -Wold-style-cast
 -Woverloaded-virtual
 -Wpointer-arith
 -Wshadow
 -Wwrite-strings
 -march=native
 # -MMD
 # -std=c++0x
 -rdynamic
 )
string(REPLACE ";" " " CMAKE_CXX_FLAGS "${CXX_FLAGS}")

set(CMAKE_CXX_COMPILER "g++")
set(CMAKE_CXX_FLAGS_DEBUG "-O0")
set(CMAKE_CXX_FLAGS_RELEASE "-O2 -finline-limit=1000 -DNDEBUG")
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)

# 配置依赖
# if(NOT CMAKE_BUILD_TYPE)
#   set(CMAKE_BUILD_TYPE "debug")
# endif()

if(NOT MUDUO_PATH)
  set(MUDUO_PATH "~/qinjun/build/debug-install-cpp11")
endif()

# if(NOT MUDUO_PATH)
#   set(MUDUO_PATH "/home/$ENV{USER}/build/${CMAKE_BUILD_TYPE}-install")
# endif()


find_path(Muduo_INCLUDE_DIR muduo "${MUDUO_PATH}/include")
find_path(Muduo_LIBRARY_DIR libmuduo_net.a "${MUDUO_PATH}/lib")
set(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} ${Muduo_LIBRARY_DIR})
message(STATUS ${Muduo_INCLUDE_DIR})
message(STATUS ${Muduo_LIBRARY_DIR})

include_directories(${Muduo_INCLUDE_DIR})
find_library(muduo_base muduo_base)
find_library(muduo_net muduo_net)
message(STATUS ${muduo_base})
message(STATUS ${muduo_net})

find_package(Boost REQUIRED)
include_directories(${Boost_INCLUDE_DIRS})

include_directories(${PROJECT_SOURCE_DIR})

# 添加子目录
add_subdirectory(hello)


# 编译遇到未定义错误，可能是因为cmake未更新信息，删除build文件夹下文件，重进即可

message(STATUS "src end")
list(POP_BACK CMAKE_MESSAGE_CONTEXT)