Implementa una función que devuelva el máximo de dos enteros.

```c++
int maxInt(int a, int b);
```

Por ejemplo, `maxInt(-1, 5)` debería devolver 5.

Para completar esta tarea, podrías encontrar conveniente 
usar el operador condicional descrito en la pista a continuación.

<div class="hint">

Además de la declaración condicional `if`, el lenguaje C++ también tiene un 
[_operador condicional ternario_](https://en.cppreference.com/w/cpp/language/operator_other#Conditional_operator) 
`?:`, que se puede usar como una expresión.

La expresión `b ? t : e` se evalúa como
* `t` si `b` se evalúa como `true` (o cualquier valor entero distinto de cero),
* `f` si `b` se evalúa como `false` (o valor entero cero).

</div>