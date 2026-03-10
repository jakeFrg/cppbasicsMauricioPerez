Primero, necesitamos implementar el conteo de puntaje en el juego. El jugador debe ganar puntos por recolectar estrellas, y el puntaje debe ser visible en la pantalla durante toda la partida.

Ya contamos con una función `onCollision` que se llama cada vez que se detecta una colisión. Actualmente, gestiona las colisiones con objetos consumibles, pero por el momento no tiene ningún efecto.
Podemos extender esta función para aumentar el puntaje cada vez que el jugador colisione con una estrella.

Hemos agregado un nuevo campo, `score`, a la clase `Player`, que almacenará el puntaje actual del jugador. Además, hemos introducido un nuevo método, `getScore`, que devuelve el puntaje actual del jugador.

Tu tarea es extender la función `onCollision` en el archivo `player.cpp` y añadir el comportamiento necesario.
Sugerimos otorgar 1000 puntos por cada estrella consumida, ya que es una recompensa justa y visualmente atractiva.
También necesitarás implementar la función `updateScore` en `dynscene.cpp`. Puedes acceder al campo `player` de la clase `GameplayDynamicScene` para obtener el objeto del jugador y almacenar su puntaje en el campo `score`.