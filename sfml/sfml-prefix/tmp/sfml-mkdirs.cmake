# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "C:/Users/B760M/CLionProjects/C++ Basics/sfml/sfml-src")
  file(MAKE_DIRECTORY "C:/Users/B760M/CLionProjects/C++ Basics/sfml/sfml-src")
endif()
file(MAKE_DIRECTORY
  "C:/Users/B760M/CLionProjects/C++ Basics/sfml/sfml-build"
  "C:/Users/B760M/CLionProjects/C++ Basics/sfml/sfml-prefix"
  "C:/Users/B760M/CLionProjects/C++ Basics/sfml/sfml-prefix/tmp"
  "C:/Users/B760M/CLionProjects/C++ Basics/sfml/sfml-prefix/src/sfml-stamp"
  "C:/Users/B760M/CLionProjects/C++ Basics/sfml/sfml-prefix/src"
  "C:/Users/B760M/CLionProjects/C++ Basics/sfml/sfml-prefix/src/sfml-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/B760M/CLionProjects/C++ Basics/sfml/sfml-prefix/src/sfml-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/B760M/CLionProjects/C++ Basics/sfml/sfml-prefix/src/sfml-stamp${cfgdir}") # cfgdir has leading slash
endif()
