cmake_minimum_required(VERSION 3.10)
project(cpp_project)

# Find CUDA package if needed
find_package(CUDA)

set(CMAKE_CXX_STANDARD 11)

# Add the CUDA library as a dependency (replace 'cuda_library' with the actual name of the CUDA library)
add_subdirectory(cuda_library)

# Add the C++ project executable
add_executable(cpp_project main.cpp)

# Set the -fPIE flag for both compilation and linking
set_target_properties(cpp_project PROPERTIES COMPILE_FLAGS "-fPIE" LINK_FLAGS "-fPIE")

# Link the C++ project with the CUDA library
target_link_libraries(cpp_project PRIVATE cuda_library)

# Add include directories for cuda_library
target_include_directories(cpp_project PRIVATE ${CMAKE_SOURCE_DIR}/cuda_library/include)
