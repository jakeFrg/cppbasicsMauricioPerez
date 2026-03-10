Anteriormente, has implementado una función que puede mover un objeto horizontalmente. 
Ahora, vamos al espacio bidimensional, y tu tarea es 
hacer que el objeto también se mueva verticalmente. 

Recuerda la fórmula para actualizar la coordenada x de un objeto:

```
x' = x + d * v
```

¡Para mover un objeto verticalmente, puedes usar la misma fórmula!

```
y' = y + d * v
```

Ahora, si queremos mover un objeto en 2 dimensiones simultáneamente, 
una forma de hacerlo sería implementar dos funciones
`moveX` y `moveY`. Cada una de ellas actualizará la coordenada correspondiente independientemente de la otra.

¿Podemos hacerlo mejor? Sí, podemos.
En lugar de seguir el camino descrito anteriormente, tomaremos el camino más difícil.
Como verás rápidamente, este camino más difícil valdrá la pena.

La programación se trata de modelar un mundo.
Y para modelar una escena 2D, necesitaremos conceptos adecuados.
Uno de esos conceptos es el concepto de un punto bidimensional.
Dicho punto consta de dos números, las coordenadas x e y del punto.

Hemos visto tipos de C++ que se pueden usar para modelar un número:
por ejemplo, el tipo `float`. Pero, ¿cómo podemos modelar un punto 2D?
Afortunadamente, C++ nos permite construir nuevos tipos a partir de los existentes. 
Podemos declarar nuestro propio tipo de puntos 2D.

```c++

struct Point2D {
    float x;
    float y;
};

``` 

El fragmento de código anterior declara un nuevo tipo
llamado `Point2D`, que consta de dos _campos_
de tipo `float` llamados `x` y `y`.
En C++, los nuevos tipos construidos de esta manera como un agregado de 
otros tipos también se llaman 
[_estructuras_](https://en.cppreference.com/w/c/language/struct),
de ahí la palabra clave `struct`.
Los campos de una estructura también se llaman _miembros_.

Después de definir el nuevo tipo, 
podemos declarar variables de este nuevo tipo.

```c++ 
Point2D p;
```

El código anterior definirá una variable no inicializada de tipo `Point2D`.
Como recordarán, dejar variables sin inicializar es una mala práctica.
Para inicializar una variable de tipo `struct`, se puede usar la siguiente sintaxis:   

```c++ 
Point2D p = { 0.0, 0.0 };
```

Es decir, puedes enumerar valores de inicialización para todos los miembros de una `struct` en llaves.
Ten en cuenta que los miembros se inicializan en el mismo orden en que se especifican en la definición de la `struct`.

Para acceder a los miembros de la estructura, se puede usar la sintaxis de _punto_.

```c++
float x = p.x; // accediendo a la coordenada x
float y = p.y; // accediendo a la coordenada y
```

Los puntos se pueden sumar igual que los números.
Para sumar dos puntos `u` y `v`, necesitamos sumar sus coordenadas.

```
c.x = a.x + b.x
c.y = a.y + b.y
```

Como parte de esta tarea, necesitas implementar la función
que sumará dos puntos:

```c++
Point2D add(Point2D a, Point2D b)
```

Además, los puntos se pueden multiplicar por un número.
Para multiplicar el punto `a` por el número `s`,
necesitamos multiplicar cada coordenada por ese número.

```
b.x = s * a.x
b.y = s * a.y
```

También necesitarás implementar esta función.

```c++
Point2D mul(float s, Point2D a)
```

Ahora podemos repensar nuestra fórmula de movimiento en términos de puntos 2D.
Note que esta fórmula involucra los siguientes elementos:

* La __posición__ anterior del objeto. Puede modelarse como un punto 2D `p`.
* La __velocidad__ del objeto. Dado que el objeto puede moverse tanto en direcciones horizontal
  como vertical, también podemos modelarlo como un punto 2D `v`.
  La coordenada `x` de este punto nos da la dirección horizontal
  del objeto, y la coordenada `y` del punto nos da su dirección vertical.
* Un __delta de tiempo__, el número de milisegundos transcurridos desde la última
  actualización de la posición del objeto. Esto es solo un número `d`.

Ahora la fórmula es la siguiente:

```
p' = p + d * v
```

Nota cómo esta nueva fórmula es de hecho solo una manera "inteligente"
de escribir las dos fórmulas para actualizar cada coordenada independientemente.
Puede pensar que este truco no hace mucha diferencia:
en lugar de dos líneas de código, podemos usar solo una línea.
Sin embargo, a medida que tus tareas se vuelvan más desafiantes,
notarás que trabajar con cada coordenada
de un objeto independientemente es muy frustrante y
requiere mucho copiar y pegar el mismo código.
El propósito de los buenos lenguajes de programación es salvarte
de esta carga al darte una manera de construir tus propias _abstracciones_
(como puntos bidimensionales) adecuadas para modelar tu problema.

Como paso final de esta tarea, necesitas implementar una
nueva función para mover un objeto en dos dimensiones
usando las funciones de sumar puntos y multiplicar un punto por un número.

```c++
Point2D move(Point2D position, Point2D velocity, float delta);
```

Si lo implementas correctamente, deberías ver el objeto
moverse diagonalmente hacia la esquina inferior derecha de la ventana.