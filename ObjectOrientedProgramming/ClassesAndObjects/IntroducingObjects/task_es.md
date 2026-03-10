Finalmente, adentrémonos en el paradigma de programación orientada a objetos.

En su núcleo yace el concepto de un _objeto_.
Un objeto agrupa algunos datos, llamados el _estado_ del objeto,
con un conjunto de funciones que operan sobre estos datos.
Estas funciones también se llaman los _métodos_ del objeto.
De esta manera, los objetos son similares a las estructuras, pero a diferencia de las estructuras simples,
también permiten la adición de funciones en su definición.

Los objetos se agrupan en _clases_.
Una clase define un plano del cual se crean los objetos.
En otras palabras, una _clase_ es solo un tipo de objetos.

Por ejemplo, consideremos la clase `GameObject`.
Los objetos de esta clase representan entidades que aparecen en la escena del juego,
como el objeto planeta controlado por el jugador,
objetos estrella consumibles, y otros que añadiremos más adelante.
Las instancias de esta clase almacenarán datos relacionados con un objeto del juego,
como su posición en la escena, y algunos métodos para manipular el objeto.

Echemos un vistazo a la definición de la clase `GameObject`.
Primero, nota que en C++, una nueva clase se define con la ayuda de la palabra clave `class`.
Luego viene la palabra clave `public` — describiremos su significado en los pasos posteriores.
Después vienen los métodos de la clase.
Hay muchos de ellos, y puedes entender el significado de cada método
consultando su _documentación_, dada como un comentario de docstring frente a la declaración del método.

<div class="hint">

Un docstring es un comentario especialmente formateado que se usa para documentar un segmento específico de código.
Este formato es ampliamente utilizado en bibliotecas y marcos de C/C++ para documentar su API.
Herramientas dedicadas como [Doxygen](https://www.doxygen.nl/index.html) 
pueden escanear el código fuente de tu programa y extraer estos comentarios de docstring
para producir documentación en varios formatos, como HTML o PDF.

El formato docstring admite varias anotaciones utilizadas para documentar
aspectos específicos de un bloque de código dado.
Por ejemplo, la anotación `@param` se puede usar para documentar los argumentos de una función,
la anotación `@return` se puede usar para documentar el valor de retorno de una función, etc.
Puedes aprender más sobre el formato docstring consultando
la [página](https://www.doxygen.nl/manual/docblocks.html) dedicada.

</div>

La clase `GameObject` en sí no define ningún campo de datos, solo métodos.
Sin embargo, define implícitamente un grupo de _propiedades_ de un objeto, por ejemplo, su posición.
El valor de una propiedad se puede solicitar usando su método _getter_ (por ejemplo, `getPosition`),
y se puede cambiar usando su método _setter_ (por ejemplo, `setPosition`).
Tenga en cuenta que algunas propiedades del objeto tienen tanto métodos _getter_ como _setter_,
como los mencionados métodos `getPosition` y `setPosition`,
mientras que otros tienen solo un _getter_, por ejemplo, `getVelocity`.
Hay una razón para esto: algunas propiedades son derivados del estado actual de los objetos
y no se pueden cambiar directamente desde el exterior.

Otro fragmento de sintaxis desconocida aquí es la palabra clave `const` que aparece después de los argumentos de un método.
Denota _métodos constantes_ — aquellos métodos que no pueden cambiar el estado del objeto.

Finalmente, la palabra clave `virtual` denota métodos _virtuales_ — estos son métodos
que pueden ser _sobrescritos_ por los herederos de la clase
(investigaremos nuevamente la herencia en la siguiente tarea).
La sintaxis `= 0` al final del método virtual indica que
es un método _virtual puro_.
Dicho método no se implementa para la clase dada —
es solo un esbozo para una implementación real del método.

Las clases que no declaran ningún campo de datos y contienen métodos virtuales puros también se llaman _interfaces_.
En cierto sentido, las interfaces solo proporcionan una descripción del comportamiento de los objetos,
sin especificar realmente su estado interno.
Esto deja una oportunidad al programador para definir varias _subclases_
de una interfaz que proporcionen diferentes implementaciones de su comportamiento.
Por ejemplo, en los siguientes pasos de esta lección, necesitarás implementar
subclases para objetos jugables, objetos consumibles y otros.

Antes de pasar al siguiente paso, por favor, completa un pequeño ejercicio de programación.
Uno de los métodos de la clase `GameObject` — el método `move` — en realidad no es `virtual`.
Esto se debe a que puede implementarse usando otros métodos de esta clase, a saber, `getPosition` y `setObjectPosition`.
Para la tarea de programación, por favor proporciona una implementación de este método.

La implementación del método debe colocarse en el archivo `gobject.cpp`.
Tenga en cuenta que las definiciones de métodos dadas en este archivo contienen tanto
el nombre de la clase como el nombre del método, separados por `::`.

```c++
void GameObject::move(Point2D vector) {
    ...
}
```