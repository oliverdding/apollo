FROM oliverdd/apollo:python

RUN apt-get -y update \
    && apt -y --no-install-recommends install gcc-8 g++-8 clang-tools clangd clang-tidy clang-format clang llvm-dev llvm-runtime llvm lld lldb cmake ninja-build\
    && apt -y clean all
