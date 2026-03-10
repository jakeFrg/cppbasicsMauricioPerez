En este módulo, vamos a profundizar en la Biblioteca Estándar de Plantillas (Standard Template Library, STL), ¡un aliado de todo programador de C++!
Además de la funcionalidad básica del lenguaje, cada compilador de C++ brinda acceso a una amplia gama de algoritmos preescritos, estructuras de datos y otras clases y funciones genéricas.
Abordaremos los siguientes temas:
- funcionalidad de `std::vector`
- `std::string` y sus optimizaciones
- contenedores secuenciales, como `std::forward_list`, `std::deque`, `std::list` y `std::array`
- adaptadores de contenedores secuenciales, como `std::stack`, `std::queue` y `std::priority_queue`
- contenedores asociativos, como `std::set`, `std::map`
- contenedores asociativos no ordenados, como `std::unordered_set`, `std::unordered_map`
- iteradores y sus tipos
- algoritmos de la STL
- flujos de entrada y salida

La STL comprende cientos de clases y funciones, por lo que es imposible cubrir todas en un solo curso.
Sin embargo, presentaremos las más importantes y te proporcionaremos las herramientas necesarias para que aprendas el resto por tu cuenta.
[Cppreference](https://en.cppreference.com/w/)
es un excelente recurso que ofrece información detallada sobre la STL y el lenguaje C++ en general.

En ocasiones, haremos referencia a la "complejidad" de una operación o algoritmo.
La complejidad mide cuánta memoria y tiempo requiere una operación o algoritmo para completarse.
Utilizaremos la [notación Big-O](https://es.wikipedia.org/wiki/Notaci%C3%B3n_O_grande)
para describir esta complejidad.
Por ejemplo, si una operación toma un tiempo `O(n)`,
significa que el tiempo necesario para completarla es proporcional al tamaño de la entrada.
`O(1)` o "tiempo constante" indica que el tiempo de la operación no depende del tamaño de la entrada.