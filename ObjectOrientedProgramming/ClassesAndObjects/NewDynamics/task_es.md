A continuación, necesitamos restaurar el comportamiento dinámico de nuestro juego: la capacidad de agregar y eliminar objetos dinámicamente durante el juego. Para hacerlo, reimplementaremos la estructura de datos de lista doblemente enlazada en términos de programación orientada a objetos. Antes de proceder con esta tarea, por favor complete primero el módulo `Ownership`, ya que necesitaremos algunos conceptos enseñados allí.

En primer lugar, en lugar de reescribir completamente la clase `GameplayStaticScene`, solo agregaremos una nueva clase: `GameplayDynamicScene`, donde implementaremos la nueva funcionalidad dinámica.

Por favor, eche un vistazo a la declaración de la clase `GameplayDynamicScene` (archivo `dynscene.hpp`), y su definición (archivo `dynscene.cpp`). Puede encontrar una breve descripción de sus métodos en los comentarios de documentación.

La clase `GameplayDynamicScene` tiene un campo `objects` de la clase `GameObjectList`. Esta es la clase principal con la que trabajaremos en esta tarea, ya que implementará la lista doblemente enlazada. Su declaración y definición pueden encontrarse en los archivos `gobjectlist.hpp` y `gobjectlist.cpp`, respectivamente.

Esta vez, usando programación orientada a objetos y el modelo de propiedad, implementaremos una lista que será propietaria de sus nodos. Los nodos serán destruidos y desalojados automáticamente al destruirse la lista misma, y la copia de la lista resultará en la copia de todos sus nodos también.

Los nodos de la lista están representados por la estructura `Node`, que implementa la semántica de propiedad: cada nodo es propietario de su sucesor. Veamos más de cerca los campos de la estructura `Node`.

- El campo `next` es un puntero de propiedad `std::unique_ptr<Node>`.
  Siempre que un nodo se destruye, todos sus nodos sucesores también serán destruidos, debido a su semántica de propiedad.
- El campo `prev` es un puntero simple `Node*`, que almacena el puntero al nodo anterior.
  Es un puntero sin propiedad porque si fuera un puntero de propiedad, resultaría en un ciclo de propiedad.
  De hecho, dado un nodo `x`, `x.prev` podría apuntar a un nodo `y`, de manera que `y.next` apunta a `x` — esto es claramente un ciclo.
- El campo `object` es un puntero compartido `std::shared_ptr<GameObject>` a un objeto de juego almacenado en el nodo.
  Tiene semántica de propiedad compartida, para que los punteros compartidos a objetos de juego puedan devolverse de manera segura desde los métodos de la clase `GameObjectList`.
  Además, la propiedad compartida de los objetos de juego nos permitirá implementar la copia de una lista: una copia simplemente almacenaría copias de punteros compartidos.

Los métodos estáticos `link` y `unlink` implementan la vinculación y desvinculación de nodos, respectivamente. Ya ha visto estas funciones en la tarea `LinkedList`. Aquí tiene un recordatorio de su semántica:

```c++
static void link(Node* cursor, std::unique_ptr<Node>&& node);
```

- Vincula juntos los nodos `cursor` y `node`, colocando `node` justo después de `cursor`.

```c++
static void unlink(Node* node);
```

- Desvincula el nodo de sus nodos vecinos.

Por favor, implemente estos métodos. Preste atención a las diferentes semánticas de propiedad de los punteros `next`, `prev` y `object`, y use `std::move` para manejar la propiedad. Recuerde que `std::unique_ptr` pasa a un estado `nullptr` después de una transferencia de propiedad, por lo que el orden de `std::move` y las desreferencias de punteros se vuelve importante.

A continuación, considere los campos de la clase `GameObjectList`.

- `head` es un puntero de propiedad, `std::unique_ptr<Node>`, al primer nodo de la lista.
- `tail` es un puntero sin propiedad, `Node*`, al último nodo de la lista. 
  Es un puntero sin propiedad porque el nodo al que apunta es, en realidad, propiedad de su predecesor a través de su puntero `next`.

Dado que el puntero `head` de la lista es uno de propiedad, toda la secuencia de nodos pertenecientes a la lista será destruida automáticamente al destruirse la lista. Esta es la razón por la que hemos mantenido la implementación predeterminada del destructor de la clase:

```c++
~GameObjectList() = default;
```

<div class="hint">

De hecho, el destructor de `GameObjectList` llamará al destructor `~std::unique_ptr()` del campo `head`. A su vez, llamará al destructor de `Node`, que luego llamará al destructor `~std::unique_ptr()` de su campo `next`, y así sucesivamente, hasta que todos los nodos sean destruidos.

</div>

Tenga en cuenta que en la implementación anterior de la lista (en la tarea `LinkedList`), utilizamos un único nodo centinela para simplificar la implementación de algunas funciones operativas de la lista. Además, bajo el capó, la lista estaba organizada como una lista cíclica: el campo `next` del último nodo apuntaba al primer nodo (centinela). Esta vez, no podemos reutilizar este truco, ya que una lista cíclica resultaría en un ciclo de propiedad. Por lo tanto, necesitaríamos dos nodos centinela: uno como el primer nodo, y el segundo como el último nodo.

Eche un vistazo a los métodos predefinidos `foreach` y `remove` de la lista, que utilizan esta representación de lista:
- `foreach` aplica la función dada como argumento a cada objeto de juego almacenado en la lista;
- `remove` desvincula los nodos (eliminándolos efectivamente) cuyo objeto de juego cumple con el predicado dado como argumento.

<div class="hint">

Puede que encuentre el tipo `std::function<...>` poco familiar. En esencia, es solo una contraparte orientada a objetos de un puntero a función. Echaremos un vistazo más de cerca a este tipo en módulos posteriores del curso.

</div>

Ahora, por favor implemente el constructor por defecto de la clase `GameObjectList`, el cual debería inicializar dos nodos centinela de la lista:

```c++
GameObjectList();
```

A continuación, implemente el método para insertar un objeto de juego al final de la lista (justo antes del último nodo centinela):

```c++
void insert(const std::shared_ptr<GameObject>& object);
```

Tenga en cuenta que:
- los primeros y los últimos nodos deben permanecer como nodos centinela;
- solo los nodos centinela pueden almacenar un puntero nulo `nullptr` dentro del campo `object`.

Para completar esta tarea, termine también la implementación de las semánticas de propiedad de la clase `GameObjectList`, siguiendo la regla de archivo y el esquema de copiar-e-intercambiar. En particular, por favor implemente:

- constructor de copia
```c++
GameObjectList(const GameObjectList& other);
```

- constructor de movimiento
```c++ 
GameObjectList(GameObjectList&& other) noexcept;
```

- operador de asignación
```c++
GameObjectList& operator=(GameObjectList other);
```

- función de intercambio
```c++
friend void swap(GameObjectList& first, GameObjectList& second);
```

Una vez que haga esto, debería poder ejecutar la instancia del juego con la nueva escena dinámica.