Implementa la función `swap`, que toma dos punteros a enteros y intercambia su contenido (es decir, los valores a los que apuntan).

```c++
void swap(int* p, int* q);
```

Encuentra a continuación un ejemplo de uso de `swap`.

```c++
int a = 42;
int b = 23;
swap(&a, &b);
// imprime 23
std::cout << a << "\n";
// imprime 42
std::cout << b << "\n";
```