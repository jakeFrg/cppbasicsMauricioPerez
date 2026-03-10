¡Es hora de dar algo de dirección al movimiento de nuestro planeta! En este paso, permitiremos al usuario del programa controlar el planeta usando las teclas de flecha en el teclado.

Para modelar la dirección de un movimiento, necesitaremos otro nuevo tipo de dato.

```c++
enum Direction {
    North,
    East,
    South,
    West
};
```

Aquí, definimos el tipo [_enumeración_](https://en.cppreference.com/w/cpp/language/enum), de ahí la palabra clave `enum`. El valor del tipo de enumeración puede ser una de las alternativas listadas en la definición de la enumeración.

```c++
Direction direction = North;
```

Para manejar la entrada del usuario, es decir, el evento de presionar una cierta tecla de flecha, ya hemos añadido el código relevante en [main.cpp](course://WarmUp/MovingOn/GivingDirection/src/main.cpp). Puedes intentar encontrar y entender este nuevo fragmento de código. Si aún no entiendes algo, no te preocupes. En el paso actual, tu tarea es simplemente implementar otra función:

```c++
Point2D getDirection(Direction direction)
``` 

Para dar una dirección, necesitas calcular el _vector unitario_ de esta dirección. Por ejemplo: 
* si la dirección es `North`, el vector unitario es igual a `{ 0.0f, -1.0f }`;
* si la dirección es `East`, el vector unitario es igual a `{ 1.0f, 0.0f }`;  
y así sucesivamente.

Para decidir qué dirección se pasa, puedes usar la declaración `case`:

```c++
switch (direction) {
    case North:
        std::cout << "North";
        break;
    case East:
        std::cout << "East";
        break;
    default:
        std::cout << " ";
        break; 
}
```  

La ejecución procede de la siguiente manera. Se inspecciona el valor actual de la variable `direction` y luego: 
* si es igual a `North`, se ejecuta el código en la rama `case North:`; 
* si es igual a `East`, se ejecuta el código en la rama `case East:`;
* de lo contrario, se ejecuta el código en la rama `default:`.

Observa que la declaración `break` es necesaria para salir de la rama. De lo contrario, la ejecución no sale de la rama y continúa a la siguiente rama:

```c++
switch (direction) {
    case North:
        std::cout << "North" << " ";
    case East:
        std::cout << "East";
    // si la dirección es North, entonces imprime "North East"
    // si la dirección es East, entonces imprime "East"
}
```

Dentro de la función, en lugar de `break`, también puedes usar `return` para salir de la rama `case` y de toda la función.