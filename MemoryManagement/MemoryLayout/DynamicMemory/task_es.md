La región de memoria dinámica permite sortear las limitaciones de las regiones de memoria estática y de pila. Nos permite gestionar la memoria asignada _dinámicamente_ y _manualmente_, haciendo posible, por ejemplo, devolver la dirección de memoria de una variable asignada dentro de la función al llamador. Sin embargo, esta flexibilidad tiene un precio: el programador debe realizar un seguimiento cuidadoso de la memoria asignada dinámicamente asegurándose de que:

* Eventualmente se desasigne (evitando así la situación en la que el programa se quede sin memoria), y
* Una vez desasignada, el programa nunca vuelva a acceder a ella (de lo contrario, puede bloquearse o leer basura).

La función `malloc` de la biblioteca estándar se utiliza para asignar un bloque de memoria. Requiere el tamaño, en bytes, del bloque de memoria que se va a asignar.

```c++
// asigna 8 bytes
char* p = (char*) malloc(8);
```

Ten en cuenta que `malloc` devuelve un puntero _sin tipo_ `void*`. Para convertirlo a un puntero con tipo `char*`, utilizamos el __operador de conversión de tipo estilo C__ `(char*)`. Discutiremos las conversiones de tipo con más detalle más adelante en este módulo.

La memoria asignada está __sin inicializar__, y debe inicializarse manualmente antes de intentar leerla.

```c++
for (int i = 0; i < 8; ++i) {
    p[i] = 0;
}
```

Al asignar un array de variables de algún tipo, un esquema común es calcular el tamaño del bloque de memoria necesario utilizando el operador `sizeof`.

```c++
// asigna 8 enteros
int* q = (int*) malloc(8 * sizeof(int));
```

Cuando el tamaño pasado a `malloc` es igual a `0`, el resultado no está especificado. Puede ser un puntero nulo, pero también podría dar como resultado un puntero no nulo. Independientemente, desreferenciar o desasignar este puntero está prohibido.

```c++
// el resultado no está especificado
int* r = (int*) malloc(0);
```

Para desasignar un bloque de memoria previamente asignado, utiliza la función `free`. Toma un solo argumento: el puntero al bloque de memoria que se va a desasignar.

```c++
free(p);
free(q);
```

Es muy importante __desasignar__ la memoria una vez que ya no se necesita. De lo contrario, se desperdicia, y si desperdicias una gran cantidad de memoria, tu programa corre el riesgo de quedarse sin memoria.