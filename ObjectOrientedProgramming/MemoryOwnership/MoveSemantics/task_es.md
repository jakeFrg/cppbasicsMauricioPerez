[Semántica de movimiento](https://en.cppreference.com/w/cpp/language/move_constructor) es una característica de C++ que permite transferir eficientemente la propiedad de un objeto sin copiarlo. Esto puede ser útil para mejorar el rendimiento y evitar asignaciones de memoria innecesarias. Antes de adentrarnos en los detalles de la semántica de movimiento, entendamos brevemente el concepto de [categorías de valor](https://en.cppreference.com/w/cpp/language/value_category).

* Una expresión __lvalue__ representa un objeto que tiene un nombre o un identificador. Se refiere a algo que existe en memoria y que típicamente persiste más allá de una sola expresión. Usualmente se encuentra en el lado izquierdo de un operador de asignación (`=`), de ahí el nombre __lvalue__.

* Una expresión __rvalue__ representa un valor temporal o desechable. Es usualmente el resultado intermedio de un cálculo que podría no tener una ubicación de memoria con nombre. Normalmente se encuentra en el lado derecho de un operador de asignación (`=`), de ahí el nombre __rvalue__.

Por ejemplo, a continuación, las variables `a`, `b` y `c` son lvalues, mientras que la expresión `a + b` es un rvalue.

```c++
int a = 2;
int b = 3;
int c = a + b;
```

La semántica de movimiento utiliza rvalues, representando objetos temporales u objetos que están a punto de ser destruidos. Cuando otro objeto desea copiar un objeto rvalue que pronto será desechado, en lugar de copiar realmente, el contenido del objeto rvalue puede ser movido.

Por ejemplo, recordemos la clase `int_array`, que tiene un constructor de copia personalizado (ver archivo `include/int_array.hpp`):

```c++
class int_array {
public:
    /* ... */
    int_array(const int_array& other) 
        : data_(new int[other.size_])
        , size_(other.size_) 
    {
        for (size_t i = 0; i < size_; ++i) {
            data_[i] = other.data_[i];
        }
    };
    /* ... */
private:
    int* data_;
    size_t size_;
};
```

Supongamos que hay una función que crea un arreglo lleno con un valor dado:

```c++
int_array create_array(int value, size_t size) {
    if (size == 0) {
        return int_array();
    }
    int_array array = int_array(size);
    for (size_t i = 0; i < size; ++i) {
        array[i] = value;
    }
    return array;
}
```

Y luego esta función se llama de la siguiente manera:

```c++
// el constructor de copia se llama aquí (!)
int_array a = create_array(0, 4);
```

En el código anterior, se realiza una copia innecesaria, que copia un arreglo de un objeto devuelto de la función en el nuevo objeto creado.

Sin embargo, dado que el objeto devuelto es en realidad un rvalue temporal que de todos modos será desechado, podemos aprovechar eso y en lugar de copiar el arreglo, simplemente _mover_ el puntero.

Para hacer eso, además del constructor de copia, se puede definir un _constructor de movimiento_, que toma una referencia rvalue, denotada con `&&`, como argumento:

```c++
class int_array {
public:
    /* ... */
    int_array(int_array&& other) 
        : data_(other.data_)
        , size_(other.size_) 
    {
        other.data_ = nullptr;
        other.size_ = 0;
    };
    /* ... */
private:
    int* data_;
    size_t size_;
};
```

Ten en cuenta que, además de copiar el puntero, el constructor de movimiento de la clase `int_array` también deja nulo el puntero en el objeto original pasado por referencia rvalue. Es necesario porque, de lo contrario, una vez que se llame al destructor del objeto original, se desasignaría la memoria a la que apunta el campo `data`. De esta manera, la implementación del constructor de movimiento refleja la transferencia de propiedad que ocurre.

De manera similar al operador de asignación por copia, también se puede definir un operador de asignación por movimiento para una clase:

```c++
class int_array {
public:
    /* ... */
    int_array& operator=(int_array&& other) {
        // ...
    }
    /* ... */
private:
    int *data;
    std::size_t size;
};
```

Con la ayuda del operador de asignación por movimiento y la función estándar especial `std::move`, se puede transferir manualmente la propiedad de un objeto a otro:

```c++
int_array b = create_array(1, 4);
int_array c = create_array(2, 4);
// transferencia de propiedad
b = std::move(c);
```

<div class="hint">

Técnicamente, la función `std::move` convierte un lvalue en una referencia rvalue.

</div>

Una implementación personalizada del operador de asignación por movimiento debe garantizar que después de ser movido, el objeto permanezca en un estado válido, usualmente algún tipo de estado nulo. Esto significa que debería ser posible aún destruir de forma segura el objeto, pero otras operaciones como llamadas a métodos o uso de operadores podrían conducir a un comportamiento indefinido. En general, evita usar un objeto después de que haya sido movido, excepto para asignarle un nuevo valor o destruirlo.

El puntero inteligente `std::unique_ptr` también soporta semánticas de movimiento. Las semánticas de movimiento de esta clase transfieren la propiedad del objeto desde el `std::unique_ptr` fuente al puntero de destino. El `std::unique_ptr` fuente queda entonces en un estado nulo.

```c++
std::unique_ptr<Dog> p1 = std::make_unique<Dog>("Beethoven");
std::unique_ptr<Dog> p2;
// transferir propiedad de p1 a p2.
p2 = std::move(p1);
// p1 está ahora en un estado nulo.
assert(p1 == nullptr);
// p2 ahora es dueño del objeto Dog.
assert(p2 != nullptr);
```