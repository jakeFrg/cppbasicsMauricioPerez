#include <iostream>
#include <string>

int main() {
    std::string command;

    while (true) {
        std::cin >> command;

        if (command == "exit") {
            break;
        }

        int n, m;
        std::cin >> n >> m;

        if (command == "sum") {
            std::cout << n + m << std::endl;
        } else if (command == "sub") {
            std::cout << n - m << std::endl;
        } else if (command == "mul") {
            std::cout << n * m << std::endl;
        } else if (command == "div") {
            std::cout << n / m << std::endl;
        } else {
            std::cout << "Sorry, I cannot understand your command" << std::endl;
        }
    }

    return 0;
}