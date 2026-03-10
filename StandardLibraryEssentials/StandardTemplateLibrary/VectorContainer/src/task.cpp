#include <iostream>
#include <vector>

std::vector<int> create(std::size_t capacity) {
    /* TODO */
}

std::vector<int> fill(std::vector<int>& vec, std::size_t size, int value) {
    /* TODO */
}

void debugPrint(const std::vector<int>& vec) {
    /* TODO */
}

int main() {
    std::vector<int> vec = create(10);
    debugPrint(vec);
    vec = fill(vec, 10, 1);
    debugPrint(vec);
    vec.clear();
    debugPrint(vec);
    return 0;
}