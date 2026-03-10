Cuando el jugador colisiona con un enemigo, el juego debe terminar y debe aparecer una nueva escena. En esta escena, el jugador podrá ingresar su nombre y ver la tabla de líderes. El nombre debe ser introducido utilizando el teclado, permitiendo solo letras en inglés y números. La longitud máxima del apodo es de 16 caracteres.

La clase `LeaderboardScene` tiene dos estados: `INSERTNAME` y `SHOWLEADERBOARD`. Cuando el juego termina, el estado se establece automáticamente en `INSERTNAME`. Una vez que el jugador introduce su nombre, el estado debe cambiar a `SHOWLEADERBOARD`.
Esta lógica se procesa en la función `processEvent`. Toda la entrada se gestionará durante el estado `INSERTNAME`. Debes manejar tres casos:
 - Si se introduce texto (`event.type == sf::Event::TextEntered`), verifica el carácter para asegurarte de que cumple con nuestras reglas. Si es válido, agrégalo al nombre, siempre que la longitud del nombre sea menor a 16 caracteres.
 - Si se presiona la tecla de retroceso (`event.type == sf::Event::KeyPressed && event.key.code == sf::Keyboard::BackSpace`), elimina el último carácter del nombre.
 - Si se presiona la tecla Enter (`event.type == sf::Event::KeyPressed && event.key.code == sf::Keyboard::Enter`), cambia el estado a `SHOWLEADERBOARD` y llama a la función `updateScore(score, name)` de la clase `Leaderboard`. Implementaremos esto en la próxima tarea.

La función `processEvent` ya ha sido implementada para ti y llama a las funciones `processText`, `processBackspace` y `processEnter`. Necesitas implementar estas funciones.