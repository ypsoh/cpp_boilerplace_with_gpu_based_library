// cuda_library.cu
#include <iostream>
#include <cuda_runtime.h>

#include "cuda_library.h"

// CUDA kernel to initialize data
__global__ void initializeDataKernel(float *data, int numElements) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < numElements) {
        data[idx] = static_cast<float>(idx);
    }
}

// Function to initialize data using CUDA
void initializeData(float *data, int numElements) {
    // Allocate device memory
    float *d_data;
    cudaMalloc((void**)&d_data, numElements * sizeof(float));

    // Launch the CUDA kernel to initialize data
    int threadsPerBlock = 256;
    int numBlocks = (numElements + threadsPerBlock - 1) / threadsPerBlock;
    initializeDataKernel<<<numBlocks, threadsPerBlock>>>(d_data, numElements);

    // Copy data from device to host
    cudaMemcpy(data, d_data, numElements * sizeof(float), cudaMemcpyDeviceToHost);

    // Free device memory
    cudaFree(d_data);
}