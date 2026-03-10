A pesar de que la clase `CircleGameObject` añade algunos campos de datos a la clase `GameObject`, todavía deja algunos de los métodos virtuales de `GameObject` sin implementar. Por lo tanto, esta clase sigue siendo una _clase abstracta_ — no puede ser instanciada.

Necesitamos introducir subclases concretas para implementar el comportamiento de la clase base. Las instancias de estas subclases se pueden utilizar entonces donde se espere una instancia de la clase base. Al sustituir la subclase concreta de un objeto, podemos cambiar el comportamiento del programa sin cambiar el código de las funciones que utilizan este objeto. Esta capacidad de tratar objetos de diferentes clases, que implementan distintos comportamientos, como objetos de una clase base común se conoce como _polimorfismo de subtipo_.

Presentemos dos subclases concretas de la clase `CircleGameObject` — la clase `PlayerObject` y la clase `ConsumableObject`, que representan el objeto controlado por el jugador y los objetos consumibles, respectivamente. Finalmente, ambas clases implementan toda la funcionalidad requerida por la clase `GameObject`.

Encuentre la declaración de estas clases en los archivos `player.hpp` y `consumable.hpp`. No hay nuevas construcciones sintácticas aquí, por lo que debería poder entender el código en estos archivos.

Las implementaciones de estas clases se pueden encontrar en los archivos `player.cpp` y `consumable.cpp`. Note que la implementación completa de algunos métodos ya está proporcionada. Por ejemplo, el método `getVelocity` de la clase `PlayerObject` calcula el vector de velocidad actual llamando a las funciones de `SFML` que determinan qué teclas están siendo presionadas por el jugador en ese momento.

Su tarea es implementar los métodos `getTexture` de ambas clases. Estos métodos deben devolver la textura actual de un objeto que se mostrará, dependiendo del estado actual del objeto. Aunque todavía no hemos implementado los métodos que realmente actualizan el estado de los objetos, implementar primero los métodos `getTexture` le dará una buena oportunidad de practicar y aprender la sintaxis de llamada de métodos.

El método `getTexture` toma un argumento por referencia — un objeto de la clase `TextureManager`. Es otra clase predefinida por nosotros — es responsable de cargar las texturas requeridas por el juego. Se puede solicitar un puntero de textura llamando al método `getTexture` de la clase `TextureManager`. Toma la ID de las texturas como argumento — estas IDs están representadas por el enum `GameTextureID`.

<div class="hint">

Observe que anteriormente usamos la palabra clave `enum`, pero el tipo `GameTextureID` se define con las dos palabras clave: `enum class`. Entonces, ¿cuál es la diferencia entre las declaraciones `enum` y `enum class`?

De hecho, el `enum class` (también conocido como una _enumeración con alcance_) es una forma restringida del `enum` regular, introducida en el lenguaje C++ para superar algunos de sus problemas.

En primer lugar, en el caso de `enum class`, los nombres de los valores de enumeración se mantienen dentro del ámbito del nombre de la enumeración. De esta manera, los valores de enumeración no contaminan el ámbito global, por lo que no hay riesgo de colisiones de nombres accidentales.

Veamos algunos ejemplos. Para un `enum` regular, se utiliza la siguiente sintaxis:  
```c++
enum Color { RED, GREEN, BLUE };
// RED, GREEN y BLUE son nombres accesibles globalmente
Color green = GREEN;
``` 
Mientras que en el caso de `enum class`, el valor de enumeración solo se puede acceder a través del nombre de la enumeración:
```c++
enum class Color { RED, GREEN, BLUE };
// RED, GREEN y BLUE no contaminan el ámbito global
Color green = Color::GREEN;
```

En segundo lugar, `enum class` no permite la conversión implícita a `int`. Por ejemplo, el siguiente código compila sin problemas:
```c++
enum Color { RED, GREEN, BLUE };
// sin error de compilación, la variable green es igual a 1.
int green = GREEN;
``` 
Sin embargo, si se usa `enum class`, el código no compilará:
```c++
enum class Color { RED, GREEN, BLUE };
// error de compilación: no hay conversión implícita de Color a int.
int green = Color::GREEN;
```

</div>

Por favor, implemente los métodos `getTexture` de `PlayerObject` y `ConsumableObject` usando la siguiente lógica:
* bajo estado `NORMAL` o `WARNED`, el objeto jugador debe tener la textura `PLANET`;
* bajo estado `DESTROYED`, el objeto jugador debe tener la textura `PLANET_DEAD`;
* bajo estado `NORMAL`, el objeto consumible debe tener la textura `STAR`;
* bajo estado `WARNED`, el objeto consumible debe tener la textura `STAR_CONCERNED`;
* bajo estado `DESTROYED`, el objeto consumible no debe ser mostrado.

<div class="hint">

Si tiene problemas para implementar el último caso, consulte la documentación del método `getTexture` de `GameObject`.

</div>

Para implementar este método, necesitará llamar al método `getTexture` de la clase `TextureManager`. Para hacerlo, use la sintaxis de punto `.` — la misma sintaxis que se utiliza para acceder a los campos de una estructura:

```c++
const sf::Texture* texture = textureManaged.getTexture(id);
```