Considere la declaración de varias variables a continuación:

```c++
int a = 0;
double e = 2.71828;
int* p = (int*) malloc(8 * sizeof(int));
```

Elija declaraciones de conversión de tipo válidas
que puedan ser compiladas con éxito sin errores:

```c++
// (1)
double x = static_cast<double>(a);

// (2)
int b = e;

// (3)
int b = (int) e;

// (4)
char* q = static_cast<char*>(p);

// (5)
char* r = reinterpret_cast<char*>(p);

// (6)
std::intptr_t c = reinterpret_cast<std::intptr_t>(p);
```

<div class="hint">

`std::intptr_t` es un tipo especial de entero con signo que está 
garantizado para tener el mismo tamaño que el tamaño del tipo de puntero.

</div>