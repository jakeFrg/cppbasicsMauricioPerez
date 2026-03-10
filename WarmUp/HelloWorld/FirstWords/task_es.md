## Tu primer "Hello World" en C++

Comencemos nuestro viaje en C++ con algo sencillo. Vamos a escribir un programa que diga "Hello World!"

En C++, el punto de entrada al programa es una función distinguida llamada `main`. Tu tarea es agregar código a esta función para que imprima la cadena `"Hello World!"`

Para imprimir algo en C++, se puede usar la siguiente sintaxis:

```c++
std::cout << "Texto a imprimir\n";
```

Nota el carácter especial `'\n'` al final del mensaje impreso. Este es el llamado carácter de "nueva línea". No se imprime en la pantalla en sí, sino que hace que el cursor se mueva al comienzo de la siguiente línea. Esto significa que cualquier cosa impresa después de `\n` comenzará en una nueva línea. Por lo tanto, el siguiente código

```c++
std::cout << "Línea 1\n";
std::cout << "Línea 2\n";
```

imprimirá dos líneas:

```text
Línea 1
Línea 2
```

Para completar esta tarea con éxito, asegúrate de terminar también la línea después de la cadena `"Hello World!"`.