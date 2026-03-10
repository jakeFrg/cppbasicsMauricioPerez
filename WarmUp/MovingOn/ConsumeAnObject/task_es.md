Agreguemos a la escena otro objeto consumible en forma de una pequeña estrella. Cuando el objeto jugable toca este objeto consumible, este último debe desaparecer.

Para lograrlo, necesitarás implementar un [detector de colisiones](https://es.wikipedia.org/wiki/Detecci%C3%B3n_de_colisiones) simple. Su tarea es señalar cuándo dos objetos chocan en la escena. Utilizaremos el hecho de que ambos objetos tienen formas circulares; esta suposición simplificará significativamente la tarea.

Creemos otro tipo para representar formas circulares.

```c++
struct Circle {
    Point2D center;
    float radius;
};
```

Ahora necesitas implementar la siguiente función.

```c++
bool collision(Circle circle1, Circle circle2);
```

Toma dos círculos y
* devuelve `true` si chocan,
* devuelve `false` en caso contrario.

Para detectar cuándo dos círculos chocan, es suficiente comprobar que la distancia entre sus centros es menor que la suma de sus radios. Para calcular la distancia entre dos puntos, implementa la función correspondiente:

```c++
float distance(Point2D a, Point2D b);
```

Recuerda que la distancia entre dos puntos en un espacio bidimensional se puede calcular de la siguiente manera:

```
dx = x1 - x2
dy = y1 - y2
d = sqrt(dx * dx + dy * dy)
```

Aquí,
* `x1`, `y1`, `x2`, `y2` son las coordenadas de los dos puntos,
* `d` es la distancia resultante,
* `dx` y `dy` son las diferencias entre los puntos a lo largo de los ejes `x` e `y`,
* `sqrt` es la raíz cuadrada.

Por suerte, el lenguaje C++ ya tiene la función `sqrt` [implementada](https://en.cppreference.com/w/cpp/numeric/math/sqrt), así que no tendrás que implementar la tuya propia:

```c++
float sqrt(float x);
```