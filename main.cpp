#include <iostream>
#include "cuda_library.h" // Include the header from the CUDA library
#include "cuda_matrix.h"
int main() {
    int numElements = 1000;
    float *data = new float[numElements];

    // Call a function from the CUDA library
    initializeData(data, numElements);

    std::cout << "Data initialized by CUDA library:" << std::endl;
    for (int i = 0; i < numElements; ++i) {
        std::cout << data[i] << " ";
    }
    std::cout << std::endl;

    delete[] data;

    init_device_matrix();

    return 0;
}
