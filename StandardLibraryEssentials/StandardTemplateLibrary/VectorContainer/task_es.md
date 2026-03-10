En C++, [`std::vector`](https://en.cppreference.com/w/cpp/container/vector) funciona como un arreglo dinámico. Es uno de los contenedores más populares porque combina las ventajas de un arreglo (acceso aleatorio rápido) con el redimensionamiento dinámico. Al utilizar la gestión automática de memoria, proporciona una excelente alternativa al arreglo convencional. Elimina preocupaciones sobre fugas de memoria, y sus métodos son más cómodos de utilizar.

`std::vector` es un contenedor secuencial y, además del tamaño, tiene también un parámetro de capacidad. La capacidad del contenedor es el número de elementos que puede almacenar sin requerir más memoria. La capacidad siempre es igual o mayor que el tamaño del contenedor. Cuando agregas elementos al vector y la capacidad actual no es suficiente para almacenarlos, tu programa creará un vector más grande para estos elementos. Se reserva un nuevo arreglo con mayor capacidad, se copian los elementos del arreglo antiguo al nuevo y luego se libera el arreglo antiguo. La cantidad de memoria que se reservará depende de la implementación, pero usualmente depende del tamaño actual, creciendo exponencialmente. Por esta razón, operaciones como `push_back()` se realizan en [tiempo constante amortizado](https://es.wikipedia.org/wiki/An%C3%A1lisis_amortizado).

Para evitar la reserva y liberación dinámica de memoria, puedes utilizar el método `reserve()`, que reserva espacio para un número específico de elementos. Cuando sabes el tamaño máximo de antemano, este método puede mejorar significativamente el rendimiento de tu programa.

Puedes crear un vector de cualquier tipo. Por ejemplo, `std::vector<int>` es un vector de enteros, `std::vector<std::string>` es un vector de cadenas de texto y `std::vector<std::vector<int>>` es un vector de vectores de enteros (también conocido como un arreglo bidimensional).

En comparación con un arreglo convencional, un vector proporciona funcionalidades que permiten acceder a los elementos de manera segura. El método `at()` se puede utilizar para acceder a los elementos del vector. Realiza la comprobación de límites y lanza una excepción si el índice está fuera del rango. Sin embargo, cabe destacar que el `operator[]`, que no realiza comprobación de límites, es el más utilizado, ya que es más rápido que `at()` y se ajusta a la funcionalidad de otros contenedores.

Cuando creas un vector y no especificas los valores de los elementos, estos se inicializan con un valor por defecto. Por ejemplo, `std::vector<int> v(3)` crea un vector de tres enteros, cada uno inicializado en cero. También puedes especificar un valor inicial. Por ejemplo, `std::vector<int> v(3, 1)` crea un vector de tres enteros, cada uno inicializado en uno.

Un vector puede construirse de diversas maneras:

```cpp
// Vector vacío
std::vector<int> v1;

// Agregar elementos uno a uno
v1.push_back(1);
v1.push_back(2);
v1.push_back(3);
// v1 = {1, 2, 3}

// Crear un vector con un tamaño dado e inicializando todos los elementos con un valor dado
std::vector<int> v2(3, 1); // v2 = {1, 1, 1}

// Crear un vector a partir de un arreglo existente
int a[] = {1, 2, 3};
std::vector<int> v3(a, a + 3); // v3 = {1, 2, 3}

// Crear un vector utilizando una lista de inicialización
std::vector<int> v4 = {1, 2, 3}; // v4 = {1, 2, 3}

// Crear un vector con un tamaño dado; todos los elementos se inicializan con el valor por defecto
std::vector<int> v5(3); // v5 = {0, 0, 0}
```

Los métodos más habituales de `std::vector` incluyen:
 - `size()` devuelve el número de elementos en el vector.
 - `capacity()` devuelve la capacidad del vector.
 - `empty()` comprueba si el vector está vacío.
 - `clear()` elimina todos los elementos del vector.
 - `push_back(x)` agrega un elemento al final del vector.
 - `emplace_back(x)` construye un elemento en su lugar al final del vector. Es más rápido que `push_back()` porque evita operaciones de copia y movimiento, pero solo puede usarse si el elemento aún no ha sido construido.
 - `pop_back()` elimina el último elemento del vector.
 - `resize(x)` cambia el tamaño del vector. Si aumentas el tamaño del vector, los nuevos elementos se inicializarán con un valor dado (0 por defecto). Si reduces el tamaño del vector, todos los elementos después del nuevo tamaño serán eliminados.
 - `swap(a, b)` intercambia el contenido de dos vectores.
 - `front()` y `back()` devuelven el primer y el último elemento del vector, respectivamente.

Además, un vector permite insertar y eliminar elementos en cualquier posición. Los métodos son los siguientes:
- `insert()` inserta un solo elemento o un rango de elementos en el vector. Es relativamente lento porque debe mover todos los elementos posteriores al punto de inserción, lo que implica complejidad lineal.
- `erase()` elimina un solo elemento o un rango de elementos del vector. Funciona de forma similar a `insert()`, por lo que es conveniente pensar detenidamente antes de utilizarlo.

En el caso de `std::vector`, así como en todos los demás contenedores que pueden contener un gran número de elementos, generalmente es mejor pasarlo por referencia al pasarlo a una función. Si no se pasa por referencia, el vector se copiará. Esto es importante cuando tienes muchos elementos en el contenedor, ya que copiarlos puede consumir mucho tiempo.
```cpp
void print(const std::vector<int>& v) {
    for (int i = 0; i < v.size(); ++i) {
        std::cout << v[i] << ' ';
    }
    std::cout << '\n';
}
```
Cabe señalar que esto no aplica en todas las situaciones. Si vas a modificar el contenedor, puedes pasarlo por valor (de esta manera, quien llama a la función no verá los cambios) o por referencia no constante (para modificar el contenedor original). Para más información, consulta [este artículo](https://belaycpp.com/2022/02/15/constant-references-are-not-always-your-friends/).

Tu tarea consiste en implementar varias funciones, las cuales deben utilizar los métodos miembros de vector:
 - `create()` debe construir un vector de enteros y reservar una cantidad específica de elementos, que se recibe como parámetro.
 - `fill()` debe rellenar el vector con 10 elementos, en el rango de 1 a 10.
 - `debugPrint()` debe imprimir el tamaño, la capacidad y todos los elementos del vector en la salida estándar. El formato es el siguiente: 
   - `Size: <n>, Capacity: <n>`
   - `Vector: <element1> <element2> ... <elementN>`