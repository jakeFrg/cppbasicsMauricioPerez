En C++, una clase puede definir un tipo especial de constructor, llamado _constructor de copia_.

Por ejemplo, considere la clase `int_array`, que representa un arreglo de enteros asignado dinámicamente (vea la definición completa de la clase en el archivo `include/int_array.hpp`):

Esta clase tiene dos campos: un puntero al arreglo asignado y su tamaño. También define el constructor por defecto que crea un arreglo vacío, y un constructor personalizado que crea un nuevo arreglo del tamaño dado. El destructor de la clase desasigna el arreglo.

<div class="hint">
    Note que no verificamos si hay un puntero nulo en el destructor, ya que eliminar un `nullptr` es una operación segura que no tiene efecto.
</div>

Para trabajar eficazmente con un arreglo, la clase también define un método `size()` para consultar el tamaño del arreglo, sobrecarga los operadores de subíndice de arreglo para proporcionar acceso al arreglo subyacente, y sobrecarga el operador de impresión para mostrar el contenido del arreglo.

<div class="hint">

Tenga en cuenta que hay dos sobrecargas del operador de subíndice de arreglo: una para un arreglo mutable y otra para un arreglo inmutable. 

</div>

Ahora, supongamos que un usuario de esta clase ha creado un arreglo:

```c++
int_array a = int_array(10);
for (size_t i = 0; i < a.size(); ++i) {
    a[i] = (int) i + 1;
}
```

Quizás quiera crear una copia de este arreglo. Por supuesto, uno puede hacerlo manualmente creando un arreglo de tamaño adecuado y asignando elementos en un bucle.

Sin embargo, C++ proporciona una forma más conveniente de hacer esto, definiendo un _constructor de copia_ especial:

```c++
int_array(const int_array& other)
    : data_(new int[other.size_])
    , size_(other.size_)
{   
    for (size_t i = 0; i < size_; ++i) {
        data_[i] = other.data_[i];
    }
};
```

Ahora, el usuario de la clase puede crear una copia de la manera más simple posible: 

```c++
int_array b(a);
```

Otro posible caso de uso: dado dos arreglos existentes, un usuario podría querer reasignar uno de ellos, copiando los elementos del otro. ¡El lenguaje C++ tiene una herramienta para eso también! Se llama _operador de asignación por copia_, que se puede declarar de la siguiente manera:

```c++
int_array& operator=(const int_array& other) {
    if (this == &other) {
        return *this;
    }
    delete[] data_;
    data_ = new int[other.size_];
    size_ = other.size_;
    for (size_t i = 0; i < size_; ++i) {
        data_[i] = other.data_[i];
    }
    return *this;
}
```

<div class="hint">

La primera declaración `if` en la implementación del operador maneja el caso de autoasignación — en este caso, el método simplemente retorna.

</div>

<div class="hint">

Tenga en cuenta que el operador de asignación devuelve una referencia `int_array&` al objeto mismo como resultado. Se requiere para soportar la sintaxis de asignaciones múltiples, _e.g._:

```c++
a = b = c;
```

</div>

El operador de asignación por copia puede usarse de la siguiente manera:

```c++
int_array c = int_array(4);
for (size_t i = 0; i < a.size(); ++i) {
    c[i] = 0;
}
// reasignar c
c = a;
```

<div class="hint">

Tenga en cuenta que cuando se usa la siguiente sintaxis:

```c++
int_array b = a;
```

¡Se llamará al constructor de copia, no al operador de asignación!

</div>