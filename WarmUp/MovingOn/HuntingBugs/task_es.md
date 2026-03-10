Antes de continuar, hay otro tema importante que debemos mencionar: la depuración de programas.

Todos cometen errores, incluidos los programadores. Los errores en los programas también se conocen como _bugs_.

A veces, encontrar errores en el código puede ser difícil. Para facilitar este proceso, los programadores han inventado varias herramientas que les ayudan a encontrar errores en los programas. Una de estas herramientas es el __depurador__.

El depurador te permite recorrer tu programa paso a paso y examinar el estado de las variables durante la ejecución. Puedes aprender a usar el depurador en el IDE de Clion consultando el [tutorial](https://www.jetbrains.com/help/clion/debugging-code.html) correspondiente.

Para que puedas experimentar la depuración en el IDE, hemos preparado esta tarea. Hemos implementado una nueva funcionalidad en nuestro juego, pero deliberadamente hemos introducido varios errores en su implementación. Tu tarea es intentar encontrarlos utilizando el depurador. A continuación, encuentra la descripción del comportamiento previsto de la nueva funcionalidad.

Hemos agregado otra función:

```c++
void approachingLoop(Circle player, Circle consumable[], bool concerned[], int size);
```

Es similar a la función `collisionLoop`, pero en lugar de detectar colisiones, detecta una situación cuando un objeto jugador se acerca a objetos consumibles. Cuando esto ocurre, establece el marcador correspondiente en el array booleano `concerned`. Los marcadores en el array se utilizan más tarde en la función `render` (ver `main.cpp`) para cambiar la imagen del objeto estrella consumible a su variante "concernida". Siempre que el objeto jugador se aleja del objeto estrella consumible, su imagen debería volver a la normalidad.

Sin embargo, debido a los errores en la función `approachingLoop`, nada de esto funciona correctamente. ¡Debes detectar estos errores y restaurar el comportamiento previsto!