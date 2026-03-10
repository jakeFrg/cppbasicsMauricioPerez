En C++, las direcciones son ciudadanos de primera clase, lo que significa que los programadores pueden manipularlas como cualquier otro tipo de datos: almacenar direcciones en variables, pasarlas como argumentos de funciones, imprimirlas en la terminal, etc.

Una variable que almacena la dirección de una celda de memoria se llama **puntero**. En C++, no existe un solo tipo de datos *puntero*; en su lugar, los punteros tienen un tipo adicional basado en el tipo de la región de memoria a la que apuntan. Por ejemplo, el tipo `int*` denota un tipo de punteros que apuntan a una región de memoria que contiene un valor de tipo `int`. Como puedes ver, para crear un tipo de datos de puntero, necesitas añadir la palabra clave `*` *después* del tipo de datos a apuntar. Nota que puedes crear tipos de punteros de complejidad arbitraria: por ejemplo, `int**` denota un tipo de punteros a un puntero a `int`.

Como mencionamos, los punteros se utilizan para almacenar direcciones de variables:

```c++
int a = 42;
// p almacena la dirección de la variable a
int* p = &a;
// también decimos que p apunta a a
```

El proceso de obtener el valor al que apunta un puntero también se llama **desreferenciar** el puntero. Esto se hace con la ayuda del operador de desreferencia `*`.

```c++
int b = *p;
std::cout << b << "\n";
// imprime 42
```

Nota que hay una diferencia entre leer el valor almacenado en un puntero (es decir, la dirección del objeto) y desreferenciar el puntero y leer el valor al que apunta.

```c++
// imprime el valor del puntero p - 
// es decir, la dirección de una celda de memoria,
// por ejemplo, 0x7ffee3c260cc; 
// (el valor real no es determinista y 
// puede cambiar entre diferentes ejecuciones del mismo programa) 
std::cout << p << "\n";
// imprime el valor al que p apunta, 
// en este caso, 42
std::cout << *p << "\n";
```

Usando el operador de desreferencia, es posible tanto leer los datos apuntados como reescribirlos.

```c++
*p = 23;
std::cout << *p << "\n";
// imprime 23
std::cout << a << "\n";
// también imprime 23
std::cout << b << "\n";
// pero la última línea imprime 42!
```

Puedes copiar un puntero a otro puntero:

```c++
int* q = p;
// tanto p como q apuntan a a
```

También puedes reasignar un puntero:

```c++
int c = 23;
p = &c;
// ahora p apunta a c
// pero q todavía apunta a a
```