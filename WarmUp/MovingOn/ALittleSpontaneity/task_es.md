Es un poco aburrido que el objeto consumible siempre aparezca en el mismo lugar. Agreguemos un poco de aleatoriedad a su posición.

En este paso, tu tarea es implementar la siguiente función:

```c++
Circle generateCircle(float radius);
```

Esta función debe generar un círculo aleatorio con el radio dado dentro de los límites de la escena. En esencia, debe generar el punto central de este círculo. En otras palabras, esta tarea se puede reducir a la tarea de generar un número de punto flotante dentro de cierto rango.

```c++
float generateCoordinate(float min, float max);
```

Al generar un punto aleatorio en 2D usando `generateCoordinate`, recuerda que las siguientes constantes definen los límites de la escena:
* `NORTH_BORDER`
* `SOUTH_BORDER`
* `WEST_BORDER`
* `EAST_BORDER`

Además, asegúrate de que el círculo resultante quepa dentro de los límites.

Para implementar `generateCoordinate` en sí, puedes usar la 
[función](https://en.cppreference.com/w/c/numeric/random/rand) `rand` 
proporcionada por C++.

```c++
// genera un número entero aleatorio entre 0 y RAND_MAX 
int i = rand();
```

`RAND_MAX` es una 
[constante](https://en.cppreference.com/w/cpp/numeric/random/RAND_MAX) 
especial también definida en C++.

Ten en cuenta que en tus programas debes inicializar el generador de números aleatorios de C++ antes del primer uso de la función `rand`.

```c++
// inicializa el generador de números aleatorios 
// pasando la hora actual como fuente de aleatoriedad.
srand(time(NULL));
```

En la tarea actual, ya lo hicimos en la función `main`, por lo que no tienes que hacerlo. Solo puedes llamar a `rand`.

Sin embargo, `rand` genera un número entero aleatorio, mientras que necesitamos un número de punto flotante aleatorio dentro de cierto rango. Para lograr esto último, usa la siguiente fórmula:

```
x = min + r / (R / (max - min))
```

donde 
* `x` es el número de punto flotante aleatorio resultante,
* `min` y `max` son los límites del rango,
* `r` es un número entero aleatorio,
* `R` es el número entero máximo `RAND_MAX`.