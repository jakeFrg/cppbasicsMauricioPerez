En ocasiones, necesitarás manejar distintos tipos de parámetros de plantilla de manera diferente.

Por ejemplo, es posible que desees crear una función que funcione con cualquier tipo. Sin embargo, si el tipo es un puntero, preferirías seguir un enfoque alternativo. Afortunadamente, con la especialización de plantillas, puedes crear una versión especial de la función para punteros, así como para cualquier otro tipo. Para hacerlo, debes escribir una implementación de la función con un tipo definido, como se muestra a continuación:
```cpp
template <typename T>
void print(T value) {
    std::cout << value << std::endl;
}

template <>
void print<int*>(int* value) {
    std::cout << *value << std::endl;
}

int main() {
    int a = 5;
    int* b = &a;
    print(a); // imprime 5
    print(b); // también imprime 5 --- el valor al que apunta
    return 0;
}
```

Cuando el compilador encuentra cualquier llamada a una función plantilla, primero verifica si existe una versión especializada de la función para el tipo del argumento. Si existe, la utilizará; de lo contrario, empleará la versión general.

Existe una técnica llamada metaprogramación que te permite escribir código que genera otro código utilizando plantillas y especialización de plantillas. Debido a que es un tema complejo, no lo abordaremos en este curso, pero puedes encontrar más información al respecto en la [documentación de C++](https://en.cppreference.com/w/cpp/meta).

Tu tarea es crear una función plantilla para mostrar información sobre objetos `DataPair` que has implementado en la tarea anterior. La función debe recibir un objeto `DataPair` e imprimir los valores de sus campos. Si el tipo de un campo es un puntero, debe imprimir el valor al que apunta; en caso contrario, imprimir el valor directamente.

Además, si los dos campos son del mismo tipo, la función debe imprimir la cadena `<Typename> DataPair:  <first>, <second>`, donde `<Typename>` es el nombre del tipo en común. Como el nombre de la clase no forma parte de la biblioteca estándar de C++, especifiquémoslo solo para los tipos `int`, `double` y `std::string`.

Para campos de tipos diferentes, la función debe imprimir `DataPair:  <first>, <second>`. La función debe ser implementada en el archivo `/include/DataPair.hpp`.