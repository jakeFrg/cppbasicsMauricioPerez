La clase `Scene` es también una _clase abstracta_ — 
tiene métodos virtuales puros y por lo tanto no puede ser instanciada.
Esto nos da la flexibilidad de tener diferentes implementaciones de la clase `Scene`.

Una de esas implementaciones es proporcionada por la subclase `GameplayStaticScene`
(ver archivos `statscene.hpp` y `statscene.cpp`).
Esta implementación de escena se llama estática porque contiene solo
un número predefinido de objetos de juego estáticos: 
un objeto jugador, un objeto consumible y un objeto enemigo,
que cubriremos más adelante en este módulo.
Esto es ciertamente un retroceso respecto a nuestra versión previa de la implementación del juego,
donde aprendimos cómo crear objetos dinámicamente con la ayuda de listas enlazadas. 
No se preocupe, restableceremos esta funcionalidad pronto.
Pero por ahora, trabajemos con la escena estática.

Aunque la clase `Scene` es muy importante y hace mucho trabajo,
como mantener objetos del juego y dibujar escenas,
no es responsable de gestionar el juego en sí.
Esta responsabilidad recae en otra clase — `GameEngine`
(ver archivos `engine.hpp` y `engine.cpp`).
Esta clase, en particular, controla la ventana de la aplicación y la escena actualmente activa.

<div class="hint">

Otra responsabilidad importante de la clase `GameEngine` es realizar transiciones de escenas.
Por ahora, esta funcionalidad podría no ser importante para nosotros,
ya que inicialmente tendremos solo una única escena (la escena de juego).
Sin embargo, se volverá útil más adelante en este curso a medida que empecemos a implementar otros tipos de escenas —
por ejemplo, una escena que gestione el menú principal del juego.

</div>

El método más importante de la clase `GameEngine` es el método `run()`,
que implementa el bucle principal del juego.
En esencia, el punto de entrada de nuestra aplicación de juego es simplemente
crear un objeto `GameEngine` y llamar a su método `run()` (ver archivo `main.cpp`).

Hablando de crear el objeto `GameEngine`,
la clase `GameEngine` tiene una cierta peculiaridad en comparación con las otras clases que hemos visto hasta ahora —
solo puede existir una única instancia de objeto `GameEngine` por instancia de juego.
Podemos expresar esto en el código con la ayuda de otra característica de C++: el modificador `static`.

Primero, note que la clase `GameEngine` tiene un método que se destaca del resto:
el método `create()`, que tiene un modificador `static` delante de él.
El modificador `static`, cuando se aplica a un miembro de clase (ya sea un campo o un método),
convierte a este miembro en un miembro _estático_.

Los miembros estáticos no están asociados con objetos, sino que están asociados con la clase misma.
Esto significa que para acceder a un miembro estático, no necesitas una instancia de la clase en cuestión.
En su lugar, los miembros estáticos se acceden a través del nombre de la clase:

```c++
// obtiene una instancia del motor llamando al método estático `create`
GameEngine* engine = GameEngine::create();
```

Los miembros estáticos proporcionan una manera conveniente de asociar algunos métodos o campos de datos con la clase misma.
Por ejemplo, el método `create` mostrado arriba proporciona la capacidad de instanciar el objeto del motor del juego.

Cuando se aplica a la declaración de variables locales dentro de funciones,
el modificador `static` tiene un significado diferente.
Permite crear una _variable estática_ que retiene su valor entre las llamadas a la función.
Dichas variables se almacenan en realidad dentro de la región de memoria estática del programa,
en lugar de la región de memoria de pila, donde residen otras variables locales de la función
(de ahí el nombre _estático_).

```c++
int foo() {
    static int x = 0;
    return ++x;
}

// imprime 1
std::cout << foo() << std::endl;
// imprime 2
std::cout << foo() << std::endl;
```

Con la ayuda del modificador `static`, se vuelve posible
asegurar que solo se cree un motor por cada ejecución del juego.
Para lograr esto, es suficiente declarar una variable `GameEngine` estática 
dentro del método `GameEngine::create` y devolver un puntero a esta variable.

<div class="hint">

Tenga en cuenta que en este caso, no se produce el error de escape de dirección.
Debido a que la variable `static` reside en la región de memoria estática, vive durante todo el tiempo de ejecución del programa.
Por lo tanto, es seguro devolver la dirección de esta variable desde la función.

</div>

Por favor, implemente el método `create` como se describe arriba.
Si lo hace correctamente, finalmente podrá ejecutar la aplicación de juego refactorizada
y ver los objetos de planeta y estrella en la pantalla.