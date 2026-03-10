Cada variable ocupa cierto espacio en la memoria del programa. La cantidad exacta de espacio que ocupa depende del **tamaño** del tipo de la variable.

En C++, se puede determinar el tamaño de un tipo en [bytes](https://en.wikipedia.org/wiki/Byte) usando el operador `sizeof`.

```c++
std::cout << sizeof(int) << "\n";
```

Tenga en cuenta que el tamaño de algunos tipos predefinidos, como `int`, depende del sistema en el cual se ejecuta el programa.

Cuanto más espacio en memoria ocupa el tipo, más valores distintos pueden representar las variables de este tipo. Por ejemplo, el tipo `int` comúnmente ocupa 4 bytes en la mayoría de las máquinas, y por lo tanto, el rango de valores posibles para este tipo es de `-2,147,483,648` (igual a `-2^31`) a `2,147,483,647` (igual a `2^31-1`). El tipo `long` es otro tipo de valor entero, que usualmente ocupa 8 bytes. Debido a esto, cubre un rango más amplio de valores posibles: de `-9,223,372,036,854,775,808` (igual a `-2^63`) a `9,223,372,036,854,775,807` (igual a `2^63-1`).

Los tipos de valores enteros también pueden declararse como `unsigned`. Este modificador no cambia el tamaño del tipo, pero afecta su rango de valores: los tipos enteros `unsigned` solo pueden tener valores no negativos. Por ejemplo, `unsigned int` tiene un rango de valores de `0` a `4,294,967,295` (igual a `2^32-1`).

C++ también ofrece una serie de tipos predefinidos que garantizan ocupar un espacio fijo en todas las máquinas. Por ejemplo, `std::int8_t` ocupa 8 bits (= 1 byte), `std::int32_t` ocupa 32 bits (= 4 bytes), etc. Para cada tipo de este tipo, existe una versión `unsigned`: por ejemplo, `std::uint8_t`, `std::uint32_t`, etc.

También hay dos tipos específicamente dimensionados para representar números de punto flotante. Ya hemos visto el tipo `float`, que típicamente ocupa 4 bytes en la mayoría de los sistemas modernos. El tipo `double` (abreviatura de número de punto flotante de doble precisión) ocupa el doble de espacio que `float`, usualmente 8 bytes. Es preferible usar el tipo `double` en lugar de `float` siempre que sea posible porque garantiza mejor precisión en la aritmética de punto flotante. En este curso, usamos `float` en algunas tareas solo porque también es usado por la biblioteca gráfica SFML.

El tipo `char`, que se usa para representar un solo carácter en la codificación ASCII, ocupa exactamente 1 byte. Internamente, los valores del tipo `char` se representan simplemente como enteros `unsigned` de 8 bits (1 byte).

Finalmente, el tipo `bool` se usa para representar valores booleanos `true` o `false`. Aunque, en teoría, bastaría con usar solo un bit para representar valores de este tipo, en la práctica, ocupan 1 byte. Esto se debe a que 1 byte es el tamaño de la célula de memoria mínima representable en arquitecturas de computadoras modernas.

A continuación, puede encontrar una tabla que contiene la información sobre los tipos predefinidos comunes: si su tamaño depende de la plataforma, su tamaño exacto o típico, y el rango de valores que representan. También puede ejecutar el programa adjunto a este paso para imprimir los tamaños de estos tipos en el terminal. Por lo tanto, puede verificar si los tamaños de estos tipos en su sistema coinciden con los números dados en la tabla.

| Tipo            | Descripción                                               | ¿Depende de la plataforma? | Tamaño* | Rango de Valores     |
|-----------------|------------------------------------------------------------|----------------------------|---------|---------------------|
| `int`           | números enteros con signo                                  | Sí                         | 4       | -2^31 ... 2^31 - 1  |
| `long`          | números enteros grandes con signo                          | Sí                         | 8       | -2^63 ... 2^63 - 1  |
| `unsigned int`  | números enteros sin signo                                  | Sí                         | 4       | 0 ... 2^32 - 1      |
| `unsigned long` | números enteros grandes sin signo                          | Sí                         | 8       | 0 ... 2^32 - 1      |
| `std::int8_t`   | número entero de 8 bits con signo                          | No                         | 1       | -128 ... 127        |
| `std::int16_t`  | número entero de 16 bits con signo                         | No                         | 2       | -32768 ... 32767    |
| `std::int32_t`  | número entero de 32 bits con signo                         | No                         | 4       | -2^31 ... 2^31 - 1  |
| `std::int64_t`  | número entero de 64 bits con signo                         | No                         | 8       | -2^63 ... 2^63 - 1  |
| `std::uint8_t`  | número entero de 8 bits sin signo                          | No                         | 1       | 0 ... 255           |
| `std::uint16_t` | número entero de 16 bits sin signo                         | No                         | 2       | 0 ... 65535         |
| `std::uint32_t` | número entero de 32 bits sin signo                         | No                         | 4       | 0 ... 2^32 - 1      |
| `std::uint64_t` | número entero de 64 bits sin signo                         | No                         | 8       | 0 ... 2^64 - 1      |
| `float`         | números de punto flotante                                  | Sí                         | 4       | ±3.4+38F            |
| `double`        | números de punto flotante de doble precisión               | Sí                         | 8       | ±1.8E+308           |
| `char`          | caracteres en [ASCII](https://en.wikipedia.org/wiki/ASCII) | No                         | 1       | -128 ... 127        |
| `unsigned char` | caracteres sin signo                                       | No                         | 1       | 0 ... 255           |
| `bool`          | valores booleanos                                          | Sí                         | 1       | false, true         |

*El tamaño se da en bytes; para tipos independientes de la plataforma, se especifica el tamaño exacto, mientras que para tipos dependientes de la plataforma, se da el tamaño típico.