Escribe una función que copie un arreglo de enteros.

```c++
int* copiar(int* p, size_t tamaño);
```

Esta función debe recibir como argumentos el puntero al inicio del arreglo
y el tamaño del arreglo, asignar una cantidad suficiente de memoria
para la copia del arreglo, y luego inicializar esta memoria
copiando el contenido del arreglo.
Si el tamaño del arreglo es cero, la función debe devolver un puntero nulo.