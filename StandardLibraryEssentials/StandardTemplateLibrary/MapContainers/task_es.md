Otra forma de contenedor asociativo es [`std::map`](http://en.cppreference.com/w/cpp/container/map). Es similar a `std::set`, pero almacena pares clave-valor. Puedes pensar en él como un diccionario.

Las claves son únicas y, por defecto, están ordenadas en orden ascendente. Son inmutables, por lo que no puedes modificarlas.
Los valores no están ordenados y pueden duplicarse.

Siempre puedes definir tu propio criterio de ordenación proporcionando un comparador personalizado.

En comparación con `std::set` y `std::multiset`, `std::map` y `std::multimap` ofrecen acceso directo a sus elementos utilizando los métodos `operator[]` y `at()`. Sin embargo, ten en cuenta el siguiente comportamiento: si la clave no se encuentra, `operator[]` insertará un nuevo elemento con la clave especificada y un valor por defecto. En cambio, el método `at()` lanzará una excepción si la clave no se encuentra.

```cpp
std::map<std::string, int> people;
people.insert(std::make_pair("John", 25));
people.insert({"Jane", 20});
people["John"] = 30; // sobrescribirá el valor anterior
people["Alex"] = 15; // insertará un nuevo elemento
people["John"] += 5; // incrementará el valor
std::cout << "Número de personas: " << people.size() << std::endl;
```

[`std::multimap`](http://en.cppreference.com/w/cpp/container/multimap) ofrece la misma funcionalidad que `std::map`, pero permite claves duplicadas.

Ten en cuenta que la búsqueda con `find()` solo se puede realizar utilizando una clave. No hay manera de buscar por valor salvo iterando por todo el contenedor.

Tanto `std::set` como `std::map` no se almacenan en un bloque de memoria contiguo. Por lo tanto, aunque el siguiente código funciona para `std::vector`:

```cpp
std::vector<int> v = {1, 2, 3};
int* p = &v[0];
p += 1;
std::cout << *p << std::endl; // imprimirá 2
```

en el caso de los contenedores asociativos, esto provocará un comportamiento indefinido:

```cpp
std::map<int, int> m = {{1, 2}, {3, 4}};
std::pair<const int, int>* p2 = &*m.begin();
p2 += 1;
std::cout << p2->first << ' ' << p2->second << std::endl; // Comportamiento indefinido
```

Internamente, tanto los contenedores set como map están construidos sobre un [árbol rojo-negro](https://es.wikipedia.org/wiki/%C3%81rbol_rojo-negro), una estructura de datos de árbol binario de búsqueda balanceado. Esto les permite lograr complejidad logarítmica para las operaciones de inserción y búsqueda.

Como tarea, necesitas implementar una función que cuente las apariciones de cada letra en un texto. La función debe devolver un `std::map` con las letras como claves y el número de apariciones como valores. Las letras deben estar ordenadas alfabéticamente. La función debe ser insensible a mayúsculas y minúsculas; es decir, las letras "A" y "a" deben considerarse iguales. La función también debe ignorar signos de puntuación y números.