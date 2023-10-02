#include <iostream>
#include "cuda_matrix.h"

void init_device_matrix () {
    Matrix<unsigned int> UMAT(23, 42);

    std::cout << UMAT << "\n";
    Matrix<unsigned int> DMAT(45, 12);

    std::cout << DMAT << "\n";
    return;
}
