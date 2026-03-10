En las tareas anteriores, hemos añadido a la escena un número predefinido de objetos consumibles. Pero, ¿qué pasa si queremos crear un número aleatorio de objetos consumibles entre 1 y 10? ¿Podemos hacerlo de la misma manera que hemos generado posiciones aleatorias de objetos consumibles?

Intentémoslo. Primero, observa la línea de código en [main.cpp](course://WarmUp/MovingOn/LimitsOfPossible/src/main.cpp) que define el [array](psi_element://main::consumable) de objetos consumibles.

```c++
const int COUNT = 4;
sf::CircleShape consumable[COUNT];
```

La siguiente línea de código genera un valor entero aleatorio en el rango de 1 a 10.

```c++
int count = 1 + rand() % 10;
```

Aquí `%` es el operador de resto de división.

Intente reemplazar la constante `COUNT` con el número aleatorio generado `count` y luego ejecute el programa. Una vez que termine su intento, lea la sugerencia a continuación.

<div class="hint">

Debería ver que la construcción del programa falla con el siguiente mensaje (o uno similar):

```
error: se utilizó un array de longitud variable ‘consumable’
```

Como puede adivinar, el problema se debe a la definición de un array con el tamaño igual a `count`.

`COUNT` es una constante, su valor es **estático**, y se conoce antes de que el programa se ejecute, es decir, en **tiempo de compilación**. Esto significa que cuando definimos un array de tamaño igual a `COUNT`, el tamaño de este array ya puede calcularse y la cantidad requerida de memoria puede ser asignada.

Contrario a lo anterior, `count` es una variable y su valor es **dinámico** – no se conoce antes de ejecutar el programa, es decir, solo se conoce en **tiempo de ejecución**. Por lo tanto, la cantidad de memoria necesaria para ser asignada no puede calcularse a priori, y la construcción del programa falla.

¿Significa todo lo anterior que no podemos crear un array de tamaño dinámico? Por supuesto que no. Sin embargo, para hacerlo, primero necesitas aprender acerca de los diferentes tipos de regiones de memoria disponibles para tu programa y otros matices de gestión de memoria. ¡Eso es exactamente lo que vamos a estudiar en las próximas lecciones!

</div>