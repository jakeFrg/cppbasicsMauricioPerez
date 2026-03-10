Además de la declaración de bucle `for`, C++ también proporciona la [declaración de bucle `while`](https://en.cppreference.com/w/cpp/language/while) y la [declaración de bucle `do-while`](https://en.cppreference.com/w/cpp/language/do).

```c++
int x = 3;
while (x > 0) {
    std::cout << x << " ";
    --x;
}
std::cout << "...";
// imprime "3 2 1 ..." 
```

El bucle `while` consiste en una expresión condicional y el cuerpo del bucle. El cuerpo de la declaración de bucle `while` se ejecuta mientras la expresión condicional se evalúe como `true`. Tenga en cuenta que el cuerpo puede no ejecutarse ni siquiera una vez si la condición se evalúa como `false` desde el principio. Si necesita que el cuerpo se ejecute al menos una vez, utilice la declaración de bucle `do-while`.

```c++
int x = 3;
do {
    std::cout << x << " ";
    --x;
} while (x > 0);
std::cout << "...";
// imprime "3 2 1 ..." 
```

Aquí hay algunas recomendaciones generales sobre qué tipo de declaración de bucle utilizar.

* Prefiera el bucle `for` si necesita iterar sobre un arreglo u otra colección de elementos.
* Prefiera el bucle `while` si necesita repetir la ejecución de algún bloque de código hasta que se cumpla una cierta condición. Si además quiere asegurarse de que este bloque de código se ejecute al menos una vez, entonces utilice el bucle `do-while`.

Por ejemplo, el bucle `while` o `do-while` se usa comúnmente en aplicaciones interactivas para implementar el llamado "bucle principal" de la aplicación. En este caso, en cada iteración del bucle, el programa lee la entrada del usuario y luego llama a alguna función para manejar los datos proporcionados por el usuario hasta que el usuario indique cerrar la aplicación.

```c++
// Aplicación DoNothing.
// Lee la entrada del usuario y no hace nada con ella
// a menos que el usuario pase la cadena "exit" para terminar la aplicación.
std::string input;
do {
    std::cin >> input;
} while (input != "exit");
```