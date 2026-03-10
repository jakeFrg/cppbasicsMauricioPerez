## Sobre los tipos de variables en C++

Antes de avanzar, necesitamos hacer algunas observaciones teóricas sobre el lenguaje C++.

C++ es un [lenguaje de tipado estático](https://en.wikipedia.org/wiki/Type_system).
Esto significa que cada variable en este lenguaje tiene un tipo fijo, que debería conocerse estáticamente, es decir, antes de que se ejecute el programa. El tipo de la variable determina el conjunto de valores que puede tomar y el conjunto de operaciones que se pueden realizar sobre esta variable.

En C++, todas las variables deben ser [*declaradas*](https://en.cppreference.com/w/cpp/language/declarations#Simple_declaration) antes de poder ser usadas. La declaración de una variable debe especificar su *tipo* y *nombre*. Por ejemplo, el siguiente fragmento de código declara una variable de tipo `std::string` con el nombre `x`.

```c++
std::string x;
```

Al momento de la declaración, cada variable puede ser [*inicializada*](https://en.cppreference.com/w/cpp/language/initialization) con algún valor de un tipo adecuado. Por ejemplo, el siguiente fragmento de código inicializa una variable de tipo int con el valor `42`.

```c++
int x = 42;
```

Si la variable no está inicializada, entonces su valor antes del punto de su primera asignación es *indefinido*. Las variables no inicializadas son errores desagradables (también conocidos como *bugs*) en los programas. Por lo tanto, es muy **importante** **siempre** activar variables (puede haber algunas raras excepciones a esta regla, que no vamos a discutir ahora).

```c++
// x está inicializada, ¡buena práctica!
int x = 0;
// y no está inicializada, ¡mala práctica!
int y;
// debido a que el valor de y es indefinido,
// z puede ser cualquier cosa: 0, -1000, 745912, ...
int z = y;
```

Puedes intentar ejecutar el programa adjunto a esta tarea en la [configuración de release](https://www.jetbrains.com/clion/features/run-and-debug.html) múltiples veces para ver que el valor de la variable `z` puede cambiar entre invocaciones.

Dicho esto, también debemos notar que las variables de algunos tipos están en realidad inicializadas por defecto a un valor predefinido. Un ejemplo de este tipo es `std::string`.
Las variables de este tipo se inicializan con una cadena vacía `""` automáticamente al momento de la declaración, y, por lo tanto, no requieren inicialización manual, excepto si deseas activarlas con algún otro valor.

Aprenderemos más sobre los tipos en C++ más adelante en este curso.
Por ahora, necesitarás recordar algunos tipos básicos con los que trabajaremos en las siguientes lecciones.

| Tipo          | Descripción                                                | Ejemplo de valores      | Inicializado |
|---------------|------------------------------------------------------------|-------------------------|--------------|
| `int`         | números enteros                                            | `0`, `1`, `123`, `-20`  | No           |
| `float`       | números de punto flotante                                  | `0.1`, `3.14`, `1.7e10` | No           |
| `bool`        | valores booleanos                                          | `true`, `false`         | No           |
| `char`        | caracteres en [ASCII](https://en.wikipedia.org/wiki/ASCII) | `'a'`, `'b'`, `'1'`     | No           |
| `std::string` | cadenas                                                    | `"hello"`, `"C++"`      | Sí: `""`     |