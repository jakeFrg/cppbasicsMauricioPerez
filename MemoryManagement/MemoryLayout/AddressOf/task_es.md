Uno puede considerar la memoria de un programa como una secuencia de celdas de memoria. Cada variable ocupa una o más celdas de memoria. En las computadoras modernas, el tamaño de una celda de memoria individual es de 1 [byte](https://es.wikipedia.org/wiki/Byte). Así, por ejemplo, una variable de tipo `std::int32_t` ocupará 4 celdas de memoria (4 bytes).

Cada celda de memoria está asociada a un número único: su *dirección*.

La dirección de una variable es simplemente la dirección de la primera celda de memoria ocupada por esta variable. En particular:
* La dirección de una variable de arreglo es la dirección de la primera celda de memoria del primer elemento en el arreglo.
* La dirección de una variable de estructura personalizada es la dirección de la primera celda de memoria del primer campo de la estructura.

En C++, es posible solicitar la dirección de una variable; por ejemplo, para imprimirla en la terminal. Esto se puede hacer colocando el operador *dirección de* `&` delante del nombre de la variable.

```c++
int a;
std::cout << &a << "\n";
```

El pequeño programa adjunto a esta tarea imprime la dirección de una variable `int`. Ejecute el programa para ver la dirección. Note que las direcciones de memoria se muestran tradicionalmente en [formato hexadecimal](https://es.wikipedia.org/wiki/Hexadecimal).