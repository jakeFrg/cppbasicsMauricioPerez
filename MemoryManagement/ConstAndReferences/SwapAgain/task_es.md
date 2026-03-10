Implementa la función `swap` una vez más, pero esta vez,
haz que tome sus argumentos por referencia.

```c++
void swap(int& a, int& b);
```

Un ejemplo de uso:

```c++
int a = 42;
int b = 23;
swap(a, b);
// imprime 23
std::cout << a << "\n";
// imprime 42
std::cout << b << "\n";
```