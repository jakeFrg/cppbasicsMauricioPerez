Los adaptadores de contenedores secuenciales en C++ ofrecen una interfaz distinta para los contenedores secuenciales. `std::stack`, `std::queue` y `std::priority_queue` son adaptadores de contenedores que proporcionan comportamientos específicos.

[`std::queue`](https://en.cppreference.com/w/cpp/container/queue) es un adaptador de contenedor que ofrece una estructura de datos de cola con semántica de [Primero en entrar, primero en salir (FIFO)](https://es.wikipedia.org/wiki/FIFO). Los elementos se insertan al final y se eliminan del principio.

[`std::stack`](https://en.cppreference.com/w/cpp/container/stack) es un adaptador de contenedor que ofrece una estructura de datos de pila con semántica de [Último en entrar, primero en salir (LIFO)](https://es.wikipedia.org/wiki/Pila_(estructura_de_datos)). Los elementos se insertan y eliminan solo por el final de la secuencia.

Aquí hay un ejemplo de código que ilustra el uso de `std::stack` y `std::queue`:

```cpp
// Creación y manipulación de una pila
std::stack<int> s;
s.push(1); // s = {1}
s.push(2); // s = {1, 2}
s.pop();   // s = {1}
std::cout << "Cima de la pila: " << s.top() << "\n";

// Creación y manipulación de una cola
std::queue<int> q;
q.push(1); // q = {1}
q.push(2); // q = {1, 2}
q.pop();   // q = {2}
std::cout << "Frente de la cola: " << q.front() << "\n";
```

[`std::priority_queue`](https://en.cppreference.com/w/cpp/container/priority_queue) es un adaptador de contenedor que proporciona una estructura de [cola de prioridad](https://es.wikipedia.org/wiki/Cola_de_prioridad). Los elementos se insertan en un orden arbitrario y se eliminan de acuerdo con su prioridad. La prioridad se define por el parámetro de plantilla `Compare`. El valor predeterminado de `Compare` es `std::less<T>`, que ordena los elementos de forma descendente.

Aquí hay un ejemplo de código que ilustra el uso de `std::priority_queue`:

```cpp
std::priority_queue<int> pq;
pq.push(2); // pq = {1}
pq.push(1); // pq = {2, 1}
pq.push(3); // pq = {3, 2, 1}
pq.pop();   // pq = {2, 1}
std::cout << "Cima de la cola de prioridad: " << pq.top() << "\n"; // Salida: 2

std::priority_queue<int, std::vector<int>, std::greater<int>> pq; // el comparador es std::greater<int>
pq.push(2); // pq = {2}
pq.push(1); // pq = {1, 2}
pq.push(3); // pq = {1, 2, 3}
pq.pop();   // pq = {2, 3}
std::cout << "Cima de la cola de prioridad: " << pq.top() << "\n"; // Salida: 2
```

Como práctica, implementará un editor de texto sencillo que soporte las siguientes operaciones:
- `insert(w, pos)` - agrega la cadena `w` al texto en la posición `pos`
- `erase(pos, len)` - elimina `len` caracteres del texto comenzando en la posición `pos`
- `undo()` - deshace la última operación (ya sea `append` o `delete`)
- `redo()` - rehace la última operación que fue deshecha

La clase `TextEditor` está definida en `/include/textEditor.h`.