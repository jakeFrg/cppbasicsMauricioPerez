Con todo el conocimiento que has obtenido sobre la gestión manual de memoria en C++, ahora volveremos a nuestro juego, para que puedas aplicar tus nuevas habilidades en la práctica.

Recuerda que anteriormente solo podíamos tener un número fijo de objetos consumibles en la escena porque solo conocíamos arreglos de tamaño estático fijo. Ahora, tu tarea será implementar una estructura de datos dinámica que nos permita colocar una cantidad arbitraria de objetos consumibles en la escena y, además, ¡agregar nuevos objetos durante el juego!

Necesitarás implementar una estructura de datos dinámica básica llamada [_lista doblemente enlazada_](https://es.wikipedia.org/wiki/Lista_doblemente_enlazada). Esta estructura de datos permite almacenar un número arbitrario, no conocido a priori, de elementos, y habilita la adición o eliminación dinámica de elementos.

En la descripción de la tarea a continuación, nos referiremos a la lista doblemente enlazada simplemente como lista (en general, hay otros tipos de [listas](https://es.wikipedia.org/wiki/Lista_ligada)). La lista consta de _nodos_, representados por la siguiente estructura:

```c++
struct Node {
    void* data;
    Node* next;
    Node* prev;
};
```

Cada nodo contiene un puntero al elemento en sí y también un par de punteros que apuntan a los nodos siguiente y anterior. Ten en cuenta que usamos `void*` como puntero a un elemento – esto permite al usuario de la lista almacenar elementos de tipo arbitrario y realizar todas las conversiones de tipo necesarias por su parte. Para simplificar, exigiremos que los propios elementos sean correctamente asignados por el usuario final de la lista a través de `malloc`.

Como punto de partida, implementa dos funciones para asignar y liberar memoria para un nuevo nodo:

```c++
Node* createNode(void* data);

void freeNode(Node* node);
```

La función `createNode` debe asignar memoria para el nuevo nodo e inicializar su campo `data` con la variable `data` que se pasa como argumento. Supón que la memoria a la que apunta `data` ya está asignada en el sitio que la llama. La función `freeNode` debe liberar la memoria ocupada por el nodo pasado por el puntero, incluida la memoria a la que apunta su campo `data` (suponiendo que esta memoria se asignó usando `malloc`).

La siguiente función que debes implementar es `link`:

```c++
void link(Node* cursor, Node* node);
```

Debe vincular juntos los nodos `cursor` y `node`, colocando `node` justo después de `cursor`. Asegúrate de actualizar adecuadamente los campos `next` y `prev` de todos los nodos relevantes, es decir, los nodos apuntados por los punteros `cursor`, `cursor->next`, y `node`. Puedes asumir que todos los nodos alcanzables desde `cursor` a través de `next` y `prev` son nodos válidos y ninguno de sus punteros `next` o `prev` es nulo (veremos por qué esto es cierto para nuestra implementación de lista propuesta más adelante).

Por el contrario, la función `unlink` debe desvincular el nodo pasado por el puntero de sus vecinos:

```c++
void unlink(Node* node);
```

Debe redirigir los punteros `next` y `prev` de los nodos vecinos de `node` para que se apunten entre sí, en lugar de a `node`.

Ahora que tenemos algunas funciones para trabajar con nodos, podemos proceder a la lista en sí. La lista une una serie de nodos en una sola estructura de datos. De hecho, debido a que los propios nodos mantienen punteros a sus vecinos, es suficiente almacenar un solo nodo en la estructura de datos de la lista – todos los demás nodos pueden ser accedidos desde ese único nodo.

Proponemos implementar la lista utilizando el concepto de [_nodo centinela_](https://es.wikipedia.org/wiki/Nodo_centinela). Este es un nodo especial que no contiene ninguna información significativa en sí mismo, pero se utiliza como un guardián, siempre presente en una lista. De esta manera, podemos evitar manejar punteros nulos en casos cuando, por ejemplo, necesitamos agregar el primer nodo a la lista – en tal escenario, simplemente podemos vincular el nodo al centinela.

```c++
struct List {
    Node sentry;
};
```

Para que este esquema funcione correctamente, también necesitamos inicializar los campos `next` y `prev` del nodo `sentry`. Podemos hacer que ambos apunten al nodo `sentry`. Por lo tanto, en nuestra codificación, una lista vacía se modela como una lista que consiste en un solo nodo centinela, cuyos punteros `next` y `prev` forman un ciclo. Escribe código para la función `initList` que implementa esta idea (establece el campo `data` del nodo `sentry` en `nullptr`):

```c++
void initList(List& list);
```

A continuación, implementa una función que inserte un nuevo nodo con los datos dados en la lista:

```c++
void insert(List& list, void* data); 
```

Y, finalmente, escribe una función que elimine todos los nodos cuyos datos satisfagan un predicado dado proporcionado como un puntero a función:

```c++
void remove(List& list, bool (*pred)(void*));
```

Debe iterar a través de todos los nodos de la lista, excluyendo el nodo `sentry`, llamar a la función `pred`, pasar el campo `data` del nodo actual como argumento, y verificar qué devuelve `pred`. 
- Si devuelve `true`, entonces la función `remove` debería desvincular el nodo actual de la lista y liberar su memoria ocupada. Utiliza las funciones `unlink` y `freeNode` para lograr este comportamiento. 
- Si devuelve `false`, debería mantener el nodo actual en la lista y pasar al siguiente nodo.

Una vez que implementes correctamente todas estas funciones (¡todas las pruebas deben pasar!), podrás ver cómo aparecen dinámicamente los objetos estelares consumibles en la pantalla durante el juego. Puedes intentar inspeccionar el archivo modificado [main.cpp](course://MemoryManagement/LinkedList/LinkedList/src/main.cpp) para ver cómo se utilizan las funciones de manipulación de listas que has implementado para mantener un conjunto dinámico de objetos consumibles.

<div class="hint">

Como habrás notado, el código en el archivo [main.cpp](course://MemoryManagement/LinkedList/LinkedList/src/main.cpp) se está volviendo bastante desordenado. En el próximo módulo del curso, aprenderemos sobre las características _orientadas a objetos_ de C++ que nos ayudarán a estructurar mejor el código de nuestro juego, permitiéndonos ofrecer una nueva funcionalidad más compleja con facilidad.

</div>
