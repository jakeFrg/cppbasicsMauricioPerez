Hablemos un poco más sobre las [funciones](https://en.cppreference.com/w/cpp/language/functions) en C++. Si ya estás familiarizado con el concepto de funciones, siéntete libre de omitir este paso.

Las funciones son los bloques básicos de construcción de programas en casi todos los lenguajes de programación. Permiten al programador dividir una tarea compleja en subproblemas más pequeños y resolverlos de manera independiente. Tal como hiciste en el paso anterior. Solo tuviste que implementar una única función `move`, y el resto del trabajo fue realizado por nuestro código preescrito.

Veamos la sintaxis de las funciones en C++.

```c++
int sum(int a, int b) {
    return a + b;
}
```

Una función tiene un nombre, argumentos, un tipo de retorno y un cuerpo. En el ejemplo anterior:

- `sum` es el nombre de la función;
- `a` y `b` son los argumentos dados junto con su tipo `int`;
- `int` antes del nombre de la función es el tipo de retorno de la función;
- `return a + b` es el cuerpo de la función encerrado entre llaves `{}`.

Dentro del cuerpo de la función, se puede referir a cualquiera de sus argumentos. Una vez que la ejecución de una función alcanza la instrucción `return`, se completa con el resultado siendo el cálculo de la expresión que sigue a la palabra clave `return`.

Las funciones sin valor de retorno tienen el tipo de retorno `void`.

```c++
void printInt(int a) {
    std::cout << a << "\n";
}
```

Para llamar a una función desde otro lugar en el código, se necesita usar su nombre y proporcionar el número suficiente de argumentos del tipo adecuado.

```c++
int c = sum(1, 2);
printInt(c); // imprime 3
```

Al realizar la llamada, los argumentos en el cuerpo de la función serán sustituidos por los valores reales pasados, el control se transferirá al cuerpo de la función, y cuando la función termine, su valor de retorno será enviado de regreso al lado que la llamó.