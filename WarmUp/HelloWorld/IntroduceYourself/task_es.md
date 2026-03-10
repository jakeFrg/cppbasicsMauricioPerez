## ¡Preséntate!

Bien, esperamos que eso haya sido fácil.
A continuación, te invitamos a que te presentes.

Escribe un programa simple que pedirá el nombre de una persona
y luego imprimirá la cadena "Hola NombreUsuario"
(donde "NombreUsuario" debe ser sustituido por el nombre real proporcionado al programa).

Para hacer esto, necesitarás aprender algunas otras palabras en C++.

Primero, necesitarás usar una _variable_ para almacenar el nombre del usuario.
Una variable adecuada ya está declarada en la solución del template.

```c++
std::string name;
```

A continuación, para ingresar algunos datos en un programa C++, utiliza la siguiente sintaxis:

```c++
std::cin >> x;
```

donde `x` es la variable que deseas llenar con datos.

Para imprimir varias cadenas,
simplemente enumerarlas consecutivamente y sepáralas con `<<`.

```c++
std::cout << "Hola " << "Mundo!" << "\n";
```

Puedes imprimir variables usando la misma sintaxis que para imprimir cadenas.

Ten en cuenta que todas las líneas de código anteriores terminan con `;`.
De hecho, un programa C++ consiste en _instrucciones_,
es decir, pasos individuales de cómputo.
El punto y coma `;` indica el final de una instrucción.
Puedes construir tu programa a partir de instrucciones individuales
usando `;` para separarlas. Se recomienda poner cada
instrucción en una línea separada.

<div class="hint">

Para completar con éxito esta tarea,
asegúrate de terminar la línea con el carácter de nueva línea `'\n'`.
En general, en la programación en C++, es una buena práctica
siempre poner un carácter `'\n'` al final de la línea,
incluso si la instrucción de impresión es la última
y el programa termina inmediatamente después de ejecutarla.

</div>