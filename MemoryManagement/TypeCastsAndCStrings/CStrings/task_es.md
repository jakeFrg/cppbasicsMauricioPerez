Ya hemos visto el tipo de C++ utilizado para representar datos textuales: el tipo `std::string`. Como podrías adivinar, C tiene su propia manera de trabajar con datos de texto. En C, una cadena se representa como un puntero al tipo `char`:

```c++
const char* greetings = "Hello World!";
std::cout << greetings << "\n";
```

Nótese que una variable de tipo `char*` no almacena ninguna información sobre la longitud de la cadena. Según una regla del lenguaje C, las cadenas deben terminar con un carácter especial, `\0`, que señala el fin de la cadena. Por lo tanto, la longitud de una cadena se puede calcular iterando sobre sus caracteres hasta encontrar el carácter `\0`. La biblioteca estándar de C proporciona una función para este propósito exacto:

```c++
// imprime 12
std::cout << strlen(greetings) << "\n";
```

Dado que las cadenas al estilo C no almacenan explícitamente la longitud, es responsabilidad del programador llevar la cuenta de esto para evitar errores de desbordamiento de búfer. Por ejemplo, al leer una cadena al estilo C desde la entrada, es importante usar una función especial `getline`, que considera la longitud de la cadena y previene que la memoria sea sobreescrita más allá del final de la cadena:

```c++
const size_t size = 20;
char name[size];
std::cin.getline(name, size);
std::cout << name << "\n";
```

<div class="hint">

Recuerda que internamente, un arreglo de caracteres `char[]` se representa en memoria de la misma manera que el puntero `char*`. Por lo tanto, en el fragmento de código anterior, la variable `name` también se considera una cadena al estilo C.

<\div>

Es posible convertir cadenas al estilo C a cadenas al estilo C++ y viceversa:

```c++
std::string cppString = std::string(greetings);
const char* cString = cppString.c_str();  
```

<div class="hint">

En ambos lenguajes, C y C++, las cadenas definidas dentro del texto del programa (como la frase "Hello World!" arriba) también se llaman [_literales de cadena_](https://en.cppreference.com/w/cpp/language/string_literal) (o _cadenas estáticas_).

Los literales de cadena se almacenan en una región de memoria estática de solo lectura e inmutable. A pesar de eso, el lenguaje C permite almacenar valores de literales de cadena en punteros a memoria no constante:

```c++
// esto es código C válido
char* str = "I am immutable!";
```

Un intento de modificar una cadena estática lleva a un comportamiento indefinido.

```c++
// ¡este código causa comportamiento indefinido!
str[5] = " ";
str[6] = " ";
```

Nótese que el lenguaje C++ requiere declarar el puntero a cadenas estáticas como `const char*`; de lo contrario, el código como el anterior es rechazado con un error de compilación.

La razón por la que C no requiere lo mismo es puramente histórica: el lenguaje C inicialmente no tenía la palabra clave `const` y, por lo tanto, no verificaba las reglas de constancia.

</div>