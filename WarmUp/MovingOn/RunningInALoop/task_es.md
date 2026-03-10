¡Agreguemos más objetos consumibles a la escena!

Podemos almacenar varias variables del mismo tipo en un [_arreglo_](https://en.cppreference.com/w/cpp/language/array).

```c++
const int SIZE = 4;
Circle circles[SIZE];
```

El fragmento de código anterior define un arreglo que contiene 4 estructuras de tipo `Circle`. Para acceder al elemento `i`-ésimo del arreglo, use la sintaxis de corchetes. Tenga en cuenta que la indexación comienza desde `0`, es decir, el primer elemento del arreglo tiene el índice `0`.

```c++
// reasigna el radio del primer círculo en el arreglo 
circles[0].radius = 2.0f;
```

Al trabajar con arreglos, una de las tareas recurrentes es iterar sobre todos los elementos de un arreglo y realizar algunos cálculos con cada uno de ellos. Aquí la [instrucción](https://en.cppreference.com/w/cpp/language/for) `for` viene al rescate.

```c++
// imprime los radios de todos los círculos en el arreglo
for (int i = 0; i < SIZE; ++i) {
    std::cout << circles[i] << " ";
}
```

El bucle `for` consiste en lo siguiente:

* declaración de inicialización: `int i = 0`,
* expresión de condición: `i < SIZE`,
* expresión de iteración: `++i`,
* cuerpo del bucle: `std::cout << circles[i] << " ";`.

La ejecución del bucle `for` procede de la siguiente manera:
* cuando la ejecución alcanza el bucle `for`, se ejecuta la declaración de inicialización;
* a continuación, en cada iteración, se evalúa la expresión de condición:
  * si se evalúa como `true`, entonces la ejecución procede al cuerpo del bucle,
  * si se evalúa como `false`, entonces la ejecución sale del bucle;
* en cada iteración, después de que finaliza la ejecución del cuerpo del bucle, se ejecuta la expresión de iteración y la ejecución procede a la siguiente iteración.

Tenga en cuenta que arriba usamos un [operador de incremento](https://en.cppreference.com/w/cpp/language/operator_incdec) `++i`. Esta expresión incrementa el valor de la variable en `1` y devuelve el nuevo valor.

```c++
int x = 0;
int y = ++x;
// imprime "1, 1"
std::cout << x << ", " << y;
```

De manera similar, existe una expresión de decremento: `--i`.

```c++
int x = 0;
int y = --x;
// imprime "-1, -1"
std::cout << x << ", " << y;
```

Tanto las expresiones de incremento como de decremento pueden usarse en una forma prefija o postfija. Arriba, hemos visto el pre-incremento (y el pre-decremento): primero incrementa la variable y luego devuelve el nuevo valor. El post-incremento (y el post-decremento) se escribe como `x++` (o `x--` correspondientemente): también incrementa la variable pero devuelve su valor antes de la modificación.

En el bucle `for`, la expresión de condición y la expresión de iteración pueden ser arbitrariamente complejas. Esto ofrece gran flexibilidad al trabajar con bucles `for`. Por ejemplo, para iterar sobre los elementos con un índice par en el arreglo, se puede usar el siguiente código:

```c++
// imprime los radios de todos los círculos con un índice par en el arreglo
for (int i = 0; i < SIZE; i += 2) {
    std::cout << circles[i] << " ";
}
```

Con toda la teoría dada arriba, su próxima tarea es verificar las colisiones del objeto jugador con todos los objetos consumibles en la pantalla. Para hacerlo, implemente la siguiente función:

```c++
void collisionLoop(Circle player, Circle consumable[], bool consumed[], int size);
```

Toma la forma de círculo del objeto jugable y un arreglo de formas de objetos consumibles junto con el arreglo booleano de su estado:

* `consumed[i] == true` significa que el objeto `i`-ésimo está consumido;
* `consumed[i] == false` significa que el objeto `i`-ésimo no está consumido aún.

Ambos arreglos tienen el mismo tamaño igual al número total de objetos consumibles en la escena dada como el último argumento.

La función debe verificar si el objeto jugable colisiona con alguno de los objetos consumibles y, de ser así, establecer el estado del objeto correspondiente a "consumido". Tenga en cuenta que una vez que un objeto se consume, no puede cambiar su estado a "no consumido". Para detectar colisiones, use la función `collision` de los pasos anteriores.