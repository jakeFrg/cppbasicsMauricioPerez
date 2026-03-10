Implementa una función para concatenar dos cadenas estilo C:

```c++
char* concat(const char* fst, const char* snd); 
```

Esta función debe asignar una cantidad suficiente de memoria
y copiar el contenido de dos cadenas, colocando el carácter nulo `\0`
al final de la cadena resultante.
Puedes suponer que solo se pasarán punteros no nulos a `concat`.

Aquí tienes un ejemplo del uso de `concat`:

```c++
const char* hello = "Hello ";
const char* world = "World!";
const char* helloWorld = concat(hello, world);
// debería imprimir "Hello World!" 
std::cout << helloWorld << "\n";
```

<div class="hint">

Nota que en la biblioteca estándar de C, hay una función similar:

```c++
char* strcat(char* dest, const char* src);
```

Sin embargo, a diferencia de la función `concat` que necesitas implementar,
la función `strcat` no asigna por sí misma memoria para la
cadena concatenada. En su lugar, espera que la cadena `dest`,
pasada como primer argumento, tenga una cantidad suficiente
de memoria asignada para almacenar el resultado.
Luego almacena el resultado en `dest`, modificando así
la cadena original pasada como argumento.

</div>