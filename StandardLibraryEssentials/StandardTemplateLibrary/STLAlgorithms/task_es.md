Además de todo lo que hemos aprendido hasta ahora, la STL también proporciona una serie de algoritmos que se pueden utilizar sobre un rango de elementos. Estos algoritmos se implementan como funciones que normalmente hacen uso de iteradores. En esta tarea, revisaremos algunos de los algoritmos más utilizados. Existen muchos más algoritmos disponibles en la STL, y puedes encontrar una lista completa [aquí](https://en.cppreference.com/w/cpp/algorithm).
Te animamos encarecidamente a explorar los algoritmos de la STL por tu cuenta e intentar usarlos en tu código. Son útiles y pueden ahorrarte mucho tiempo y esfuerzo.

#### 1. `std::sort()`
El algoritmo [`std::sort()`](https://en.cppreference.com/w/cpp/algorithm/sort) se utiliza para ordenar un rango de elementos. Se implementa como una función plantilla de un algoritmo de ordenamiento de `O(n log n)` (probablemente [introsort](https://en.wikipedia.org/wiki/Introsort)), y su sintaxis es la siguiente:
```cpp
std::sort(start_iterator, end_iterator, comparator);
```
Los dos primeros argumentos son iteradores que definen el rango de elementos a ordenar. El tercer argumento es un comparador opcional que se utiliza para comparar dos elementos. Si no se proporciona comparador, los elementos se ordenan en orden ascendente por defecto. El comparador puede ser un puntero a función o un funtor. Como cabría esperar, esta función requiere un Iterador de Acceso Aleatorio para permitir la ordenación en cualquier orden.
```cpp
// Ordenar un vector de enteros en orden ascendente
std::vector<int> v1 = {5, 2, 4, 3, 1};
std::sort(v1.begin(), v1.end());
// v = {1, 2, 3, 4, 5}

// Ordenar un vector de enteros en orden descendente
std::vector<int> v2 = {5, 2, 4, 3, 1};
std::sort(v2.begin(), v2.end(), std::greater<>());
// v = {5, 4, 3, 2, 1}

// Ordenar un vector de cadenas en orden ascendente por longitud
std::vector<std::string> v3 = {"abc", "a", "ab"};
std::sort(v3.begin(), v3.end(), [](const std::string &a, const std::string &b) {
    return a.size() < b.size();
});
// v = {"a", "ab", "abc"}
```

#### 2. `std::reverse()`
[`std::reverse()`](https://en.cppreference.com/w/cpp/algorithm/reverse) se utiliza para invertir un rango de elementos. Se implementa como una plantilla de un algoritmo sencillo de `O(n)` con la siguiente sintaxis:
```cpp
std::reverse(start_iterator, end_iterator);
```
Los dos argumentos son iteradores que definen el rango de elementos a invertir. Esta función requiere un Iterador Bidireccional.
```cpp
std::vector<int> v = {1, 2, 3, 4, 5};
std::reverse(v.begin(), v.end());
// v = {5, 4, 3, 2, 1}
```

#### 3. `std::find()`
[`std::find()`](https://en.cppreference.com/w/cpp/algorithm/find) se utiliza para encontrar la primera aparición de un valor en un rango de elementos. Se implementa como una función plantilla de un algoritmo de `O(n)` y tiene la siguiente sintaxis:
```cpp
std::find(start_iterator, end_iterator, value);
```
Los dos primeros argumentos son iteradores que definen el rango de elementos donde se realizará la búsqueda. El tercer argumento es el valor a buscar. Si se encuentra el valor, se devuelve un iterador apuntando a la primera ocurrencia del valor. En caso contrario, se devuelve un iterador al final del rango. Cuando la función no requiere una política de ejecución, se utiliza un Iterador de Entrada; de lo contrario, se utiliza un Iterador Adelantado.
```cpp
std::vector<int> v = {1, 2, 3, 4, 5};
auto it = std::find(v.begin(), v.end(), 3);
if (it != v.end()) {
    std::cout << "Encontrado " << *it << std::endl;
} else {
    std::cout << "No encontrado" << std::endl;
}
```

#### 4. `std::max_element()` y `std::min_element()`
[`std::max_element()`](https://en.cppreference.com/w/cpp/algorithm/max_element) y [`std::min_element()`](https://en.cppreference.com/w/cpp/algorithm/min_element) se utilizan para encontrar el elemento máximo y mínimo, respectivamente, en un rango de elementos. Ambas funciones tienen complejidad `O(n)` y comparten la siguiente interfaz:
```cpp
std::max_element(start_iterator, end_iterator, comparator);
std::min_element(start_iterator, end_iterator, comparator);
```
Los dos primeros argumentos son iteradores que definen el rango de elementos donde se realizará la búsqueda. El tercer argumento es un comparador opcional empleado para comparar dos elementos. Si no se proporciona ningún comparador, los elementos se comparan usando el operador `<` por defecto. Como habrás deducido, estas funciones requieren un Iterador Adelantado.
```cpp
std::vector<int> v = {1, 2, 3, 4, 5};
auto max_it = std::max_element(v.begin(), v.end());
auto min_it = std::min_element(v.begin(), v.end());
std::cout << "Máximo: " << *max_it << std::endl;
std::cout << "Mínimo: " << *min_it << std::endl;
```

#### 5. `std::fill()`
[`std::fill()`](https://en.cppreference.com/w/cpp/algorithm/fill) se utiliza para rellenar un rango de elementos con un valor específico. Su complejidad temporal es `O(n)`, equivalente al tiempo necesario para recorrer todo el arreglo y modificar los elementos. La sintaxis es bastante sencilla:
```cpp
std::fill(start_iterator, end_iterator, value);
```
Los dos primeros argumentos son iteradores que definen el rango de elementos que se rellenarán. El tercer argumento es el valor que se utilizará para el relleno. Esta función requiere un Iterador Adelantado.
```cpp
std::vector<int> v = {1, 2, 3, 4, 5};
std::fill(v.begin(), v.end(), 0);
// v = {0, 0, 0, 0, 0}
```

También existe un encabezado llamado [`<numeric>`](https://en.cppreference.com/w/cpp/header/numeric) que contiene una serie de algoritmos útiles para operaciones numéricas.

Por ejemplo, [`std::accumulate()`](https://en.cppreference.com/w/cpp/algorithm/accumulate) se utiliza para calcular la suma de un rango de elementos. Se implementa como un recorrido lineal simple de `O(n)`, con la siguiente sintaxis:
```cpp
std::accumulate(start_iterator, end_iterator, initial_value);
```
Esta función requiere Iteradores de Entrada, y los dos primeros argumentos son los iteradores que definen el rango a sumar. El tercer argumento es el valor inicial de la suma. Ten cuidado con el tipo del acumulador, ya que puede producirse un desbordamiento si la suma es demasiado grande. Por ejemplo, para sumar un rango de enteros, puedes usar `0LL` como valor inicial para evitar desbordamientos.
```cpp
std::vector<int> v = {1, 2, 3, 4, 5, 6, 7, 8, 9};
long long suma = std::accumulate(v.begin(), v.end(), 0LL);
std::cout << "Suma: " << suma << std::endl;
```

Finalmente, pongamos en práctica estos algoritmos. Tu tarea es implementar una función que reciba un vector de enteros y devuelva la suma de los elementos cuyo valor esté entre dos valores proporcionados: `lowerBound` y `upperBound`.