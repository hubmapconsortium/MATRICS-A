cmake_minimum_required(VERSION 2.8)

PROJECT(ConnectedComp2D)

find_package(ITK REQUIRED)
include(${ITK_USE_FILE})

add_executable(ProcessCD312D ProcessCD312D.cxx)
target_link_libraries(ProcessCD312D ${ITK_LIBRARIES})
