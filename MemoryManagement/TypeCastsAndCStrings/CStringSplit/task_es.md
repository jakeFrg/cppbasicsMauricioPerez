Implementa una función que divida la cadena C dada en subcadenas separadas por cualquiera de los caracteres separadores dados:

```c++
size_t split(const char* str, const char* seps, char**& res);
```

Aquí hay un ejemplo del uso de esta función:

```c++
const char* str = "Hello, World!";
const char** res = nullptr;
size_t size = split(str, " ,!", res);
// debería imprimir 2
std::cout << size << "\n";
// debería imprimir "Hello"
std::cout << res[0] << "\n";
// debería imprimir "World"
std::cout << res[1] << "\n";
```

Esta función toma tres argumentos. El primer argumento, `str`, es la cadena que necesita ser dividida. El segundo, `seps`, es una cadena que consiste en caracteres separadores. El tercer argumento, `res`, es una referencia a un puntero al arreglo resultante de cadenas, donde la función debe almacenar el puntero al arreglo. Finalmente, la función debe devolver el tamaño del arreglo resultante, es decir, el número de subcadenas divididas.

Si la cadena original contiene varios caracteres separadores consecutivos, deben ser omitidos todos. Es decir, la función no debe agregar subcadenas vacías que ocurran "entre" caracteres separadores consecutivos al resultado.

Si no hay subcadenas, la función debe devolver `0` y almacenar `nullptr` en el argumento `res`.

De lo contrario, la función debe asignar una cantidad suficiente de memoria para almacenar tanto el arreglo resultante como todas las subcadenas. Cada subcadena debe ser asignada por separado. Volviendo al ejemplo anterior, el usuario debería poder liberar la memoria asignada por la función de la siguiente manera:

```c++
free(res[0]);
free(res[1]);
free(res);
```

<div class="hint">

Para implementar `split`, puede encontrar útiles las siguientes funciones de la biblioteca estándar:

- [`strpbrk`](https://en.cppreference.com/w/cpp/string/byte/strpbrk) --- busca la primera aparición del carácter separador en la cadena dada;
- [`strspn`](https://en.cppreference.com/w/cpp/string/byte/strspn) --- devuelve el tamaño de una subcadena de la cadena dada, compuesta solo por los caracteres separadores;
- [https://en.cppreference.com/w/cpp/string/byte/strncpy](https://en.cppreference.com/w/cpp/string/byte/strncpy) --- copia un cierto número de caracteres de una cadena a otra.

```c++
const char* str = "Hello, World!";
// devuelve ", World!" --- puntero (str + 5)
const char* substr = strpbrk(str, " ,!");
// devuelve 2
strspn(substr, " ,!");
// copia la subcadena "Hello"
char hello[6] = { 0 };
strncpy(hello, str, 5);
```

</div>