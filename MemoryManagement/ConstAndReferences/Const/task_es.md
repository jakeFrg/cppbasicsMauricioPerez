En este curso, ya hemos encontrado la palabra clave `const`. Recuerde, permite definir una variable inmutable (o simplemente una _constante_): solo se puede asignar un valor a dicha variable una vez durante su definición y no se puede reasignar más tarde.

Similar a las variables ordinarias mutables, es posible tomar la dirección de una variable constante y almacenarla en una variable puntero. Sin embargo, la inmutabilidad de la memoria apuntada debe reflejarse en el tipo del puntero:

```c++
const int x = 5;
const int* p = &x;
```

De esta manera, indicamos al compilador que `p` apunta a una memoria inmutable. Luego, nos puede informar un error de compilación si intentamos eludir la restricción de inmutabilidad usando un puntero:

```c++
// el siguiente código causará un error de compilación
*p = 6;
```

De manera similar, nos impide almacenar la dirección de una constante en un puntero ordinario:

```c++
// este código también causa un error de compilación
int* q = &x;
```

Tenga en cuenta que el tipo `const int*` es un tipo de punteros a una variable entera constante. Sin embargo, la variable puntero en sí no es constante y se puede reasignar:

```c++
const int y = 11;
p = &y;
```

Por el contrario, es posible crear un puntero constante a una variable mutable. Mientras que el puntero en sí es constante y no se puede reasignar, la variable a la que apunta aún se puede reasignar a través de dicho puntero:

```c++
int z = 17;
int* const r = &z;
*r = 21;
// imprime 21
std::cout << z << "\n";
// el siguiente código causa un error de compilación
int w = 32;
r = &w;
```

Por lo tanto, la semántica del tipo de puntero depende de la posición de la palabra clave `const` relativa a `*`:
- si `const` se pone antes de `*`, entonces significa la inmutabilidad de la memoria apuntada;
- si se pone después de `*`, entonces significa la inmutabilidad del propio puntero.

Por supuesto, es posible combinar ambos y definir un puntero constante a una variable constante:

```c++
const int* const s = &x;
// esta línea causa un error de compilación
*s = 0;
// así como esta
s = &y;
```

La siguiente tabla resume la semántica del modificador `const` aplicado a los tipos:

| Tipo                  | Descripción                                              |
|-----------------------|----------------------------------------------------------|
| `const int`           | números enteros constantes                               |
| `const int*`          | punteros a números enteros constantes                    |
| `int* const`          | puntero constante a números enteros (mutables)           |
| `const int* const`    | puntero constante a números enteros constantes (inmutables) |