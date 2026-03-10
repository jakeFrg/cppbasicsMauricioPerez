## Errores relacionados con memoria y cómo evitarlos

La gestión manual de memoria en C/C++ otorga a los programadores un gran poder, ¡pero con este poder viene una gran responsabilidad! Los errores en la gestión de memoria pueden causar varios problemas, como bloqueos, corrupción de datos o vulnerabilidades de seguridad. En este paso, daremos ejemplos de algunos errores comunes relacionados con la memoria y luego mostraremos cómo el IDE CLion, con la ayuda de excelentes herramientas de terceros, puede ayudarte a descubrir y corregir estos desagradables errores.

### Escape de dirección

Ya estás familiarizado con el error de memoria _escape de dirección_. Ocurre cuando un puntero a una ubicación de memoria dentro del ámbito local de una función "escapa" de la función y se usa fuera de ella después de que la función ha regresado. Recordemos un ejemplo de uno de los pasos anteriores:

```c++
int* escape() {
    int a = 42;
    return &a;
}

void escapeCaller() {
    int* p = escape();
    std::cout << (void*) p << "\n";
}
```

### Acceso fuera de límites

Otro error relacionado con la memoria que ya hemos mencionado es el _acceso fuera de límites_. En pocas palabras, esto implica acceder a la memoria fuera del rango asignado.

```c++
char* a = (char*) malloc(8);
// este es un acceso válido
*(a + 2) = 1;
// este es un acceso fuera de límites
*(a + 9) = 2;
// este también es un acceso fuera de límites
*(a - 1) = 3;
```

### Fuga de memoria

Para desalojar un bloque de memoria asignado dinámicamente, necesitas tener un puntero hacia él. Si de alguna manera se pierde este puntero, no podrás desalojar la memoria. Este error de programación se conoce como una _fuga de memoria_.

Para ver un ejemplo de una fuga de memoria, considera la siguiente función.

```c++
void leak() {
    char* p = (char*) malloc(8);
    std::cout << (void*) p << "\n";
}
```

Esta función asigna un bloque de memoria de 8 bytes y luego termina. Sin embargo, el puntero a la memoria asignada no se devuelve al llamador ni se almacena en una variable global. De hecho, se pierde una vez que la función completa, lo que resulta en una fuga de memoria. Esto significa que el bloque de memoria asignado nunca podrá recuperarse.

### Uso después de liberar

Una vez que un bloque de memoria ha sido desalojado, un intento de desreferenciar el puntero que se refería a este bloque de memoria, o un intento de acceder a la memoria desalojada de cualquier otra forma, resultaría en un comportamiento indefinido. En la práctica, esto podría causar que tu programa se bloquee o que ocurra corrupción de datos.

```c++
char* p = (char*) malloc(8);
free(p);
// comportamiento indefinido
*p = 7;
```

### Liberación doble

De manera similar, un intento de desalojar memoria una segunda vez después de que ya ha sido liberada también puede causar problemas:

```c++
char* q = (char*) malloc(8);
free(q);
// comportamiento indefinido
free(q);
```

### Detección de errores de memoria

Por supuesto, los programadores ya han inventado algunas excelentes herramientas que pueden ayudar a detectar errores de memoria en tus programas, y el IDE CLion ofrece integraciones convenientes con dichas herramientas.

Las herramientas para detectar errores relacionados con la memoria realizan _monitoreo en tiempo de ejecución_ de tu programa. Inyectan comprobaciones adicionales en tu programa para asegurar que no se infrinjan reglas de gestión de memoria. Estas comprobaciones se realizan durante la ejecución del programa. Por lo tanto, el uso de verificadores de errores de memoria puede venir con algunas penalizaciones de rendimiento. Por esta razón, generalmente no están habilitados por defecto, sino solo durante la depuración o pruebas del programa.

Hay dos herramientas particularmente populares que ayudan a detectar errores de memoria:
- [AddressSanitizer](https://www.jetbrains.com/help/clion/google-sanitizers.html#AsanChapter)
- [Valgrind Memcheck](https://www.jetbrains.com/help/clion/memory-profiling-with-valgrind.html)

Intenta configurar una (o ambas) de estas herramientas en tu IDE utilizando la documentación de CLion (haz clic en los enlaces arriba). Luego, ejecuta el verificador de errores de memoria en el programa adjunto a este paso, que contiene todos los tipos de errores relacionados con la memoria mencionados aquí. ¡El detector de errores de memoria debería detectarlos todos!