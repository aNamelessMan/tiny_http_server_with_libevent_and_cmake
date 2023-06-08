#[[ 
    blow is required to be presented in the top-level CMakeLists.txt file
    which is "When configure a project using CMake, you need to specify source directory and build directory.
    (by 'cmake -S ./project -B ./build')
    The top-level CMakeLists.txt is the one located in the source directory. 
    This CMakeLists.txt is processed first."
    https://stackoverflow.com/questions/67209004/whats-the-definition-of-top-level-in-cmake
]]
cmake_minimum_required(VERSION 3.20)#要求cmake最低的版本号
project(Hello)#项目名称

#   加载子目录
add_subdirectory(hello)

# 编译遇到未定义错误，可能是因为cmake未更新信息，删除build文件夹下文件，重进即可