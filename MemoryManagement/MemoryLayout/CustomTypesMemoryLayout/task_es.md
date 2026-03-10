A continuación, vamos a discutir la disposición de memoria de tipos personalizados definidos por el usuario: enumeraciones y estructuras.

Las enumeraciones se representan internamente simplemente como enteros. 
Considere la siguiente declaración de un tipo de enumeración:

```c++
enum Color {
    RED, GREEN, BLUE
};
```

Ejecute el siguiente código para asegurarse de que los tipos `Color` e `int` ocupan exactamente la misma cantidad de memoria:

```c++
std::cout << sizeof(int) << "\n";
std::cout << sizeof(Color) << "\n";
```

La disposición de memoria de las estructuras es más compleja, 
ya que debe tener en cuenta no solo los tamaños de sus componentes, 
sino también su __alineación__.

La [alineación](https://en.cppreference.com/w/cpp/language/object#Alignment) 
de un tipo es el número de bytes entre direcciones de memoria sucesivas 
donde se pueden asignar variables de este tipo.
La alineación de un tipo se puede consultar utilizando el operador `alignof`,
que devuelve un valor de tipo `size_t`.
Para tipos predefinidos primitivos, como `int` o `double`, 
la alineación generalmente equivale al tamaño del tipo, 
pero esto no siempre es así para todos los tipos.

```c++
std::cout << alignof(int) << "\n";
// imprime 4 en la mayoría de máquinas modernas
std::cout << alignof(double) << "\n";
// imprime 8 en la mayoría de máquinas modernas
```

<div class="hint">

La motivación para introducir el concepto de 
[alineación](https://en.wikipedia.org/wiki/Data_structure_alignment)
en el lenguaje C++ surge de los detalles de bajo nivel 
sobre cómo los procesadores operan típicamente en memoria.
Al escribir o leer datos de, digamos, 4 bytes hacia/desde la memoria,
el procesador espera que la dirección de memoria accedida 
sea un múltiplo de 4, que esté _alineada_ a 4 bytes.
De lo contrario, dicho acceso a memoria se llama _desalineado_.
Dependiendo de la arquitectura concreta del procesador,
los accesos desalineados a memoria pueden ser más lentos o incluso provocar un error.

</div>

La disposición de memoria de estructuras personalizadas tiene en cuenta la alineación de 
los campos individuales. Si es necesario, el compilador inserta _relleno_ 
para alinear correctamente todos los miembros de la estructura.
Considere la siguiente estructura.

```c++
struct Foo {
    int x;
    char a;
    char b;
    int y;
};
```

Suponiendo que `int` ocupa 4 bytes, esta estructura tiene un tamaño de 12 bytes y una alineación de 4 bytes.
Esto se debe a que el compilador inserta 2 bytes de relleno adicionales entre los campos `b` y `y`.

```c++
std::cout << sizeof(Foo) << "\n";
// imprime 12
std::cout << alignof(Foo) << "\n";
// imprime 4
```

Es decir, la representación de memoria interna de la estructura `Foo` es 
equivalente a la representación de memoria de la siguiente estructura:

```c++
struct FooLayout {
    int x;
    char a;
    char b;
    char _padding[2];
    int y;
};
```

Puede verificarlo imprimiendo su tamaño y alineación.

```c++
// imprime 12
std::cout << sizeof(FooLayout) << "\n";
// imprime 4
std::cout << alignof(FooLayout) << "\n";
```

Debido a los requisitos de alineación, dos estructuras 
que tienen el mismo conjunto de campos pero se declaran en un orden diferente
pueden tener tamaños diferentes.

Por ejemplo, considere la siguiente estructura llamada `Bar`:

```c++
struct Bar {
    int x;
    char a;
    int y;
    char b;
};
```

A diferencia de la estructura `Foo`, tiene un tamaño de 16 bytes.

```c++
// imprime 16
std::cout << sizeof(Bar) << "\n";
// imprime 4
std::cout << alignof(Bar) << "\n";
```

Dado un puntero a una estructura, puede acceder a sus campos usando el operador de acceso a miembros `->`.
Suponiendo que `p` es el puntero a `Foo` (es decir, `p` tiene el tipo `Foo*`),
las siguientes expresiones tienen el mismo significado:

| Operador              | Notación |
|-----------------------|----------|
| Miembro de estructura | `(*p).x` |
| Miembro de puntero    | `p->x`   |

Para acceder a los campos de una estructura, 
el compilador calcula los desplazamientos de cada campo. 
Por ejemplo, en la estructura `Bar`, los campos tienen los siguientes desplazamientos:
* `x` --- 0 bytes,
* `a` --- 4 bytes, 
* `y` --- 8 bytes,
* `b` --- 12 bytes.

Puede verificar estos desplazamientos de campo 
imprimiendo las direcciones correspondientes de una estructura asignada.

```c++
Bar bar;
std::cout << (void*) &bar << "\n";
std::cout << (void*) &(bar.x) << "\n";
std::cout << (void*) &(bar.a) << "\n";
std::cout << (void*) &(bar.y) << "\n";
std::cout << (void*) &(bar.b) << "\n";
```

Note la parte `(void*)` – es el _operador de conversión de tipo estilo C_.
Hablaremos sobre él más adelante en este curso.
Aquí, lo necesitamos para mostrar variables de tipo `char*`
no como cadenas, sino como direcciones de memoria en su lugar.

Para acceder a un campo de una estructura, es suficiente 
agregar el desplazamiento de ese campo a la dirección de memoria de la estructura.
Una forma confiable y multiplataforma de obtener el desplazamiento de un campo es utilizando el operador `offsetof`:

```c++
// p apunta al comienzo de la memoria ocupada por bar 
char* p = (char*)&bar;
// ahora p apunta a la memoria ocupada por el campo y de bar 
p += offsetof(struct Bar, y);
// conviértelo en un puntero a int
int* pi = (int*) p;
// ahora podemos asignar un valor al campo y
* pi = 42;
// imprime 42
std::cout << bar.y << "\n";
```