Concluyendo la presentación del modelo de propiedad en el lenguaje C++, necesitamos discutir varios conceptos e idiosincrasias esenciales.

[_Adquisición de Recursos es Inicialización_](https://en.cppreference.com/w/cpp/language/raii), o simplemente __RAII__, es una técnica de programación que implica vincular un recurso (como un bloque de memoria asignado dinámicamente, un archivo abierto, una conexión de red, _etc._) a la duración de vida de un objeto. Según esta idiosincrasia:

1. el constructor de la clase debe asignar e inicializar todos los recursos que el objeto poseerá durante su vida útil;
2. el constructor de copia y el operador de asignación por copia de la clase deben copiar el recurso; si el recurso no es copiable, entonces este constructor debe ser eliminado;
3. el constructor de movimiento y el operador de asignación por movimiento de la clase deben transferir la propiedad del recurso;
4. el destructor de la clase debe liberar todos los recursos que el objeto posee.

La [**Regla de cinco**](https://en.cppreference.com/w/cpp/language/rule_of_three) es un concepto relacionado; establece que si una clase requiere un

1. destructor personalizado
2. constructor de copia
3. operador de asignación por copia
4. constructor de movimiento
5. operador de asignación por movimiento

entonces, realmente requiere los cinco.

Tenga en cuenta que si su clase no define ninguno de estos métodos, el compilador generará implementaciones predeterminadas para ellos:

* el constructor/asignación de copia predeterminado realiza una copia superficial del objeto, invocando el constructor/asignación de copia de sus campos miembro;
* el constructor/asignación de movimiento predeterminado realiza un movimiento superficial de los miembros de la clase, invocando el constructor/asignación de movimiento de sus campos miembro;
* además, si no hay un constructor personalizado, el constructor predeterminado se genera automáticamente — inicia todos los campos miembro con sus valores predeterminados.

Uno puede forzar la generación de implementaciones predeterminadas usando la sintaxis `= default`:

```c++
class X {
public:
    X() = default;
    X(const X&) = default;
    X(X&&) = default;
    
    X& operator=(const X&) = default;
    X& operator=(X&&) = default;
    /* ... */
};
```

Esto puede ser útil cuando ha definido una implementación personalizada para uno de los métodos "cinco", pero aún quiere usar la implementación predeterminada para los demás.

Por otro lado, puede querer prohibir explícitamente la generación automática de cualquiera de estos métodos, usando la sintaxis `= delete`:

```c++
class X {
public:
    X() = delete;
    X(const X&) = delete;
    X(X&&) = delete;
    
    X& operator=(const X&) = delete;
    X& operator=(X&&) = delete;    
    /* ... */
};
```

Por ejemplo, esto puede ser útil en casos donde la clase no debe ser copiable. En tal escenario, puede definir el constructor de movimiento y el operador de asignación, pero eliminar el constructor de copia y el operador de asignación por copia.

<div class="hint">

Antes de la llegada de la [edición C++11](https://en.cppreference.com/w/cpp/11) del lenguaje, la regla de cinco se conocía como la _regla de tres_. Esto se debe a que antes de C++11, el lenguaje no tenía la característica de semántica de movimiento, por lo que no era posible definir el constructor de movimiento y el operador de asignación por movimiento.

</div>

Revisemos la clase `int_array` para ver cómo se ajusta a RAII y la regla de cinco (ver la definición completa de la clase en el archivo `include/int_array.hpp`). Esta clase gestiona un recurso — un array dinámicamente asignado de enteros. El ciclo de vida de este array está ligado a la duración de vida del objeto `int_array`.

El constructor predeterminado crea un array vacío:

```c++
int_array()
    : data_(nullptr)
    , size_(0)
{};
```

Otra manera de ver el constructor predeterminado es que crea un array en un estado especial "vacío" — este punto de vista será útil más adelante.

Otro constructor de la clase crea un array del tamaño dado al realmente asignar la memoria para ello:

```c++
explicit int_array(std::size_t size)
    : data_(new int[size])
    , size_(size)
{};
```

Así, el destructor tiene que desalojar esta memoria:

```c++
~int_array() {
    delete[] data_;
}
```

Ahora, la regla de cinco dicta que la clase también debe definir constructores de copia y movimiento personalizados, así como operadores de asignación por copia y por movimiento. Ya hemos visto estos constructores en lecciones anteriores:

```c++
int_array(const int_array& other)
        : data_(new int[other.size_])
        , size_(other.size_)
    {
        for (size_t i = 0; i < size_; ++i) {
            data_[i] = other.data_[i];
        }
    };

int_array(int_array&& other)
    : data_(other.data_)
    , size_(other.size_)
{
    other.data_ = nullptr;
    other.size_ = 0;
};
```

Observa cómo el constructor de movimiento restablece el objeto argumento a un estado "vacío". Llamar al destructor en este objeto "vacío" más tarde, esencialmente no tendrá efecto. Con razón, ya que la propiedad del recurso ha sido transferida al nuevo objeto.

A continuación, necesitamos definir los operadores de asignación. Para evitar la duplicación de código entre el constructor de copia y el operador de asignación por copia (y de forma similar, entre el constructor de movimiento y el operador de asignación por movimiento), es posible usar otro truco ingenioso llamado el [**Idiom de Copiar-y-Intercambiar**](https://en.wikibooks.org/wiki/More_C%2B%2B_Idioms/Copy-and-swap).

Con la ayuda de este idiosincrasia, es suficiente definir solo una versión del operador de asignación, el cual debe tomar el argumento por valor:

```c++
int_array& operator=(int_array other) {
    swap(other);
    return *this;
}
```

Dependiendo de si el operador se llama con un lvalue (tomado como `const int_array&`) o un rvalue (tomado como `int_array&&`) como argumento, el constructor de copia o el constructor de movimiento creará una copia local (`int_array`) de los datos en la variable `other`. Luego, con la ayuda de la función swap (ver definición abajo), el operador de asignación intercambia los datos del objeto actual con los de la copia local. La copia local temporal se destruye posteriormente, liberando los datos antiguos en el proceso.

La función `swap` realiza un intercambio de datos entre dos objetos, con la ayuda de la función estándar `std::swap`, que es capaz de intercambiar variables de tipos primitivos:

```c++
void swap(int_array& other) {
    std::swap(data_, other.data_);
    std::swap(size_, other.size_);
}
```

De esta manera, la clase `int_array` implementa el principio _RAII_, siguiendo la _regla de cinco_ y la idiosincrasia de _copiar-y-intercambiar_.