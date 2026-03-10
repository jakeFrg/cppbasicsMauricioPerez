Ahora, restauremos la funcionalidad de detección de colisiones en nuestro juego refactorizado.

Ya hemos cambiado la firma de la función de detección de colisiones.

```c++
CollisionInfo collisionInfo(const Circle& circle1, const Circle& circle2);
```

Ahora, acepta dos formas circulares a través de referencias constantes.
En lugar de un indicador booleano que indique si ha ocurrido una colisión,
retorna la estructura `CollisionInfo`:

```c++
struct CollisionInfo {
    bool collide;
    float distance;
};
```

Este diseño nos dará la flexibilidad para calcular diferentes informaciones 
sobre una posible colisión entre dos objetos dentro de la función `collisionInfo`,
y preserva la oportunidad para que otros módulos de nuestro juego decidan qué hacer con esta información.
Por ahora, almacenaremos el indicador booleano `collide`, que indica si ha ocurrido una colisión,
y la `distance` calculada entre dos objetos. Sin embargo,
tendrás la oportunidad de extender esta estructura más adelante
con cualquier información adicional requerida para implementar nuevas características en nuestro juego.

Podrías preguntarte por qué decidimos modelar `CollisionInfo` como una estructura,
en lugar de usar los sofisticados objetos que aprendimos en esta lección.
De hecho, lo hicimos intencionalmente para ilustrar lo siguiente.
Las estructuras, declaradas mediante `struct`, y los objetos/clases, declarados mediante `class`,
no son conceptos incompatibles en C++,
y a menudo se pueden encontrar instancias de ambos en el mismo código.

* Se utilizan los objetos para unir datos (campos) y comportamiento (métodos).
  Los objetos proporcionan _encapsulamiento_ y _polimorfismo_.
  El estado de los objetos puede satisfacer varias invariantes,
  mantenidas mediante el control cuidadoso de la visibilidad de los miembros de una clase.

* Las estructuras se utilizan como contenedores de datos simples.
  Tienen una distribución de memoria predecible y un comportamiento predecible,
  no hay métodos virtuales asociados que se despachen en tiempo de ejecución.

En C++, las estructuras a veces también se denominan [tipos _POD_](https://en.wikipedia.org/wiki/Passive_data_structure),
donde POD significa _datos comunes_.

<div class="hint">

Técnicamente, en C++, no hay una gran diferencia entre las palabras clave `class` y `struct`.
Por ejemplo, se pueden declarar clases usando la palabra clave `struct`, y viceversa.
La única diferencia real es que:
* en un `struct`, los miembros tienen visibilidad `public` por defecto;
* en una `class`, los miembros tienen visibilidad `private` por defecto.

Sin embargo, una convención prevalente entre los desarrolladores de C++
es usar la palabra clave `class` para declarar clases reales en el sentido de programación orientada a objetos,
mientras que la palabra clave `struct` se usa para declarar tipos POD.

</div>

Ahora, con la ayuda de la nueva función de detección de colisiones,
tu tarea es reimplementar el comportamiento de los objetos consumibles.
- Al colisionar con otro objeto, el consumible debería cambiar su estado a `DESTROYED`.
- Cuando otro objeto se esté acercando al consumible, debería cambiar su estado a `WARNED`.
  Esto debería suceder siempre que la distancia entre el otro objeto y el consumible sea menor que `C * r`, donde
  - `r` es el radio del objeto consumible,
  - `C` es una constante de multiplicador especial.

```c++
const float CONSUMABLE_WARNED_MULTIPLIER = 6.0f;
```

Para hacerlo, por favor implementa el método `onCollision` de la clase `ConsumableObject`.
Este método se llama periódicamente desde la clase `Scene`, notificando al objeto
sobre posibles colisiones con otros objetos.
La función toma otro objeto como su primer argumento,
y la estructura `CollisionInfo` como el segundo,
que contiene la información sobre la distancia entre los objetos
y si realmente colisionaron.
Corresponde a la implementación del método decidir qué hacer con esta información.

Nota que cuando el objeto consumible pasa a estar `WARNED`, debería eventualmente
cambiar su estado de nuevo a `NORMAL` una vez que otros objetos hayan salido de su área cercana.
Esto se puede lograr también modificando la implementación del método `update`.
Este método también se llama periódicamente desde la clase `Scene` para permitir
que el objeto actualice su estado interno.
Esta función toma como único argumento la cantidad de tiempo transcurrido desde la última actualización,
aunque no necesitarás esta información para la tarea actual.
Restablece el estado del consumible vivo (es decir, que no esté `DESTROYED`) a `NORMAL`.
Si hay algún objeto cerca, se detectarán de nuevo durante una llamada a `onCollision`;
de lo contrario, el objeto consumible permanecerá en estado `NORMAL`.