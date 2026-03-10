Ahora apliquemos el conocimiento recién adquirido para extender la mecánica de nuestro juego añadiendo un nuevo tipo de objetos de juego: los objetos enemigos visualizados como agujeros negros. Como verás, con la ayuda de trucos de programación orientada a objetos, esta tarea se puede realizar con bastante facilidad.

El objeto enemigo debería comportarse de la siguiente manera:
- debería moverse en una escena en una dirección aleatoria, cambiándola periódicamente;
- debería consumir objetos estrella al colisionar con ellos;
- los objetos estrella deberían cambiar su estado a `AVISADO` cuando el objeto enemigo se está acercando a ellos (similar a cómo se comportan cuando el objeto jugador se acerca);
- cuando el objeto enemigo colisiona con el objeto jugador, este último debería cambiar su estado a `DESTRUIDO`, volviéndose efectivamente inmovible.

Procedamos a la implementación de este comportamiento. Primero, echa un vistazo a la declaración de la clase `EnemyObject`. Como hereda de la clase `CircleGameObject`, ya tiene un formato circular correspondiente y comportamiento adjunto. Además, el método `getKind()` de la clase `EnemyObject` distingue los objetos enemigos de otros tipos de objetos (jugador y consumibles) al devolver el valor `GameObjectKind::ENEMY`.

Ya hemos implementado parcialmente el comportamiento de movimiento del `EnemyObject` para ti. Para hacerlo, hemos añadido dos nuevos campos a los objetos de esta clase:
- el campo `velocity` es un vector que almacena la dirección y velocidad de la velocidad actual del objeto;
- el campo `updateTimer` almacena el tiempo transcurrido desde la última actualización de la velocidad del objeto.

El método `getVelocity()` simplemente devuelve el valor del campo `velocity`. El método `update(sf::Time delta)` es responsable de actualizar periódicamente la velocidad del objeto. Toma como argumento la cantidad de tiempo transcurrido desde la última actualización. La implementación simplemente verifica si la cantidad total de tiempo transcurrido es mayor que el período de tiempo predefinido (1 segundo), y si es así, restablece la velocidad a una nueva generada aleatoriamente llamando al método `updateVelocity()`. Tu tarea es implementar este método.

El método debería generar un vector de dirección aleatorio, multiplicarlo por la constante escalar de velocidad y asignar el resultado al campo `velocity`. Es decir, la siguiente fórmula debería usarse:
```
v` = S * d
```
donde:
* `` v` `` es el nuevo vector de velocidad,
* `S` es la constante de velocidad `SPEED`,
* `d` es un vector de dirección.

Tienes la libertad de definir un vector de dirección como desees, pero debe satisfacer las siguientes restricciones:
* las coordenadas `x` e `y` deben ser iguales a `1`, `0` o `-1`, y
* el vector debe generarse aleatoriamente: múltiples invocaciones consecutivas de un método no deberían, probablemente, resultar en la generación de la misma dirección.

Para generar un vector de dirección aleatorio, podrías encontrar útiles las siguientes funciones:

```c++
bool    generateBool(float prob = 0.5f);
int     generateInt(int min, int max);
float   generateFloat(float min, float max);
Point2D generatePoint(const Rectangle& boundingBox);
```

Una descripción detallada de estas funciones se puede encontrar en la documentación junto con sus definiciones en el archivo `utils.hpp`.

Avanzando con la clase `Enemy`, la parte fácil es implementar el método `getTexture`. Debe devolver una nueva textura especial para los objetos enemigos. Esta textura tiene un id correspondiente: `GameTextureID::BLACKHOLE`.

La parte más difícil es implementar el comportamiento de colisión. Cuando un objeto enemigo colisiona con el objeto jugador, el objeto jugador debería volverse inactivo. Esto se puede lograr estableciendo el estado del objeto jugador a `DESTRUIDO`. Sin embargo, un objeto enemigo no tiene acceso directo al método `setStatus` del objeto jugador. Para implementar el comportamiento deseado, en realidad necesitas modificar el método `onCollision` de la clase `PlayerObject`, ¡no el de la clase `EnemyObject`!

<div class="hint">

En la implementación del método `PlayerObject::onCollision`, recuerda verificar que la colisión ocurrió con un objeto enemigo, ¡no con un objeto de algún otro tipo!

</div>

Notar que desde la perspectiva de los objetos consumibles, tanto los objetos jugador como los enemigos se comportan de manera similar, por lo que no necesitas modificar su comportamiento.