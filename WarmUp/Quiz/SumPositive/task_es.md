Implementar una función que calcule la suma de los enteros no negativos en un arreglo.

```c++
int sumPositive(int array[], int size);
```

Esta función toma como argumentos un arreglo de enteros y su tamaño.
Puedes asumir que el valor absoluto de todos los enteros en el arreglo no 
excede `1000` y que el tamaño del arreglo no es mayor que `100`.

Si el arreglo está vacío o contiene solo enteros negativos,
entonces la función debe retornar `0`.

Para implementar la función requerida, puedes encontrar útil
el operador de asignación aritmética descrito a continuación.

<div class="hint">

Además del operador de asignación regular `=`, C++ proporciona
[_operadores de asignación aritmética_](https://en.cppreference.com/w/cpp/language/operator_assignment): 
`+=`, `-=`, `*=`, `/=`. 
Funcionan como podrías esperar – por ejemplo, la
expresión `x += 2` es equivalente a `x = x + 2`.

</div>