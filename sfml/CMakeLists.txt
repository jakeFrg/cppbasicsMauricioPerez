cmake_minimum_required(VERSION 3.22)

project(sfml-download NONE)

include(ExternalProject)

ExternalProject_Add(
        sfml
        SOURCE_DIR "C:/Users/B760M/CLionProjects/C++ Basics/sfml/sfml-src"
        BINARY_DIR "C:/Users/B760M/CLionProjects/C++ Basics/sfml/sfml-build"
        GIT_REPOSITORY
            https://github.com/SFML/SFML.git
        GIT_TAG
            2.6.1
        CONFIGURE_COMMAND ""
        BUILD_COMMAND ""
        INSTALL_COMMAND ""
        TEST_COMMAND ""
)
