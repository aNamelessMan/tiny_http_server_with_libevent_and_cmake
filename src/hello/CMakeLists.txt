list(APPEND CMAKE_MESSAGE_CONTEXT "hello")
message(STATUS "hello begin")

add_executable(echo ./echo.cpp)
target_link_libraries(echo ${muduo_net})
target_link_libraries(echo ${muduo_base})
target_link_libraries(echo pthread rt)

add_executable(hello ./hello_world.cpp)

message(STATUS "hello end")
list(POP_BACK CMAKE_MESSAGE_CONTEXT)