En C++, una variable de tipo array se representa internamente como un puntero al primer elemento del array. Por lo tanto, por ejemplo, dada la variable de array `int a[]`, las siguientes expresiones tienen el mismo significado:

| Expresión                            | Notación de array | Notación de puntero |
|--------------------------------------|-------------------|---------------------|
| Inicialización de puntero al array   | `int* p = &a[0]`  | `int* p = a`        |
| Acceso a elemento por índice         | `a[n]`            | `*(a + n)`          |

Dado esto, una función que espera un argumento de array puede ser codificada como una función con dos argumentos:
* un puntero al primer elemento, y
* el tamaño del array.

```c++
void f(int* p, size_t size);
```

En el código C++, también puedes encontrar a menudo codificaciones alternativas. La misma función se puede codificar como una función con dos tipos diferentes de argumentos:
* un puntero al primer elemento, y
* un puntero al __siguiente elemento después del último elemento del array__.

```c++
void g(int* begin, int* end);
```

Dado un array `a` definido de la siguiente manera:

```c++
const size_t SIZE = 10;
int a[SIZE];
```

estas funciones deberían ser llamadas como se muestra a continuación:

```c++
f(a, SIZE);
```

y

```c++
g(a, a + SIZE);
```

Con la segunda codificación, la iteración a través de todos los elementos del array se puede escribir de la siguiente manera:

```c++
for (int* p = begin; p < end; ++p) {
    std::cout << *p << "\n";
}
```

<div class="hint">

Nota que el código anterior no maneja casos donde uno de los punteros es un puntero nulo.

</div>

Este paradigma es comúnmente ubicuo en el código C++. Por lo tanto, es muy importante entender cómo funciona. Puedes comprobar tu comprensión implementando dos funciones:
* `sum_size`, y
* `sum_ptrs`.

Ambas funciones deben realizar el mismo trabajo: calcular la suma de todos los elementos de un array. Sin embargo, la primera función toma como argumentos el puntero al inicio del array y el tamaño del array, mientras que la segunda función toma como argumentos los punteros al inicio y al final del array. Puedes asumir que los punteros pasados a ambas funciones son punteros válidos y no nulos.