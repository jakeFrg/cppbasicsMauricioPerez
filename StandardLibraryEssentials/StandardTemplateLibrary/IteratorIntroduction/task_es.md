Durante la exploración de contenedores, te encontrarás con iteradores muchas veces, lo cual no es sorprendente, ya que están estrechamente relacionados entre sí.

En C++, los [iteradores](https://en.cppreference.com/w/cpp/iterator) son objetos que nos permiten recorrer el contenedor y acceder a sus elementos. Básicamente, proporcionan una vista de los elementos de un contenedor y ofrecen una interfaz unificada para ellos.

Los iteradores se comportan de manera muy similar a los punteros, y en el caso de ciertos tipos de contenedores, de hecho son punteros. Un iterador es un medio para acceder a los elementos de un array o de cualquier otro contenedor de manera secuencial, sin exponer la representación interna.

Un iterador debe ser inicializado antes de usarse. Puedes inicializar un iterador al principio de un contenedor utilizando la función `begin()` o a una posición posterior al final del contenedor utilizando la función `end()`.

Puedes mover un iterador al siguiente elemento en el contenedor usando el operador `++` o la función `std::next`. Para mover un iterador al elemento anterior, utiliza el operador `--` o la función `std::prev`. También puedes mover un iterador una cantidad específica de elementos utilizando los operadores `+=` y `-=` o usando la función `std::advance`.

Normalmente, el tipo de un iterador es una expresión larga y compleja. La práctica común es usar la palabra clave `auto` al declarar un iterador.

```cpp
std::vector<int> numbers = {1, 2, 3, 4, 5};
std::vector<int>::iterator it = numbers.begin(); // tipo largo y complejo
auto it = numbers.begin(); // usando auto
```

La comparación de dos iteradores se realiza mediante los operadores `==` y `!=`, los cuales pueden ser útiles para comprobar si se ha llegado al final de un contenedor.

Puedes acceder al elemento al que apunta un iterador usando el operador `*`. Sin embargo, desreferenciar el iterador de `end()` conduce a un comportamiento indefinido.

```cpp
std::vector<char> characters = {'i', 'a', 'm', 's', 'h', 'o', 'u', 't', 'i', 'n', 'g'};

// Usando iteradores para modificar elementos
for (auto it = characters.begin(); it != characters.end(); ++it) {
    *it = std::toupper(*it);
}

// Usando iteradores para acceder a elementos
auto it = characters.begin();
while (it != characters.end()) {
    std::cout << *it++;
}
```

El bucle for basado en rango es una característica nueva introducida en C++11. Proporciona una forma concisa de iterar sobre un contenedor utilizando iteradores. El bucle for basado en rango es compatible con todos los contenedores estándar, además de arrays y listas de inicialización. La sintaxis del bucle for basado en rango es la siguiente:
```cpp
for (range_declaration : range_expression) loop_statement
```

Entonces, por ejemplo, el siguiente código:
```cpp
std::vector<int> v = {0, 1, 2, 3, 4, 5};

for (std::vector<int>::iterator it = v.begin(); it != v.end(); ++it) {
    std::cout << *it << ' ';
}

std::cout << '\n';

for (auto &i : v) {
    std::cout << i << ' ';
}
```
imprimirá la misma línea ambas veces:
```
0 1 2 3 4 5
0 1 2 3 4 5
```

Considera utilizar los bucles for basados en rango siempre que sea posible, ya que son más concisos y menos propensos a errores.

Dado un vector de enteros, necesitas implementar la función `find_maximum`, que devuelve el mensaje sobre el elemento máximo en el vector. La función debe usar iteradores para recorrer el vector y encontrar el elemento máximo.

El formato del mensaje debe ser: `"Maximum element is <max_element>"`.
Si el vector está vacío, retorna `"Vector is empty"`.