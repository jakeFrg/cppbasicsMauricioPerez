En este punto, necesitamos encontrar una forma de almacenar los resultados del juego para que tus logros no desaparezcan cuando el programa se cierre.  
La solución más evidente es guardar los datos en un archivo.  
Utilizaremos el formato de archivo [`.csv`](https://es.wikipedia.org/wiki/Valores_separados_por_comas), un formato de texto simple para almacenar datos tabulares.  
Cada línea del archivo representa una fila de la tabla, con los valores de cada fila separados por comas.

Para trabajar con los datos del marcador, usaremos una clase `Leaderboard`, definida en `leaderboard.hpp`.

Ahora, hablemos de la estructura general del marcador.  
Debe ser una tabla donde cada resultado sea un par que consista en el nombre del jugador y su puntuación.  
La tabla debe estar ordenada por puntuación en orden descendente.  
Sin embargo, también queremos permitir que los jugadores tengan varios registros bajo el mismo nombre, así que necesitamos almacenar todos ellos.  
Para esto, utilizaremos un contenedor `std::multimap`, donde la clave es la puntuación y el valor es el nombre del jugador.  
Este contenedor nos permitirá almacenar varios registros con la misma puntuación.

El método `updateScore` debe llamarse desde `LeaderboardScene::processEvent` para actualizar el marcador con la puntuación y el nombre introducido por el jugador. Esta función llamará a otras tres funciones:
- `loadScores()` - lee los datos del marcador desde el archivo y los guarda en el campo `scores`.
- `addScore()` - añade la nueva puntuación del jugador a `scores`.
- `saveScores()` - guarda la información actualizada del marcador nuevamente en el archivo.

`loadScores()` debe abrir el archivo en la ruta especificada por `filepath` utilizando `std::ifstream`. Si el intento de abrir el archivo falla, la función debe mostrar un mensaje de error por la salida estándar: "No se puede abrir el archivo: (filepath)".  
De lo contrario, la función debe leer los datos del archivo y almacenarlos en el campo `scores`.

`addScore()` debe añadir la nueva puntuación del jugador al campo `scores`.  
Dado que nuestra pantalla es de tamaño limitado, solo almacenaremos las 10 mejores puntuaciones de cada jugador.  
Por lo tanto, si al añadir una nueva puntuación el número de registros para ese jugador supera 10, la función debe eliminar el registro con la puntuación más baja.

`saveScores()` debe abrir el archivo en la ruta especificada por `filepath` utilizando `std::ofstream`.  
Si el archivo no se puede abrir, la función debe mostrar el mismo mensaje de error que antes.  
¡Recuerda tener en cuenta el formato de archivo que estamos utilizando!