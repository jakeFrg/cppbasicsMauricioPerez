Implementa una aplicación de calculadora simple en consola. 
Debe leer el comando del usuario desde la consola, ejecutarlo, 
e imprimir el resultado al usuario. 
La calculadora debe admitir los siguientes comandos:
* `sum n m` – suma de dos números `n` y `m`;
* `sub n m` – resta de `m` de `n`;
* `mul n m` – multiplicación de dos números `n` y `m`;
* `div n m` – división entera de `n` entre `m`;
* `exit` – un comando especial para salir de la aplicación de la calculadora.

Tanto `n` como `m` representan números enteros; 
puedes asumir que estos enteros están dentro 
del rango `-10000 ... 10000`.

Un ejemplo de ejecución de tu aplicación debería ser como este:

* el usuario ingresa un comando

```c++
mul 3 4
```

* la aplicación imprime el resultado

```c++
12
```

* el usuario ingresa el siguiente comando

```c++
sum -1 12
```

* la aplicación imprime el resultado

```c++
11
```

* finalmente, el usuario ingresa el comando para salir

```c++
exit
```

* y la aplicación debería terminar en respuesta.

En caso de que el usuario proporcione un comando incorrecto, 
la aplicación debería responder educadamente e imprimir el siguiente mensaje:

```c++
Lo siento, no pude entender tu comando
```

Luego debería esperar el siguiente comando.

Para esta tarea, podrías encontrar útil la información 
sobre las sentencias `break` y `continue` en C++ proporcionadas en la pista a continuación.

<div class="hint">

Las sentencias `break` y `continue` te permiten 
salir de un bucle antes de tiempo, de manera similar a cómo saldrías de una 
función anticipadamente usando la sentencia `return`.

Cuando la ejecución alcanza la sentencia `break` 
[statement](https://en.cppreference.com/w/cpp/language/break), 
sale del bucle más cercano inmediatamente (ya sea `for` o `while`):

```c++
for (int i = 1; i <= 4; ++i) {
    if (i > 2) {
        break;
    }
    std::cout << i << " ";
}
// imprime 1 2
```

Cuando la ejecución alcanza la sentencia `continue` 
[statement](https://en.cppreference.com/w/cpp/language/continue), 
omite el resto del cuerpo del bucle más cercano 
y comienza a ejecutar la siguiente iteración de dicho bucle 
(verificando primero la condición del bucle).

```c++
for (int i = 1; i <= 4; ++i) {
    if (i == 2) {
        continue;
    }
    std::cout << i << " ";
}
// imprime 1 3 4
```

</div>