# 使用 -S指定目录的源代码 在 -B指定目录（没有就创建）的 生成一个构建系统
cmake -S ./src -B ./build
cmake --build build
./build/hello/Hello