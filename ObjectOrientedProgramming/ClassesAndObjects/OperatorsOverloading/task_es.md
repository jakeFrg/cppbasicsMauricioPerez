Antes de sumergirnos en la programación orientada a objetos, aprenderemos sobre otra característica útil del lenguaje C++ que puede ayudar a que tu código sea más fácil de leer y entender. Esta característica es __sobrecarga de operadores__; te permite definir varios operadores, como los operadores aritméticos `+`, `-`, `*`, para tus tipos de datos personalizados.

Recuerda la función `move` que implementaste antes. Al principio, tu tarea era implementarla para mover un objeto a lo largo del eje `x`. Es probable que tu código luciera así:

```c++
float move(float position, float velocity, float delta) {
    return position + delta * velocity;
}
```

En la siguiente etapa, tu tarea era reimplementar `move`, esta vez para mover un objeto a lo largo de los ejes `x` e `y`, usando nuestro tipo de dato personalizado `Point2D` y dos funciones `add` y `mul` definidas para él:

```c++
Point2D move(Point2D position, Point2D velocity, float delta) {
    return add(position, mul(delta, velocity));
}
```

Como puedes notar, sólo al mirar el código, es mucho más difícil comprender lo que está ocurriendo en el segundo fragmento de código. Afortunadamente, con la sobrecarga de operadores, es posible hacer que las dos versiones de la función `move` se vean idénticas:

```c++
Point2D move(Point2D position, Point2D velocity, float delta) {
    return position + delta * velocity;
}
```

Para habilitar esta sintaxis, es suficiente definir una función especial con el prefijo `operator` en su nombre:

```c++
Point2D operator+(Point2D a, Point2D b) {
    // tu código aquí
}
```

El lenguaje C++ permite la sobrecarga de un [gran número de operadores](https://en.cppreference.com/w/cpp/language/operators). Por favor, recuerda que, al igual que cualquier otra característica, la sobrecarga de operadores puede ser potencialmente mal utilizada. Se recomienda sobrecargar operadores solo si la notación correspondiente tiene una interpretación natural para tu tipo de datos personalizado.

Tu próxima tarea es implementar varios operadores sobrecargados para los tipos de datos utilizados en nuestro juego.

Comencemos con las operaciones familiares sobre el tipo de datos `Point2D`. Por favor, sobrecarga los operadores aritméticos `+`, `-`, `*` para este tipo de datos (sus firmas ya están dadas en la plantilla de la tarea). Se permite usar las funciones `add` y `mul` implementadas en pasos anteriores. Nota la diferencia entre el operador de sustracción y el operador unario menos — el primero resta las coordenadas de un punto de otro, mientras que el segundo solo cambia el signo de ambas coordenadas de un único punto.

Los operadores aritméticos también tienen interpretaciones naturales para los tipos de datos de formas, como `Circle` y `Rectangle`.

<div class="hint">

Por favor, ten en cuenta que un rectángulo se define por dos puntos: sus esquinas superior izquierda e inferior derecha:

```c++
struct Rectangle {
    Point2D topLeft;
    Point2D botRight;
};
```

</div>

Cuando se suma un punto a una forma, el punto se interpreta como un vector y la forma debería moverse en la dirección de este vector.
* Para la forma `Circle`, es suficiente sumar el punto al centro del círculo.
* Para `Rectangle`, se requiere sumar el punto a ambas esquinas del rectángulo.

Multiplicar una forma por un escalar debe dar como resultado una operación de escalado.
* Para `Circle`, es suficiente multiplicar el radio por el escalar.
* Para `Rectangle`, la implementación es un poco más complicada. Se requiere escalar el ancho y la altura del rectángulo y luego volver a calcular su esquina inferior derecha. Puedes usar las funciones predefinidas `width` y `height` para obtener las propiedades correspondientes del rectángulo (definidas en el archivo `rectangle.hpp`).

```c++
float width(const Rectangle& rect) {
    return rect.botRight.x - rect.topLeft.x;
}

float height(const Rectangle& rect) {
    return rect.botRight.y - rect.topLeft.y;
}
```

Finalmente, sería conveniente sobrecargar los operadores de comparación por igualdad para todos los tipos de datos mencionados anteriormente.

<div class="hint">

En el lenguaje C++, también es posible sobrecargar los operadores de entrada/salida para leer de o escribir en la terminal. Aquí hay un ejemplo de sobrecargas correspondientes para el tipo de datos `Point2D`:

```c++
// sobrecarga del operador de salida
std::ostream& operator<<(std::ostream& os, const Point2D& p) {
    return os << "(" << p.x << ", " << p.y << ")";
}

// sobrecarga del operador de entrada
std::istream& operator>>(std::istream& is, Point2D& p) {
    return is >> p.x >> p.y;
}
```

Observa los argumentos de tipo `std::ostream` y `std::istream` — son flujos de salida y entrada, respectivamente. Aunque aún no los hemos cubierto en este curso, serán temas en lecciones futuras. Por ahora, sin embargo, es suficiente saber que `std::cout` y `std::cin` (que hemos visto en lecciones anteriores) son objetos particulares de estas clases.

Por lo tanto, con la ayuda de las sobrecargas dadas anteriormente, es posible escribir el siguiente código:
```c++
Point2D point;
std::cout << "Por favor, introduce las coordenadas del punto (x, y)" << std::endl;
std::cin >> point;
std::cout << "Tu punto es " << point << std::endl;
```

Puedes encontrar las sobrecargas de los operadores de entrada/salida para los otros tipos de datos utilizados en nuestro juego en el archivo `operators.hpp`.

</div>