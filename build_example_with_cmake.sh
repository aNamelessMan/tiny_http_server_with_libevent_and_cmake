#CMake的工作过程分为三个阶段：配置、生成、构建（生成在构建后自动执行）
# 1. Configure + 2. Generate
# 配置：执行CMakeLists.txt文件收集信息（系统配置、项目配置等）
# 生成：为当前工作项目生成构建系统，例如为make生成makefile

# 使用 -S指定目录的源代码 在 -B指定的目录（没有就创建）的 生成一个构建系统
cmake -S ./src -B ./build

# 3. Build 构建阶段 调用构建工具（如make）
# compile + link + test + package
cmake --build build -j 8

# cmake --install <dir>
# ./build/hello/Hello