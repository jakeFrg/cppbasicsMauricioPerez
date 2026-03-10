En la comunidad de programación de C++, a menudo se puede escuchar sobre los estilos de programación de C y C++. También puedes encontrar ejemplos de estos diferentes estilos en varios proyectos de C/C++. Entonces, ¿cuáles son exactamente esos dos estilos?

Inicialmente, el lenguaje C++ fue desarrollado como una extensión del lenguaje C. Incluso hoy en día, la mayoría del código escrito en C también puede ser compilado por compiladores de C++. Sin embargo, en general, C no es un subconjunto estricto de C++, lo que significa que hay muchas [incompatibilidades](https://en.wikipedia.org/wiki/Compatibility_of_C_and_C%2B%2B) entre estos lenguajes. Además de eso, hay muchas características del lenguaje, expresiones idiomáticas y patrones que difieren en C y C++. Estas diferencias dan lugar a los estilos de C y C++ mencionados anteriormente.

Es importante aprender a leer el código al estilo C, incluso si planeas seguir puramente el estilo C++ en el futuro. Hasta el día de hoy, el lenguaje C se ha convertido en un "lenguaje ensamblador multiplataforma", un lenguaje universal de bajo nivel que otros lenguajes a menudo usan para comunicarse entre sí, con el sistema operativo subyacente y con otro software a nivel de sistema. Muchos proyectos de C++ también necesitan integrarse con bibliotecas escritas en C, lo que ocasionalmente requiere usar el estilo de codificación C.

Ya hemos visto algunos ejemplos de los dos estilos en nuestro curso.

- Hasta ahora, hemos utilizado primitivas de estilo C++ para entrada y salida (I/O), a saber, `std::cout` y `std::cin`. El lenguaje C tiene su propia API distinta para realizar I/O. Revisaremos esta API más adelante.

- En el primer módulo, usamos la función `rand()` para generar números aleatorios. De hecho, es parte de la biblioteca estándar de C. C++ proporciona instalaciones más avanzadas (y por lo tanto más complejas de entender) para la generación de números aleatorios, que abordaremos más adelante en el curso.

- Casi todas las funciones de gestión de memoria que hemos aprendido en este módulo (como `malloc` y `free`) se consideran primitivas de bajo nivel del estilo C. C++ proporciona otras alternativas, que exploraremos en el próximo módulo. Las primitivas de gestión de memoria en C++ están estrechamente relacionadas con características que aún no hemos estudiado, como el _sistema de objetos_ y el concepto de _propiedad de recursos_. Por el contrario, la gestión de memoria al estilo C está "más cercana al suelo", y por lo tanto, es importante primero construir un modelo mental al respecto antes de pasar a conceptos más complejos.

En esta lección, estudiaremos otras dos primitivas importantes expresadas de manera diferente en los estilos C y C++: a saber, conversiones de tipo y cadenas.