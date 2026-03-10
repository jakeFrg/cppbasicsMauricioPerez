Recuerde que la memoria es solo una secuencia de celdas de memoria direccionables. 
¿Significa esto que, dado la dirección de una celda de memoria, 
podemos "avanzar" en esta secuencia y observar la "siguiente" celda de memoria?
¿Podemos dar un salto y mirar una celda de memoria ubicada a una distancia de, digamos, 5 pasos?
O, dadas dos direcciones de memoria, ¿podríamos calcular qué tan lejos están una de otra?

La respuesta es SÍ, pero hay algunas particularidades.

Consideremos un arreglo del tipo `char`.

```c++
const int SIZE = 8;
char a[SIZE] = "abcdefgh";
```

<div class="hint">

Recuerde que `char` es un tipo utilizado para codificar caracteres ASCII. 
Se garantiza que este tipo tiene un tamaño de 1 byte, es decir, 
el tamaño de la celda de memoria direccionable mínima. 
Por lo tanto, a menudo es conveniente usar el tipo `char*` para almacenar las direcciones de las celdas de memoria.

</div>

Definamos un puntero que apunte al primer elemento de este arreglo.

```c++
char* p0 = &a[0];
```

Ahora, `p0` apunta al primer elemento del arreglo.

```c++
std::cout << *p0 << "\n";
// imprime a
```

Para dar un paso más y ver el siguiente elemento, 
podemos sumar un valor entero `1` al puntero `p0`.

```c++
char* p1 = p0 + 1;
```

Ahora, `p1` apunta al segundo elemento del arreglo.

```c++
std::cout << *p1 << "\n";
// imprime b
```

No es necesario guardar el puntero derivado en una variable; 
también podemos desreferenciarlo directamente.

```c++
std::cout << *(p0 + 1) << "\n";
// también imprime b
```

También se pueden aplicar incrementos y decrementos a los punteros.

```c++
char* p = p0;
++p;
std::cout << *p << "\n";
// también imprime b
```

De manera similar, es posible obtener un puntero a cualquier elemento de un arreglo.

```c++
std::cout << *(p0 + 5) << "\n";
// imprime f
```

¡PERO solo podemos saltar dentro del bloque de memoria ocupado por el arreglo `a`!
¡El acceso a las celdas de memoria fuera del bloque ocupado por 
el arreglo lleva a un comportamiento indefinido!
Por ejemplo, el siguiente fragmento de código es erróneo.

```c++
std::cout << *(p0 + 20) << "\n";
```

Esto podría no causar inmediatamente que el programa falle.
Sin embargo, y esto podría ser aún peor, el comportamiento del programa es indefinido: 
podría imprimir cualquier valor, o no imprimir nada en absoluto, 
o hacer algo completamente diferente.

<div class="hint">

Esta no es la primera vez que encontramos el término *comportamiento indefinido*. 
Prometemos que eventualmente daremos una explicación más detallada de lo que significa 
y sus consecuencias prácticas.
Por ahora, solo recuerde que debe evitar el *comportamiento indefinido* en sus programas.

</div>

Restar un valor entero de un puntero también es una operación válida: 
solo recuerde que el puntero debe permanecer dentro del bloque de memoria del arreglo.

```c++
char* q = p1 - 1;
std::cout << *q << "\n";
// imprime a
```

Además, es posible obtener la diferencia entre dos punteros,
es decir, calcular la distancia entre ellos en términos del número de celdas de memoria.

```c++
char* p8 = p0 + 8;
int diff = p8 - p0;
std::cout << diff << "\n";
// imprime 8
```

El comportamiento de las operaciones aritméticas en punteros en realidad depende del tipo del puntero.
Específicamente, depende del tamaño del tipo al que apunta.

Por ejemplo, consideremos un arreglo del tipo `int` en lugar de `char`.

```c++
int b[SIZE] = { 0, 1, 2, 3, 4, 5, 6, 7 };
```

Si tomamos un puntero al inicio del arreglo y luego lo avanzamos en `1`, 
obtenemos un puntero que apunta al segundo elemento del arreglo, 
no a la segunda celda de memoria.

```c++
int* r = &b[0];
++r;
std::cout << *r << "\n";
// imprime 1
```

Recuerde que `int` típicamente ocupa `4` bytes.
Bajo esta suposición, la variable `r` apunta a la `4`ta celda de memoria.   

En general, dado un puntero del tipo `T*`, la expresión `p + n` 
es equivalente a `p + n * sizeof(T)` si "medimos" `p` en términos de celdas de memoria. 
Es decir, se puede ver un puntero como una escala con el tamaño del tipo 
al que apunta actuando como su unidad de medida.

En resumen, todas las operaciones con punteros que mencionamos anteriormente se conocen como **aritmética de punteros**.
Esto incluye:

* Sumar un desplazamiento entero a un puntero: `p + n`;
* Restar un desplazamiento entero de un puntero: `p - n`;
* Incrementar y decrementar punteros: `p++`, `--p`, etc.;
* Calcular la distancia entre punteros: `p - q`.

Arriba, `p` y `q` son punteros y `n` es un entero.

Recuerde que los operadores de aritmética de punteros solo son aplicables 
a punteros del mismo arreglo, es decir, a la región de memoria
dentro del rango `p` .. `p + size` (inclusive), donde:
* `p` es el puntero al inicio del arreglo, y
* `size` es el tamaño del arreglo.

Además de estas operaciones aritméticas, los operadores de comparación también son aplicables a punteros:

* Verificar la (des)igualdad de punteros: `p == q`, `p != q`;
* Comparar punteros: `p <= q`, `p > q`, etc.

Tenga en cuenta que cualquier par de punteros se puede verificar para (des)igualdad, 
pero solo los punteros que apuntan al mismo bloque de memoria 
(es decir, ocupados por el mismo arreglo)
se pueden comparar utilizando el operador menor o igual a `<=` y operadores similares.