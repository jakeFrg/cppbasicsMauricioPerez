Imagina que tienes una función para calcular la suma de dos números. Si quieres calcular la suma de dos enteros, puedes escribir una función que reciba dos números de tipo `int` como argumentos y devuelva su suma. Sin embargo, supongamos que también quieres tener una función similar para `double`, `long long`, `float` o algún tipo de dato personalizado. Tendrías que escribir una función diferente para cada tipo. Esto resulta poco práctico, ya que terminas escribiendo múltiples funciones que esencialmente hacen lo mismo pero con distintos tipos de datos.

Los templates están diseñados para solucionar precisamente este problema. Permiten escribir una sola función que funcione con múltiples tipos. Por ejemplo, puedes escribir una función plantilla que reciba dos argumentos de cualquier tipo y devuelva su suma como una variable del mismo tipo.

La sintaxis para crear una función plantilla es sencilla: se comienza con la palabra clave `template`, seguida de la palabra clave `typename` y luego se incluye el nombre del tipo que se desea usar como parámetro plantilla. Después, puedes utilizar ese nombre de tipo en la función como si se tratara de un tipo regular:

```cpp
template <typename T>
T sum(T a, T b) {
    return a + b;
}
```

El número de parámetros plantilla no está limitado a uno. Si necesitas usar varios tipos para los argumentos de la función, puedes emplear varios parámetros plantilla. Aquí tienes una función de ejemplo con dos:
```cpp
template <typename T1, typename T2>
T1 sum(T1 a, T2 b) {
    return a + b;
}
```
Esta función funcionará con cualquier par de tipos, siempre que el primer tipo soporte el operador `+` y el segundo tipo pueda convertirse al primero. Ten en cuenta que el tipo de retorno de la función es `T1`, por lo que el resultado de la suma será del mismo tipo que el primer argumento.

Los templates también pueden usarse con clases. Puedes crear una clase plantilla para trabajar con distintos tipos. La sintaxis es similar a la de la función plantilla, pero debes especificar los parámetros plantilla antes del nombre de la clase:
```cpp
template <typename T, typename U>
class Person {
public:
    T age;
    U name;
    Person(T age, U name) : age(age), name(name) {}
};

int main() {
    Person<int, std::string> p1(25, "John");
    char name[10] = "Bob";
    Person<double, char*> p2(25.5, name);
    return 0;
}
```

La instanciación de templates es el proceso mediante el cual el compilador crea una función o clase "concreta" a partir de un template, utilizando un tipo específico. Cuando utilizas un template con un tipo determinado, el compilador genera una instancia del template para ese tipo. Esto se conoce como una función o clase "instanciada". Por ejemplo, volvamos a la función plantilla de suma:
```cpp
template <typename T>
T sum(T a, T b) {
    return a + b;
}

int main() {
    int result = sum<int>(2, 3);
}
```
Cuando llamamos a `sum<int>(2, 3)`, el compilador genera la función
```cpp
int sum(int a, int b) {
    return a + b;
}
```
y la utiliza para calcular la suma de dos enteros.

El mismo proceso se aplica a las clases plantilla. El punto clave es que se genera una función o clase separada para cada tipo con el que se utiliza un template. Por eso los templates son una característica en tiempo de compilación.

<div class="hint">
    A veces, puede que encuentres una declaración de template usando la palabra clave `class` en lugar de `typename`. Ambas palabras clave son intercambiables en declaraciones de templates, y en la mayoría de los casos puedes usar cualquiera de las dos. Sin embargo, existen algunas excepciones. Para más información, consulta este artículo: https://mariusbancila.ro/blog/2021/03/15/typename-or-class/.
</div>

Si el número de parámetros es desconocido, puedes utilizar templates variádicos. Esto te permite crear una función que puede recibir cualquier cantidad de argumentos de cualquier tipo. Aquí tienes la sintaxis:
```cpp
template <typename T>
T sum(T t) {
    return t;
}

template <typename T, typename... Args>
T sum(T first, Args... args) {
    return first + sum(args...);
}
```
En este caso, la función toma el primer argumento y luego se llama a sí misma recursivamente con el resto de los argumentos. La recursión termina cuando no quedan más argumentos. Ten en cuenta que debe existir un caso base para la recursión —la primera función en nuestro ejemplo—, de lo contrario, el compilador generará un error.

En esta tarea, debes implementar un análogo de la clase [`std::pair`](https://en.cppreference.com/w/cpp/utility/pair). En esencia, debe ser una clase con dos parámetros plantilla, `T1` y `T2`, y dos campos de estos tipos, para almacenar dos valores simultáneamente.
Dirígete al archivo `/include/DataPair.hpp` y crea allí la clase plantilla `DataPair`. La clase debe tener los siguientes métodos:
- Un constructor sin argumentos que inicialice los campos con los valores predeterminados (asumiendo que los tipos `T1` y `T2` tienen su propio constructor por defecto).
- Un constructor que inicialice los campos con los valores de los argumentos proporcionados.
- Métodos `getFirst` y `getSecond` que devuelvan los valores de los campos correspondientes.
- Métodos `setFirst` y `setSecond` que asignen nuevos valores a los campos correspondientes.

Fuera de la clase, implementa una función `makePair` que cree una instancia de la clase `DataPair` con los valores de argumento dados.