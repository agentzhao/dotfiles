# Functions

# C/C++ compile and run
cpprun() {
    echo "Compiling file..."
    g++ -o "$1" "$1.cpp"
    echo "Compiled! Enter input :D"
    ./"$1"
}

crun() {
    echo "Compiling file..."
    gcc -o "$1" "$1.c"
    echo "Compiled! Enter input :D"
    ./"$1"
}
