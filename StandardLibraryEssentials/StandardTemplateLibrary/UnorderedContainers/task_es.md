¿Existe una manera de crear un contenedor que tenga una complejidad `O(1)` para inserción, eliminación y búsqueda? Suena a magia, ¿verdad?
Pues no lo es. La STL proporciona los contenedores `std::unordered_set` y `std::unordered_map`, que están implementados usando [tablas hash](https://es.wikipedia.org/wiki/Tabla_hash).

¿Qué distingue a los `std::set` y `std::map` regulares de sus versiones no ordenadas? Debido a detalles de implementación (que se explicarán más adelante), su principal diferencia es la falta de un orden estable de los elementos. Existen iteradores para estos contenedores, pero al recorrer el contenedor con estos iteradores, probablemente notarás que los elementos no están ordenados de forma ascendente.
Sin embargo, este es un pequeño precio a pagar por la complejidad `O(1)` en las operaciones de búsqueda, inserción y eliminación.

Los métodos principales de `std::unordered_set` y `std::unordered_map` incluyen:
* `insert(value)` - inserta el elemento `value` en el contenedor.
* `emplace(args...)` - construye el elemento en el lugar.
* `erase(value)` - elimina el elemento `value` del contenedor.
* `find(value)` - devuelve un iterador al elemento `value` si se encuentra; de lo contrario, devuelve `end()`.

Una tabla hash es una estructura de datos que utiliza una [función hash](https://es.wikipedia.org/wiki/Funci%C3%B3n_hash) para mapear claves a depósitos o buckets. Cada vez que deseas insertar o buscar un elemento, aplicas una función hash a la clave y obtienes el número del bucket. Luego insertas o buscas el elemento en ese bucket.

La biblioteca estándar proporciona la función `std::hash` para tipos básicos, y puedes definir tu propia función hash para cualquier tipo personalizado.

<div class="hint">
  Cabe señalar que todos estos métodos tienen una complejidad amortizada O(1), ya que en ocasiones los hashes de diferentes claves pueden ser iguales. Esto se llama colisión: https://es.wikipedia.org/wiki/Tabla_hash#Resoluci%C3%B3n_de_colisiones. En tales situaciones, es necesario volver a hashear toda la tabla, lo cual es la razón por la que los métodos de un contenedor no ordenado pueden ejecutarse en tiempo O(n) en el peor de los casos.
</div>

Existen algunas funciones para manipular los buckets:
* `bucket_count()` - devuelve el número de buckets.
* `bucket_size(n)` - devuelve el número de elementos en el bucket `n`.
* `bucket(k)` - devuelve el número de bucket para la clave `k`.
* `load_factor()` - devuelve el número promedio de elementos por bucket.
* `max_load_factor()` - devuelve el factor de carga máximo.
* `rehash(n)` - establece el número de buckets en `n` o más.

Cuando necesites una función hash personalizada, puedes definirla de la siguiente manera:
```cpp
struct my_type {
private:
    int x;
    int y;

public:
    my_type(const int x, const int y) : x(x), y(y) {};
    
    bool operator==(const my_type& other) const {
        return x == other.x && y == other.y;
    }

    friend struct my_hash;
};

struct my_hash {
    std::size_t operator()(const my_type& t) const {
        return std::hash<int>()(t.x) ^ std::hash<int>()(t.y);
    }
};

int main() {
    std::unordered_set<my_type, my_hash> s;
    s.emplace(1, 2);
}
```

Existen versiones múltiples de estos contenedores: `std::unordered_multiset` y `std::unordered_multimap`. Permiten almacenar múltiples elementos con la misma clave.

Como ejemplo, observemos el siguiente código:
```cpp
#include <iostream>
#include <unordered_set>
#include <string>

int main() {
    std::unordered_set<std::string> set;
    set.insert("¡Saludos, viajero!");
    set.insert("¿Cómo estás?");
    set.insert("¡Únete a nosotros!");
    
    if (set.find("¿Cómo estás?") != set.end()) {
        std::cout << "¡Encontrado!" << std::endl;
    }
    
    // Si usas C++20 o superior, puedes utilizar esto:
    
    // if (set.contains("¿Cómo estás?")) {
    //     std::cout << "¡Encontrado!" << std::endl;
    // }
    
    // imprimir todos los elementos, el orden no está garantizado
    for (const auto& s : set) {
        std::cout << s << std::endl;
    }
}
```

Debes implementar un sistema de [caché](https://es.wikipedia.org/wiki/Cache_(inform%C3%A1tica)) con una política [LRU](https://es.wikipedia.org/wiki/Pol%C3%ADticas_de_reemplazo_de_cach%C3%A9#El_menos_usado_recientemente_(LRU)) (Least Recently Used, es decir, el menos usado recientemente). Las funciones miembro están definidas en el archivo `/include/Cache.h`. Dado que una caché es un tipo de almacenamiento muy rápido, necesitarás usar hashing para implementarla. Primero, define una estructura dentro del archivo `/include/Cache.h` que almacene pares clave-valor. Después, define otra estructura que guarde la clave y un iterador al elemento correspondiente en la lista. Tras definir estas estructuras, puedes implementar las operaciones de caché en `task.cpp`.

<div class="hint">
  La solución del autor utiliza un `std::list` que contiene elementos de tipo `std::pair` de clave + valor y un `std::unordered_map` con clave + valor como iterador al elemento de la lista previamente definida.
</div>

La caché debe tener los siguientes métodos:
* `LRUCache(size_t capacity)` - constructor que establece el número máximo de elementos en la caché.
* `void put(const std::string& key, const std::string& value)` - inserta el par clave-valor en la caché. Si la caché está llena, debe eliminar el elemento menos usado recientemente.
* `std::string get(const std::string& key)` - retorna el valor asociado a la clave. Si la clave no se encuentra, devuelve `std::nullptr`.