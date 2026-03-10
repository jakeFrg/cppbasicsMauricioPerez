Para mitigar los riesgos potenciales asociados con los castings de estilo C, C++ introduce varios primitivos de casting que implementan verificaciones de seguridad adicionales. A diferencia del operador de casting de tipo de estilo C, cada operador de casting de C++ tiene su propio escenario de uso y su uso ayuda a comunicar de manera explícita la intención del programador en el código.

Hay cuatro diferentes operadores de casting de tipo en C++:

- `static_cast`
- `reinterpret_cast`
- `const_cast`
- `dynamic_cast`

En esta lección, cubriremos los dos primeros, y los dos últimos operadores se discutirán más adelante en este curso.

El [operador](https://en.cppreference.com/w/cpp/language/static_cast) `static_cast` puede realizar una secuencia de _conversiones de tipo implícitas y definidas por el usuario_, verificando la seguridad de la conversión realizada e informando de errores en tiempo de compilación. Por ejemplo, `static_cast` se puede usar para convertir un `double` a un `int`.

```c++
double pi = 3.14;
int a = static_cast<int>(pi);
// imprime 3
std::cout << a << "\n";
```

En C++, generalmente se recomienda usar `static_cast`, incluso cuando la conversión de tipo se puede realizar implícitamente (como en el fragmento de código anterior). La claridad de `static_cast` ayuda a buscar fácilmente en la base de código todas las conversiones de tipo y a marcar las partes del código potencialmente propensas a errores (ya que las conversiones de tipo siempre son complicadas y propensas a errores).

Un ejemplo de una conversión _definida por el usuario_ es la conversión entre un `enum` definido por el usuario y `int`.

```c++
enum Color { RED, GREEN, BLUE };
int red_code    = static_cast<int>(RED);
int green_code  = static_cast<int>(GREEN);
int blue_code   = static_cast<int>(BLUE);
// imprime 0, 1, 2
std::cout << red_code << ", " << green_code << ", " << blue_code << "\n";
```

Descubriremos más ejemplos de conversiones definidas por el usuario a lo largo del curso.

No todas las conversiones de tipo están permitidas por `static_cast`. Por ejemplo, no se puede usar para convertir el tipo apuntado de tipos puntero, como demuestra el siguiente ejemplo:

```c++
void*  q = malloc(2 * sizeof(int));
// se permite el casting de void* a int*
int*  qi = static_cast<int*> (q);
// se prohíbe el casting entre tipos de puntero que no son void,
// la siguiente línea produce un error de compilación
char* qc = static_cast<char*>(qi);
```

Otro operador, el [operador de casting de tipo](https://en.cppreference.com/w/cpp/language/reinterpret_cast) `reinterpret_cast`, está diseñado precisamente para tales escenarios.

```c++
// se permite el casting entre tipos de puntero que no son void
// con reinterpret_cast
char* qr = reinterpret_cast<char*>(qi);
```

`reinterpret_cast` no cambia los valores apuntados, sino que proporciona una "vista diferente" de una determinada región de memoria. Básicamente, permite reinterpretar el tipo de la región de memoria apuntada.

Ten en cuenta que, al igual que los castings de estilo C, `reinterpret_cast` no implementa verificaciones de seguridad. Por lo tanto, es fácil entrar en territorio de comportamiento indefinido.

```c++
void* r = malloc(2);
int* ri = reinterpret_cast<int*>(r);
// ¡comportamiento indefinido, otra vez!
ri[0] = 42;
```

Al igual que en el caso de `static_cast`, el uso de `reinterpret_cast` proporciona una forma de marcar explícitamente todos los castings de tipo potencialmente peligrosos y comunicar claramente las intenciones del autor del código.