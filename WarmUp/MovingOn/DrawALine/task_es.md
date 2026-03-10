Es un poco desafortunado que actualmente el planeta pueda volar fuera del área visible. ¡Corrijamos eso!

Necesitamos detectar cuando el objeto se aproxima a los bordes de la ventana y ajustar su posición para que no sobrepase el área visible. Tu trabajo es implementar la función

```c++
Point2D adjustToBorders(Point2D position)
```

Dada la posición de un objeto, ajusta la posición para que se ajuste a los bordes.

Para hacer eso, necesitas aprender otra parte de la sintaxis de C++: la [instrucción](https://en.cppreference.com/w/cpp/language/if) `if`. Te permite probar alguna condición y ramificar la ejecución dependiendo del resultado de esta prueba.

```c++
if (a <= b) {
    std::cout << "a <= b";
} else {
    std::cout << "a > b";
}
```

En el código anterior, probamos si el número almacenado en la variable `a` es menor o igual al almacenado en `b`:
* si esto es verdadero, entonces se imprime la cadena `a <= b`;
* si esto es falso, entonces se imprime la cadena `a > b`.

Puedes omitir la rama `else`.

```c++
if (a <= b) {
    std::cout << "a <= b";
}
```

También puedes apilar varias pruebas consecutivas usando la sintaxis `else if`:

```c++
if (a < b) {
    std::cout << "a < b";
} else if (a == b) {
    std::cout << "a == b";
} else {
    std::cout << "a > b";
}
```

Nota aquí que para comparar dos números por igualdad, usamos el operador `==`. No lo confundas con el operador de asignación `=`. Por ejemplo, el siguiente código también compila, pero lo que realmente hará no es exactamente lo que podrías esperar:

```c++
if (a = b) {
    std::cout << "a = b";
} 
```

En lugar de comparar `a` y `b`, asigna el valor de `b` a `a` y luego verifica si `a` no es igual a cero.

Volviendo a tu tarea, necesitarás comparar la posición actual del objeto con el borde, y si excede el borde, necesitas reasignarla para que se ajuste dentro del borde.

Ya hemos definido los bordes para ti:

```c++
const float NORTH_BORDER = 0.0f;
const float SOUTH_BORDER = 600.0f;
const float WEST_BORDER  = 0.0f;
const float EAST_BORDER  = 800.0f;
```

Observa la nueva palabra clave `const`. Te permite definir una variable inmutable cuyo valor no puede ser reasignado.

También, ten en cuenta que para comparar la posición del objeto con el borde, ¡también necesitas considerar el radio del círculo!

```c++
const float RADIUS = 40.0f;
``` 

Si tienes dificultades para completar la tarea, ¡por favor utiliza la pista a continuación!

<div class="hint">

Por ejemplo, la comprobación y ajuste contra el borde oeste debería verse así:

```c++
if (result.x - RADIUS < WEST_BORDER) {
  result.x = WEST_BORDER + RADIUS;
}
```    

</div>