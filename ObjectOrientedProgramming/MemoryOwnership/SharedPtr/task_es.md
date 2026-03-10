A diferencia de `std::unique_ptr`, la clase de puntero inteligente [`std::shared_ptr`](https://en.cppreference.com/w/cpp/memory/shared_ptr) introduce semánticas de propiedad compartida, permitiendo que múltiples punteros inteligentes compartan el control sobre el mismo objeto asignado dinámicamente.

En su funcionamiento interno, `std::shared_ptr` implementa un contador de referencias para seguir el número de punteros compartidos que apuntan al mismo objeto. El contador de referencias se ajusta dinámicamente a medida que se crean o destruyen punteros compartidos. Cuando el contador de referencias llega a cero, el objeto gestionado se destruye automáticamente.

Mientras que `std::unique_ptr` es movible pero no copiable, `std::shared_ptr` es tanto movible como copiable. Copiar un `std::shared_ptr` resulta en propiedad compartida. Incrementa el contador de referencias. El objeto subyacente solo se desaloca cuando el último puntero compartido libera su propiedad.

Veamos un ejemplo del uso de `std::shared_ptr`:

```c++
// Creando un puntero compartido
std::shared_ptr<Dog> dog = std::make_shared<Dog>("Pluto");
// Usando el puntero
dog->bark();
// Creando una copia del puntero compartido
std::shared_ptr<Dog> copy = dog;
// Ambos, dog y copy, comparten la propiedad del mismo objeto
std::cout << *dog << " " << *copy << "\n";
// Se puede consultar el conteo de punteros compartidos
// apuntando al objeto dado
std::cout << "dog.use_count() = " << dog.use_count() << "\n";
// similar a std::unique_ptr, es posible obtener un puntero simple
std::cout << dog.get() << "\n";
// cuando la función sale,
// se llaman a los destructores de ambos punteros compartidos,
// reduciendo el contador de referencias a 0 y así
// activando la desasignación del objeto Dog apuntado
}
```

Como ejercicio, desarrollemos un sistema de chat simple. Consiste en dos clases: `Chat` y `User` (ver archivo `include/chat.hpp`). Cada usuario tiene un puntero compartido al objeto de chat en el que están actualmente registrados. Tu tarea es escribir la implementación de los siguientes métodos para la clase `User`.

```c++
void createNewChat(std::string name);
```

* El método `createNewChat` debería crear un nuevo chat con el nombre dado y registrar al usuario en él.

<div class="hint">

Para crear un nuevo objeto apuntado por un puntero compartido, usa la función `std::make_shared`

</div>  

<div class="hint">

Para asignar un identificador único al nuevo objeto `Chat` creado, usa el campo estático `nextChatId`.

</div>

```c++
void joinChatByInvite(const User& user);
```

* El método `joinChatByInvite` debería registrar al usuario en el chat de otro usuario (reasignando su puntero de chat).

```c++
void leaveChat();
```

* El método `leaveChat` debería registrar al usuario fuera del chat.