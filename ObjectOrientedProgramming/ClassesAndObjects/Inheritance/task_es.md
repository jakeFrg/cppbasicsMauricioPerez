Como hemos mencionado, la clase `GameObject` en sí no especifica el estado de los objetos del juego — solo describe su comportamiento. Necesitamos otra clase para extender `GameObject` con un estado real.

Afortunadamente, la programación orientada a objetos tiene un concepto adecuado para esta tarea — se llama _herencia_ de clases. El mecanismo de herencia permite extender una clase existente y proporcionar implementaciones concretas para sus funciones virtuales. Una clase _derivada_, también llamada _subclase_ (_subtipo_), hereda todos los métodos y campos de la _clase base_ (_tipo base_), y puede agregar sus propios métodos y campos.

Volviendo a nuestro problema, definamos una subclase `CircleGameObject` de la clase `GameObject`. Las instancias de la clase `CircleGameObject` representan objetos de juego de forma circular — como el objeto planeta controlado por el jugador.

Eche un vistazo a la definición de la clase `CircleGameObject`. La sintaxis del punto y coma:

```
class CircleGameObject : public GameObject
```

indica que `CircleGameObject` es una subclase de `GameObject`.

Por el momento, ignoremos nuevamente las palabras clave `public` y `private` utilizadas en la definición de la clase `CircleGameObject`.

En cambio, observe que `CircleGameObject` declara no solo métodos, sino también dos campos:
* el campo `circle` almacena los datos de su forma;
* el campo `status` almacena su estado actual.

El primer método de la clase `CircleGameObject` es un método especial llamado _constructor_. Los constructores tienen el mismo nombre que la clase en sí, y, en este caso, toma un único argumento `circle`: `CircleGameObject(Circle circle)`. Un constructor se invoca para crear una instancia de un objeto e inicializar su estado.

<div class="hint">

El [especificador](https://en.cppreference.com/w/cpp/language/explicit) `explicit` antes de un constructor evita conversiones implícitas de tipos. En C++, si una clase tiene un constructor con un solo argumento que no está marcado con la palabra clave `explicit`, entonces el compilador puede convertir automáticamente el tipo de argumento al tipo de clase cuando sea necesario.

Por ejemplo, si el constructor `CircleGameObject(Circle circle)` no hubiera sido marcado como `explicit`, el siguiente código podría compilar:

```c++
void foo(CircleGameObject object) { /* ... */ }

int main() {
    Circle circle = { { 0.0f, 0.0f, }, 10.0f };
    // `Circle` será convertido implícitamente a `CircleGameObject`
    // al llamar al constructor `CircleGameObject`.
    foo(circle);
}
```

Sin embargo, con el constructor marcado como `explicit`, el fragmento de código anterior no compilaría, y debería reescribirse de la siguiente manera:

```c++
void foo(CircleGameObject object) { /* ... */ }

int main() {
    Circle circle = { { 0.0f, 0.0f, }, 10.0f };
    CircleGameObject object(circle);
    foo(object);
}
```

En el lenguaje C++, el uso de constructores `explicit` generalmente se fomenta, ya que resulta en un comportamiento más predecible.

</div>

La definición del cuerpo del constructor de `CircleGameObject` contiene una nueva e interesante sintaxis:

```c++
CircleGameObject::CircleGameObject(Circle circle)
    : circle(circle)
    , status(GameObjectStatus::NORMAL)
{}
```

Después de la lista de argumentos viene el dos puntos `:`, seguido de una lista de los campos del objeto. El valor proporcionado entre los paréntesis junto al nombre del campo se utiliza para inicializar el campo correspondiente. Por favor, tenga en cuenta que el orden de los campos en la _lista de inicialización del constructor_ es importante. Debe coincidir con el orden en que los campos se declaran en la clase. Después de la lista de inicialización del constructor viene el cuerpo del constructor `{}` (vacío en este caso). Al igual que los métodos regulares, puede contener cualquier declaración de C++.

Un constructor tiene su contraparte — el método _destructor_, que debe tener el mismo nombre que la clase, prefijado con `~`. Este método se llama automáticamente antes de la destrucción de un objeto para realizar algunas rutinas de limpieza. Una clase puede tener varios constructores con diferentes argumentos, pero solo puede haber un destructor, que no toma ningún argumento.

De hecho, es posible que ya haya visto un destructor en el paso anterior: la clase `GameObject` tiene un destructor virtual `~GameObject()`. La sintaxis `= default` al final de su definición indica que este destructor tiene una implementación por defecto autogenerada.

Como veremos más adelante en el curso, los constructores y destructores tienen un papel fundamental en C++.

Volviendo a la clase `CircleGameObject`, considere sus métodos. Algunos de ellos, como `getPosition` y `setPosition`, son solo redeclaraciones de métodos de la clase `GameObject`. La palabra clave `override` al final de las declaraciones de estos métodos indica este hecho.

Sin embargo, a diferencia de la clase `GameObject`, la clase `CircleGameObject` puede realmente definir el comportamiento de estos métodos. Para ser precisos, es su tarea implementar algunos de ellos, a saber, `getPosition`, `setPosition`, `getStatus`, `setStatus`, y `getCircle`.

<div class="hint">

Tenga en cuenta que la posición de un `CircleGameObject` corresponde al centro de su círculo.

</div>