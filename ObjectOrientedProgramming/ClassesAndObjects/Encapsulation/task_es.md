Ahora consideremos otra clase esencial del juego: la clase `Scene`.
El objeto de la escena del juego es responsable de manejar la entrada del usuario,
mantener los objetos del juego y gestionar sus actualizaciones,
dibujar gráficos en la ventana y otras actividades.
En esencia, es el caballo de batalla de nuestro sencillo motor de juego.

Veamos la declaración de la clase `Scene`.
Esta clase está bastante cargada: incluye tanto métodos regulares como virtuales
así como algunos campos de datos.
Para más detalles sobre el propósito de estos métodos, consulte su documentación.

La clase `Scene` agrupa sus miembros en tres secciones: `public`, `protected` y `private`.
¡Descifremos finalmente su significado!

Con la ayuda de estos _modificadores de visibilidad_,
la clase puede regular cómo sus clientes interactúan con los objetos de esta clase:

* todos los campos y métodos declarados dentro de la sección `public`
  son visibles y pueden ser utilizados libremente fuera de la clase;
* todos los campos y métodos declarados dentro de la sección `protected`
  son visibles y pueden ser utilizados dentro de la misma clase y dentro de sus descendientes;
* todos los campos y métodos declarados dentro de la sección `private`
  son visibles y pueden ser utilizados únicamente dentro de la misma clase y en ningún otro lugar;
* hay una sola excepción a la regla anterior —
  una clase marcada como `friend` de una clase dada puede acceder a sus miembros protegidos y privados.

<div class="hint">

Cuando se aplica en el contexto de la herencia,
como, por ejemplo, en la declaración de `CircleGameObject`:
```
class CircleGameObject : public GameObject
```
los modificadores de visibilidad tienen el siguiente significado:

* si una clase se hereda en modo `public`, 
  los miembros públicos de la clase base se vuelven públicos en la clase derivada, 
  y los miembros protegidos de la clase base se vuelven protegidos en la clase derivada;
  sin embargo, los miembros privados de la clase base no son accesibles directamente desde la clase derivada;
* si una clase se hereda en modo `protected`, 
  tanto los miembros públicos como protegidos de la clase base se vuelven protegidos en la clase derivada, 
  mientras que los miembros privados de la clase base no son accesibles directamente desde la clase derivada;
* si una clase se hereda en modo `private`, 
  todos los miembros públicos y protegidos de la clase base se vuelven privados en la clase derivada, 
  y los miembros privados de la clase base no son accesibles directamente desde la clase derivada.

</div>

Los campos y métodos disponibles públicamente de una clase también se llaman su _interfaz pública_
(no debe confundirse con el término _interfaz_ que denota clases que contienen funciones virtuales puras y sin estado).
La interfaz pública de una clase define la visibilidad de los objetos de la clase desde el exterior,
indicando qué campos y métodos los clientes de la clase pueden acceder.

Podrías preguntarte por qué es necesario ocultar algunos campos o métodos de una clase —
después de todo, podrían ser útiles externamente.
Sin embargo, la capacidad de ocultar ciertos _detalles de implementación_
permite a los objetos tener control total sobre su estado interno.

Este principio se conoce bajo el nombre de _encapsulación_.
La encapsulación permite al desarrollador de una clase mantener las _invariantes_ sobre los datos de un objeto,
asegurando que los objetos de esta clase siempre permanezcan en un estado válido.

Expliquemos esto usando el ejemplo de la clase `Scene`.
Entre otras cosas, esta clase es responsable de almacenar los objetos del juego que aparecen en la escena.
Una invariante útil que la clase `Scene` podría hacer cumplir es asegurar que todos sus objetos del juego se encuentren dentro de los bordes de la escena.
Sin embargo, si la clase `GameObject` proporciona un método `public` para cambiar la posición de un objeto (es decir, `setPosition`),
entonces el objeto `Scene` no tiene medios para garantizar esta propiedad.
Cualquier otra clase o función puede cambiar la posición de un objeto y colocarlo fuera del área visible de la escena.
Por el contrario, si la única manera de que una clase usuaria cambie la posición de un objeto es a través de una llamada
a un método de la escena (por ejemplo, su método `move`), entonces la implementación de este método puede
tomar algunas acciones adicionales para asegurar que el objeto permanezca dentro de la escena.
De esta manera, controlando la visibilidad de los campos y métodos de un objeto,
un desarrollador puede hacer cumplir diversas invariantes útiles del estado del programa.

Dominar las invariantes de clase y controlar la visibilidad de sus miembros es
una habilidad que se adquiere con la experiencia. Cuantas más aplicaciones complejas diseñes y desarrolles,
más competente serás en diseñar clases y sus invariantes.

Para consolidar el material de este paso, por favor
implementa los siguientes dos métodos de la clase `Scene`.

```c++
void setObjectPosition(GameObject& object, Point2D position);
void move(GameObject& object, Point2D vector);
```

Necesitas asegurar la invariante de la clase `Scene` que discutimos anteriormente —
los objetos en la escena deben permanecer dentro de sus bordes.

Para implementar estos métodos, debes usar
los correspondientes métodos de la clase `GameObject`,
así como otro método de la clase `Scene` — el método `fitInto`.
Este método ajusta la posición de un objeto para que se ajuste dentro de los bordes de la `Scene`.

<div class="hint">

Nota que la clase `Scene` está declarada como `friend` de la clase `GameObject`
(ver la declaración de la clase en el archivo `gobject.hpp`).
Como tal, la clase `Scene` puede acceder al método `setPosition` de la clase `GameObject`,
aunque esté declarado como un método privado.

</div>