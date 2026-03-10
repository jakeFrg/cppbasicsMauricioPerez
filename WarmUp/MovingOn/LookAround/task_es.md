Al resolver la tarea anterior, puede que te hayas preguntado cómo unas pocas líneas de código C++ se convierten en una aplicación completa que abre una nueva ventana, dibuja el planeta en la escena y hace otras cosas.

Bueno, en realidad hicimos un pequeño truco y ocultamos una gran parte del código responsable de todo eso. Pero ahora pongamos todas las cartas sobre la mesa. Ahora puedes ver la parte oculta del código en el archivo [main.cpp](course://WarmUp/MovingOn/LookAround/src/main.cpp).

Echa un vistazo a ese archivo. No te preocupes si actualmente no puedes entender algún código allí. En las lecciones futuras explicaremos gradualmente todas las partes que faltan.

Por ahora, simplemente intenta encontrar cómo se utiliza la función `move` (la que implementaste en el paso anterior) en [main.cpp](course://WarmUp/MovingOn/LookAround/src/main.cpp).

<div class="hint">

`move` se llama desde la función `update`, que es responsable de la actualización periódica de la escena.

</div>