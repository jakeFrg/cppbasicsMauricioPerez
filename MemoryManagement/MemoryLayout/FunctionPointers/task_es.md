¡También puedes crear punteros a funciones!
Sin embargo, la declaración de un tipo de puntero a función es un poco más complicada.

```c++
int (*fptr)(int, int) = nullptr;
```

En el ejemplo anterior, se declara e inicializa el puntero a función `fptr` a `nullptr`.
El puntero `fptr` solo puede apuntar a una función de un tipo especificado:
es decir, una función que tenga dos argumentos de tipo `int`
y que devuelva un `int` como resultado.

Podemos asignar `fptr` para apuntar a alguna función real:

```c++
int plus(int a, int b) {
    return a + b;
}
// ...
fptr = plus;
```

Ahora, la función `plus` se puede llamar usando el puntero `fptr`:

```c++
// debería imprimir 3
std::cout << fptr(1, 2) << "\n";
```

Para completar esta tarea, por favor implementa la función `fold`,
que debería calcular el resultado de aplicar una cierta operación binaria 
secuencialmente a todos los elementos de un arreglo.

```c++
int fold(int* array, size_t size, int init, int (*f)(int, int));
```

La función `fold` toma los siguientes argumentos:
- `array` – un puntero al inicio del arreglo,
- `size` – el tamaño del arreglo,
- `init` – el valor inicial,
- `f` – un puntero a la función que implementa la operación binaria a aplicar.

En tu implementación, puedes asumir que ni `array` ni `f` son punteros nulos.

Aquí hay un ejemplo de uso de `fold`:

```c++
const int size = 4;
int array[4] = { 1, 2, 3, 4 };
int res = fold(array, size, 0, plus);
// debería imprimir 10
std::cout << res << "\n";
```