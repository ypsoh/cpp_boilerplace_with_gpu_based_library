cmake_minimum_required(VERSION 3.10)
project(cuda_library)

# Specify CUDA as the language
enable_language(CUDA)

# Set the CUDA standard (adjust as needed)
set(CMAKE_CUDA_STANDARD 11)

# Create a static library from CUDA sources
add_library(cuda_library STATIC cuda_library.cu cuda_matrix.cu)

# Add -fPIC flag to compile CUDA code as position-independent
# target_compile_options(cuda_library PRIVATE -fPIC)
set_target_properties(cuda_library PROPERTIES POSITION_INDEPENDENT_CODE ON)

# Add include directories if needed
target_include_directories(cuda_library PUBLIC include)

target_link_libraries(cuda_library PRIVATE ${CUDA_LIBRARIES})

# Add any other CUDA-related flags if needed
target_compile_options(cuda_library PRIVATE -arch=sm_80)

# Set the library name and export it
set_target_properties(cuda_library PROPERTIES OUTPUT_NAME "cuda_library")
export(TARGETS cuda_library FILE "cuda_libraryConfig.cmake")

