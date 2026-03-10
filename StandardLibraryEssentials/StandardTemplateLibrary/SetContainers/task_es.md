Además de todos los contenedores secuenciales cubiertos previamente, C++ también proporciona varios contenedores asociativos. Estos contenedores están diseñados para almacenar elementos en un orden ordenado.

[`std::set`](http://en.cppreference.com/w/cpp/container/set) es un contenedor que almacena elementos únicos en orden. Para almacenar tus propias clases en `std::set`, necesitas definir un operador de comparación. Por defecto, la función de comparación es `std::less`, que es equivalente al operador `<`.
La función debe tomar dos argumentos del mismo tipo que los elementos del conjunto y devolver `true` si el primer argumento es menor que el segundo (o, simplemente, debe ubicarse a la izquierda si tus objetos no pueden compararse numéricamente), y `false` en caso contrario. Normalmente, la función de comparación se define como una función `friend` de la clase. El siguiente ejemplo muestra cómo definir una función de comparación para la clase `person`, que almacena el nombre y la edad de una persona.

```cpp
class person {
public:
    person(std::string name, int age) : person_name(std::move(name)), person_age(age) {}
    std::string name() const { return person_name; }
    int age() const { return person_age; }
    friend bool operator<(const person& lhs, const person& rhs);
private:
    std::string person_name;
    int person_age;
};

bool operator<(const person& lhs, const person& rhs) {
    return lhs.name() < rhs.name();
}

int main() {
    std::set<person> people;
    people.insert(person("John", 25));
    people.insert(person("Jane", 20));
    people.insert(person("John", 25)); // los duplicados no se insertarán
    std::cout << "Number of people: " << people.size() << std::endl;
    return 0;
}
```

[`std::multiset`](http://en.cppreference.com/w/cpp/container/multiset) ofrece la misma funcionalidad que `std::set` pero permite elementos duplicados. Puede ser útil cuando deseas mantener tu conjunto ordenado, pero los duplicados no son un problema. La complejidad de las operaciones de inserción y búsqueda sigue siendo logarítmica.

A diferencia de los contenedores secuenciales, `std::set` y `std::multiset` no proporcionan acceso directo a sus elementos (no existe `at()` ni `operator[]`). Los elementos solo pueden accederse mediante iteradores.

El método `find()` devuelve un iterador al elemento con el valor especificado. Si el elemento no se encuentra, el iterador será igual a `end()`. El método `count()` devuelve el número de elementos con el valor especificado, que será `0` o `1` en el caso de `std::set`, y cualquier número no negativo en el caso de `std::multiset`.

`lower_bound()` y `upper_bound()` devuelven iteradores al primer elemento que no es menor que (límite inferior) o mayor que (límite superior) el valor especificado. Si no se encuentra el elemento, el iterador será igual a `end()`.

Considera usar estos contenedores cuando se espera realizar búsquedas frecuentes, ya que su desempeño es mucho mejor que el de los contenedores secuenciales.

Tu tarea es implementar una función que reciba una cadena de texto, la divida en palabras y devuelva un `std::set` con las palabras únicas. Las palabras deben estar ordenadas alfabéticamente. La función debe ser insensible a las mayúsculas y minúsculas, es decir, palabras como "Hello" y "hello" deben considerarse iguales. Además, la función debe ignorar signos de puntuación y números.

Intenta encontrar una forma de convertir los caracteres a minúsculas y de considerar solo letras. Es posible que necesites usar un encabezado adicional. Si no logras encontrar cómo hacerlo, siempre puedes usar la pista a continuación.

<div class="hint">
  Para comprobar si un carácter es una letra, puedes usar la función <code>std::isalpha</code> del encabezado <code>&lt;cctype&gt;</code>. Para convertir un carácter a minúsculas, puedes usar la función <code>std::tolower</code> del mismo encabezado.
</div>