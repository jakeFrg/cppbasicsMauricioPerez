Un contenedor con el que ya estás familiarizado es [`std::string`](https://en.cppreference.com/w/cpp/string/basic_string). Es una estructura utilizada para almacenar secuencias de caracteres. ¿Por qué no usamos `std::vector<char>` en su lugar? Ambos comparten muchas similitudes: por ejemplo, puedes acceder a sus elementos por índice y ambos gestionan la memoria automáticamente. Además, comparten métodos como `push_back()`, `pop_back()`, `insert()`, `erase()`, `size()` y `empty()`.

La principal diferencia es que `std::string` tiene muchos métodos que son específicos para cadenas, como `find()`, `substr()`, `replace()`, etc.
Además, `std::string` soporta el operador `+`, que se utiliza para concatenar cadenas, y garantiza la terminación nula, permitiéndote usar el método `c_str()` para obtener un puntero a la cadena terminada en nulo.
Adicionalmente, `std::string` dispone de muchos constructores, que permiten crear una cadena a partir de un carácter, una subcadena, un puntero a una cadena terminada en nulo, un puntero a una cadena, un rango de caracteres, etc.

En general, `std::string` es una manera más conveniente de trabajar con cadenas que `std::vector<char>`.

Es un contenedor útil, pero existen algunos aspectos que pueden provocar disminución en el rendimiento. Así que, en esta lección, aprenderás cómo usar `std::string` de manera eficiente.

Primero, similar a `std::vector`, puedes utilizar el método `reserve()` para reservar una cierta cantidad de caracteres si conoces la capacidad necesaria.

<div class="hint">
  Además, existe una característica llamada **Small String Optimization** (Optimización para Cadenas Pequeñas). Esto significa que, si tu cadena es lo suficientemente pequeña, se almacenará en la pila en lugar del montón. Para más detalles, puedes leer este artículo: https://giodicanio.com/2023/04/26/cpp-small-string-optimization/.
</div>

Cuando necesitas pasar una cadena a una función, con frecuencia es beneficioso pasarla por referencia constante. Si no la pasas de esta manera, la cadena será copiada. Por ejemplo, si quieres imprimir una cadena, puedes pasarla por referencia constante:

```cpp
void print(const std::string& str) {
    std::cout << str << '\n';
}

int main() {
    std::string str = "Imagina una cadena muy larga aquí que tomará muuuuuuuucho tiempo copiar";
    print(str);
}
```

Como recordarás del módulo anterior, la semántica de movimiento ofrece una forma más eficiente de gestionar tus recursos. Cuando pases una cadena y el objeto original ya no sea necesario, considera usar `std::move()`.

```cpp
class person {
private:
    std::string person_name;
    std::string person_surname;
    
public:
    person(std::string name, std::string surname)
    : person_name(std::move(name)), person_surname(std::move(surname)) {}
};

void createPerson() {
    std::string name = "Alex";
    std::string surname = "Johns";
    person great_guy(name, surname);
}
```

En C++, existe un tipo especial llamado [`std::string_view`](https://en.cppreference.com/w/cpp/string/basic_string_view). Es una vista no propietaria de una cadena, es decir, no almacena la cadena en sí, sino únicamente un puntero a ella. Es útil cuando quieres pasar una cadena a una función o un contenedor, pero no tienes intención de modificarla y deseas evitar su copia. También resulta conveniente cuando necesitas obtener una subcadena.

```cpp
std::string input1 = {"mindyourlegs"};
std::string input2 = {"whenusingcpp"};
std::vector<std::string_view> inputs {input1, input2};

std::vector<std::string_view> substrings;
for (std::size_t i = 0; i < inputs.size(); ++i) {
    const auto & string = inputs[i];
    for (std::size_t j = 0; j < string.size() - 2; ++j) {
        substrings.emplace_back(string.data() + j, 3);
    }
}
for (std::size_t i = 0; i < substrings.size(); ++i) {
    std::cout << substrings[i] << '\n';
}
```

Ten en cuenta que no existe conversión implícita de `std::string_view` a `std::string`. Puedes utilizar el constructor de `std::string` que acepta un objeto `std::string_view`:
```cpp 
std::string_view sv = "Hello, World!";
std::string str {sv};
```
o usar
```cpp
static_cast<std::string>(your_sv_object)
```
si deseas obtener una cadena.

También es preferible pasar un objeto `std::string_view` por valor, ya que es una estructura pequeña que solo consta de un puntero y un tamaño. Para una explicación más detallada, puedes leer [esto](https://quuxplusone.github.io/blog/2021/11/09/pass-string-view-by-value/).

Los principales métodos de `std::string` son:
* `size()` — devuelve el tamaño de la cadena
* `empty()` — devuelve `true` si la cadena está vacía
* `clear()` — limpia el contenido de la cadena
* `push_back()` — añade un carácter al final de la cadena
* `pop_back()` — elimina el último carácter de la cadena
* `replace()` — reemplaza un carácter en una posición determinada
* `substr()` — devuelve una subcadena de la cadena
* `find()` — busca una subcadena en la cadena

Al igual que `std::vector`, `std::string` posee métodos para insertar y borrar caracteres en una posición dada; sin embargo, pueden ser ineficientes. Como estos métodos presentan complejidad lineal, es mejor evitarlos si es posible.
* `insert()` — inserta un carácter en una posición determinada. También puede insertar una subcadena en esa posición.
* `erase()` — elimina un carácter o una subcadena en una posición determinada.

Tu tarea es implementar un programa que verifique si una cadena de entrada es un palíndromo. Un palíndromo es una palabra, número, frase u otra secuencia de caracteres que se lee igual de izquierda a derecha y de derecha a izquierda, ignorando los espacios, la puntuación y las mayúsculas.

Te animamos a implementar la función `preprocess`, que realizará el preprocesamiento de la cadena de entrada. Esto debe estar formateado de tal manera que la verificación del palíndromo sea más sencilla.

La función `isPalindrome` debe devolver `true` si la cadena de entrada es un palíndromo y `false` en caso contrario.