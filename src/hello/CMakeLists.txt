list(APPEND CMAKE_MESSAGE_CONTEXT "hello")
message(STATUS "hello begin")

add_executable(Hello hello_world.cpp)

message(STATUS "hello end")
list(POP_BACK CMAKE_MESSAGE_CONTEXT)