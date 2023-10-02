#pragma once

#include <iostream>
#include <string>
#include <cuda_runtime.h>

template <typename T>
class Matrix {
    private:
        size_t n_rows;
        size_t n_cols;

        T * vals;
    public:
        Matrix(size_t r, size_t c) : n_rows(r), n_cols(c) {
            cudaMalloc((void**)&vals, sizeof(T) * r * c);
        }
        ~Matrix() {
            cudaFree(vals);
        }
        std::string toString() const {
            return "Matrix<" + std::to_string(n_rows) + "," + std::to_string(n_cols) + ")";
        }
        // Overload the << operator to print the object
        friend std::ostream& operator<<(std::ostream& os, const Matrix<T>& obj) {
            os << obj.toString();
            return os;
        }
};

void init_device_matrix();
