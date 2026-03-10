Además de `std::vector`, la STL incluye otros contenedores secuenciales. Los contenedores `std::forward_list`, `std::list` y `std::deque` permiten el redimensionamiento dinámico y ofrecen distintos compromisos en términos de rendimiento y funcionalidad.

[`std::forward_list`](https://en.cppreference.com/w/cpp/container/forward_list) es una [lista simplemente enlazada](https://es.wikipedia.org/wiki/Lista_enlazada) que fue introducida en C++11. Consume menos memoria que `std::list` porque solo mantiene un enlace al siguiente elemento, pero solo admite la iteración hacia adelante. Es importante destacar que puedes insertar y eliminar elementos desde cualquier posición de la lista siempre que tengas un iterador al elemento anterior a la posición donde deseas realizar las operaciones.

[`std::list`](https://en.cppreference.com/w/cpp/container/list) es una [lista doblemente enlazada](https://es.wikipedia.org/wiki/Lista_doblemente_enlazada). Permite operaciones de inserción y eliminación en tiempo constante en cualquier posición de la secuencia y soporta la iteración en ambas direcciones. Sin embargo, no proporciona acceso aleatorio rápido, no es [amigable con la caché](https://stackoverflow.com/questions/16699247/what-is-a-cache-friendly-code) debido a la asignación de memoria no contigua y utiliza memoria adicional para almacenar la información de enlace asociada a cada elemento.

[`std::deque`](https://en.cppreference.com/w/cpp/container/deque), también conocida como [cola doblemente terminada](https://es.wikipedia.org/wiki/Cola_doblemente_terminada), es similar a `std::vector` pero permite inserciones y eliminaciones rápidas tanto al principio como al final. A diferencia de `std::vector`, no garantiza que todos sus elementos estén contiguos en memoria, pero sí ofrece acceso aleatorio rápido. Es una estructura de datos muy versátil cuando es necesario modificar ambos extremos de la secuencia con frecuencia.

A continuación se muestra un ejemplo de uso para cada uno de estos contenedores.

```cpp
// Creación y manipulación de una forward_list
std::forward_list<int> fl = {1, 2, 3};
fl.push_front(0); // fl = {0, 1, 2, 3}
//   fl.push_back(4);  Error: push_back no está soportado
fl.pop_front();   // fl = {1, 2, 3}
//   fl.pop_back();    Error: pop_back no está soportado
//   fl[1] = 5;        Error: el operador[] no está soportado
auto second_fl = fl.begin();
fl.insert_after(second_fl, 5); // fl = {1, 5, 2, 3}, complejidad O(1)

// Creación y manipulación de una list
std::list<int> l = {1, 2, 3};
l.push_front(0); // l = {0, 1, 2, 3}
l.push_back(4);  // l = {0, 1, 2, 3, 4}
l.pop_front();   // l = {1, 2, 3, 4}
l.pop_back();    // l = {1, 2, 3}
//    l[1] = 5;        Error: el operador[] no está soportado
auto second_l = std::next(l.begin());
l.insert(second_l, 5); // l = {1, 5, 2, 3}, complejidad O(1)

// Creación y manipulación de un deque
std::deque<int> d = {1, 2, 3};
d.push_front(0); // d = {0, 1, 2, 3}
d.push_back(4);  // d = {0, 1, 2, 3, 4}
d.pop_front();   // d = {1, 2, 3, 4}
d.pop_back();    // d = {1, 2, 3}
d[1] = 5;        // d = {1, 5, 3}
auto second_d = std::next(d.begin());
d.insert(second_d, 0); // d = {1, 0, 5, 3}, complejidad O(n)
```

Los métodos comunes de estos contenedores son:  
 - `push_front(x)` y `push_back(x)` añaden un elemento al inicio y al final del contenedor, respectivamente.
 - `pop_front()` y `pop_back()` eliminan el primer o el último elemento del contenedor, respectivamente.
 - `insert(x)` se utiliza para insertar un solo elemento o un rango de elementos dentro del contenedor. Para forward_list, utiliza `insert_after(x)` en su lugar.
 - `erase(x)` se utiliza para eliminar un solo elemento o un rango de elementos del contenedor. Para forward_list, utiliza `erase_after(x)` en su lugar.
 - `size()` devuelve el número de elementos presentes en el contenedor. Ten en cuenta que `std::forward_list` no ofrece el método `size()`.
 - `empty()` comprueba si el contenedor está vacío.
 - `clear()` elimina todos los elementos del contenedor.

Otro contenedor que merece una mención es [`std::array`](https://en.cppreference.com/w/cpp/container/array). Es un contenedor secuencial que encapsula arreglos de tamaño fijo. Es similar a los arreglos estilo C pero proporciona una interfaz de interacción similar a la de otros contenedores de la STL. Incluye comprobación de límites mediante `at()`, un método `size()`, compatibilidad con muchas funciones que aceptan contenedores como argumento (además, no decae a puntero como podría suceder con los arreglos en C) y soporte de iteradores. Es una excelente alternativa a los arreglos estilo C cuando se conoce el tamaño del arreglo en tiempo de compilación.

```cpp
// Creación e inicialización de un array
std::array<int, 3> a = {1, 2, 3};

// Acceso a los elementos
std::cout << "Primer elemento: " << a.front() << "\n";
std::cout << "Último elemento: " << a.back() << "\n";

// Tamaño del array
std::cout << "Tamaño del array: " << a.size() << "\n";
```

Tu tarea es escribir una función llamada `sum_adjacent_elements`, que reciba una colección de enteros `nums` de tamaño `n` como entrada y devuelva una nueva colección del mismo tipo, de tamaño `n/2`, que contenga las sumas por pares de los elementos en `nums`. Si un elemento no tiene par, no debe copiarse en la nueva colección.
Se te pide implementar la función utilizando tanto `std::list` como `std::deque`.

<div class="hint">
  Recuerda la diferencia entre estos dos contenedores. Dado que `std::deque` permite acceso aleatorio, puedes usar el operador `[]` para acceder a los elementos. Por el contrario, `std::list` no permite acceso aleatorio, por lo que deberás utilizar iteradores para acceder a los elementos.
</div>