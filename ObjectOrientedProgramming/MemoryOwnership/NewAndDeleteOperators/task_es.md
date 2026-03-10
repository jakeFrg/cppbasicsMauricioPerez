Recuerde que en el módulo de `Gestión de Memoria` de este curso, estudiamos las funciones `malloc` y `free`, que se utilizan para asignar y liberar memoria. Como mencionamos, estas funciones implementan la gestión de memoria al estilo C, y C++ tiene sus propias herramientas para gestionar memoria. Finalmente, es hora de conocer estas herramientas.

El operador `new` asigna memoria en el heap para un objeto o un arreglo de objetos:

```cpp
// asigna memoria para un `int` 
int* ptr = new int;
```

El operador `delete` libera la memoria de vuelta al heap:

```cpp
delete ptr;
```

Para asignar un arreglo de un cierto tipo, se utiliza el operador `new[]`:

```cpp
int* array = new int[10];
```

Como siempre, este operador devuelve un puntero al primer elemento del arreglo.

Para liberar un arreglo, se debe usar el operador `delete[]`:

```cpp
delete[] array;
```

¿Cuál es la diferencia entre `malloc/free` y `new/delete`?

La diferencia más importante es que los operadores `new` y `delete` llaman al constructor y destructor, respectivamente. Las funciones `malloc` y `free` no llaman a constructores o destructores; se utilizan únicamente para asignar bloques de memoria en bruto.

Para resaltar la diferencia entre los dos, le pedimos que complete la siguiente tarea. Dada la clase `Book` definida en el archivo `book.hpp`, cree un objeto de esta clase usando la sintaxis `new`/`delete` en la función `newAndDeleteBook`, y luego intente asignar memoria para un objeto usando la sintaxis `malloc`/`free` en la función `mallocAndFreeBook`.