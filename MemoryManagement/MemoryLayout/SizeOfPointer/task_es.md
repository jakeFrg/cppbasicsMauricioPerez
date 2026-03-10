Recuerda que cada variable ocupa algo de espacio en la memoria del programa, incluidas las variables de tipo puntero. El tamaño de los punteros depende del sistema en el que se ejecuta el programa. Normalmente, en máquinas con un procesador de 32 bits, el tamaño del puntero es igual a 4 bytes, lo que significa que estos sistemas pueden direccionar hasta 4 gigabytes de memoria. En máquinas con un procesador de 64 bits, el tamaño del puntero es igual a 8 bytes, lo que significa que, al menos teóricamente, hay 16 exabytes de memoria direccionable.

Debido a que el tamaño de los punteros puede variar en diferentes sistemas, C++ ofrece dos tipos específicos para trabajar con aritmética de punteros de manera portátil.

El tipo `size_t` está diseñado para almacenar el tamaño de otros tipos en bytes; el resultado del operador `sizeof` es en realidad de tipo `size_t`. Es un tipo de entero __sin signo__, lo que significa que su rango de valores abarca desde `0` hasta el número máximo de celdas de memoria direccionables en la máquina dada.

El tipo `ptrdiff_t` se puede usar para almacenar la diferencia entre dos punteros; el resultado de la expresión de resta de punteros `p - q` es de tipo `ptrdiff_t`. A diferencia de `size_t`, es un tipo de entero __con signo__, lo que significa que su rango de valores incluye valores negativos. Esto es de esperarse, ya que se puede restar un puntero "mayor" `q` de un puntero "menor" `p` y obtener un número negativo como resultado.

El programa adjunto a este paso imprime los tamaños de los tipos `char*`, `size_t` y `ptrdiff_t` en la terminal.

| Tipo        | Descripción                                    | ¿Dependiente de la plataforma? | Tamaño*         | Con/Sin signo |
|-------------|-----------------------------------------------|-------------------------------|-----------------|---------------|
| `char*`     | tipo de puntero                               | Sí                            | 4 (x32), 8 (x64) | -             |
| `size_t`    | tipo para almacenar tamaño de tipos           | Sí                            | 4 (x32), 8 (x64) | Sin signo     |
| `ptrdiff_t` | tipo para almacenar diferencia entre punteros | Sí                            | 4 (x32), 8 (x64) | Con signo     |

*El tamaño se da en bytes; para tipos independientes de la plataforma, se especifica el tamaño exacto, mientras que para tipos dependientes de la plataforma, se da el tamaño típico.