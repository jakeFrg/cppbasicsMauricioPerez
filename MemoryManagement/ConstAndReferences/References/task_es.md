Ya hemos visto que C++ permite a los programadores manipular las direcciones de las variables a través de punteros. El lenguaje también ofrece otro elemento primitivo para manipular variables indirectamente, a saber, las _referencias_.

Las referencias son similares a los punteros constantes: almacenan la dirección de una variable y no se pueden reasignar.

```c++
int x = 1;
// r es una referencia a x
int& r = x;
```

Como puedes ver, las referencias se definen con la ayuda del operador `&`, añadido al tipo referenciado.

No necesitas usar la sintaxis de desreferenciación (operador `*`) para cambiar la variable referenciada, ya que se puede hacer con la ayuda del operador de asignación regular.

```c++
r = 2;
// imprime 2
std::cout << r << "\n";
// también imprime 2
std::cout << x << "\n";
```

También es posible definir una referencia de solo lectura (inmutable) usando el modificador `const`:

```c++
const int& cr = x;
// imprime 2
std::cout << cr << "\n";
// la siguiente línea no compilará
cr = 3;
```

Existen algunas diferencias importantes entre punteros y referencias.

Primero, a diferencia de las variables puntero, las referencias no pueden quedar sin inicializar: tienes que inicializar la referencia para apuntar a alguna variable cuando la defines.

```c++
// el siguiente código no compilará
int& s;
```

Segundo, las referencias no pueden inicializarse con el valor `nullptr`.

```c++
// este código tampoco compilará
int& t = nullptr;
```

Por último, no puedes obtener la dirección de memoria de una variable de referencia en sí misma. Si intentas aplicar el operador de dirección a una variable de referencia, devolverá la dirección de la variable referenciada.

```c++
// las dos siguientes declaraciones siempre imprimirán la misma dirección
std::cout << &x << "\n";
std::cout << &r << "\n";
```

Como resultado secundario de la última regla, no puedes tener referencias anidadas (por ejemplo, `int&&`), ni puedes definir arreglos de referencias.

En otras palabras, una referencia a una variable simplemente se puede ver como un alias para esa variable. Esto le da al compilador cierta libertad en el tratamiento de las referencias. Por ejemplo, el compilador no está obligado a asignar memoria para almacenar las referencias. Si es posible, puede simplificar las operaciones sobre una referencia a meros accesos a la variable referenciada.

Debido a las limitaciones mencionadas anteriormente, el uso de referencias ayuda a prevenir toda una clase de errores relacionados con punteros: por ejemplo, el error de desreferenciación de puntero nulo. Puedes preguntarte: si las referencias proporcionan un mecanismo más seguro para manipular las direcciones de las variables, ¿por qué no usarlas siempre en lugar de los punteros? ¿Por qué mantener tanto referencias como punteros en el lenguaje?

Resulta que tanto los punteros como las referencias tienen sus casos de uso. Por ejemplo, solo puedes aplicar aritmética de punteros (que es bastante útil para implementar muchos algoritmos) a punteros y no a referencias. A medida que practiques la programación en C++, aprenderás a elegir entre aplicar punteros o referencias a tus tareas.


En el siguiente paso de teoría, mencionaremos un caso de uso particularmente importante de las referencias en C++: pasar argumentos a funciones por referencia.