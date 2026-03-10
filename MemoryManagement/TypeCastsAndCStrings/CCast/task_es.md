Hay muchas situaciones en las que una variable de un tipo debería ser tratada como una variable de otro tipo. 
Por ejemplo, considere la función `sqrt` de la biblioteca estándar. 
Esta función calcula la raíz cuadrada y espera un argumento de tipo `double`. 
Sin embargo, ¿qué ocurre si queremos calcular la raíz cuadrada de un entero, como `4`? 
Si intentamos pasar una variable `int` a la función `sqrt`, 
será _convertida implícitamente_ en un `double`.

```c++
int x = 4;
// imprime 2.0
std::cout << sqrt(x) << "\n";
```

Los lenguajes C y C++ tienen un conjunto grande y complejo (y ligeramente diferente) 
de [reglas](https://en.cppreference.com/w/cpp/language/implicit_conversion) 
sobre cuándo y cómo se pueden realizar conversiones de tipo implícitas. 
Estas reglas incluyen conversiones entre tipos numéricos (como `int` o `double`). 
Es importante destacar que las conversiones que pueden resultar en pérdida de información 
también están permitidas. Por ejemplo, una variable `double` puede ser convertida en un `int`.

```c++
double pi = 3.14;
int a = pi;
// imprime 2
std::cout << a << "\n";
```

Sin embargo, no todas las conversiones de tipo razonables se pueden realizar implícitamente. 
En tales casos, se puede usar el _operador de conversión de tipo en estilo C_. 
Ya lo hemos visto al trabajar con `malloc`. 
Recuerde que `malloc` solo asigna una región de memoria contigua, 
a la que no se le asigna tipo alguno. Por lo tanto, devuelve un puntero de tipo `void*`. 
Si el objetivo es asignar un array de, por ejemplo, enteros, 
este puntero se puede convertir explícitamente a `int*`:

```c++
void* q = malloc(2 * sizeof(int));
int* qi = (int*) q;
qi[0] = 42;
```

Note que el operador de conversión de tipo en estilo C es muy permisivo 
y no realiza ninguna verificación de seguridad. Su uso indebido puede llevar a un comportamiento indefinido. 
Por ejemplo, considere el siguiente programa, 
que accidentalmente asigna solo 2 bytes de memoria en lugar de 
memoria suficiente para 2 `int`s. 
Luego intenta escribir un valor `int` 
en la memoria asignada (asumiendo `sizeof(int) == 4`). 
Esta operación de escritura también podría afectar la memoria más allá del rango asignado, 
lo que podría llevar a resultados inesperados.

```c++
void* r = malloc(2);
int* ri = (int*) r;
// comportamiento indefinido !!!
ri[0] = 42;
```

Por esta razón, las conversiones de tipo en estilo C deben usarse con precaución. 
El conjunto exacto de reglas de conversión de tipos permitidas por las conversiones en estilo C 
se puede encontrar [aquí](https://en.cppreference.com/w/c/language/cast).