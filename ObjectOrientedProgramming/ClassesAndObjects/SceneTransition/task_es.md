Hemos completado todos los pasos preparatorios para mostrar la tabla de clasificación,
pero la tarea final es identificar el momento correcto para cambiar de escena.

La función `GameEngine::run()` procesa el ciclo principal del juego, y necesitamos utilizar la función `sceneTransition()` en el momento adecuado para realizar la transición desde la escena dinámica a la escena de tabla de clasificación.

Revisa `sceneTransition()` para comprender cómo funciona. Tendrás que implementar dos funciones que se utilizan dentro de ella:
 - `scene->getNextSceneID()`: Dado que actualmente nos estamos enfocando en cambiar de la escena dinámica a la escena de la tabla de clasificación, esta función en `GameplayDynamicScene` debe devolver el ID de la escena dinámica si el jugador aún no ha perdido, y el ID de la escena de tabla de clasificación en caso contrario.
 - `sceneManager.transitionScene`: Debes gestionar correctamente la transición de escena, asegurando que la escena apropiada se active y pasando cualquier dato necesario, como la puntuación, a la nueva escena.

Además, asegúrate de que en el archivo `scenes.cpp`, tanto las funciones `initialize()` como `getCurrentScene()` estén trabajando con la instancia `dynamicScene` (y no con `staticScene`, lo cual podría ocurrir por errores al transferir código). Esto garantiza que el juego pueda jugarse correctamente. 

Una vez que termines, podrás ejecutar el juego, ver la puntuación mostrada en la esquina superior derecha de la pantalla
¡y tratar de superar los resultados que ha logrado nuestro equipo!