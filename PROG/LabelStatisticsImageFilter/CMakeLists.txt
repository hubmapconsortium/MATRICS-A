
cmake_minimum_required(VERSION 3.2)
 
project(LabelShapeFilter)
 
find_package(ITK REQUIRED)
include(${ITK_USE_FILE})
 
add_executable(LabelShapeFilter2D LabelShapeFilter2D.cxx)
target_link_libraries(LabelShapeFilter2D ${ITK_LIBRARIES})
