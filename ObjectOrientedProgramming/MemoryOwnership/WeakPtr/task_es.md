En la propiedad de memoria en C++, [std::weak_ptr](https://en.cppreference.com/w/cpp/memory/weak_ptr) se destaca como una herramienta para gestionar la propiedad transitoria sin afectar el ciclo de vida del objeto. Mientras que `std::shared_ptr` permite la propiedad compartida, `std::weak_ptr` complementa esto al proporcionar un rol no intrusivo, similar a un observador. Este puntero no contribuye al conteo de referencias del objeto, lo que permite detectar el estado del objeto sin extender su ciclo de vida.

El caso de uso principal de `std::weak_ptr` es romper ciclos de referencias circulares, que de otro modo podrían llevar a fugas de memoria.

Volviendo al ejemplo del chat de la lección anterior, supongamos que queremos extender la clase `Chat` y agregar la posibilidad de asignar un anfitrión al chat.

Para este propósito, podríamos reestructurar la clase `Chat` de la siguiente manera (ver también el archivo `include/chat.hpp`):

```c++
class Chat {
public:
    Chat(int id, std::string name, const std::shared_ptr<User>& owner)
        : id(id)
        , name(std::move(name))
        , host(owner)
    {};

    /* ... */
private:
    int id;
    std::string name;
    std::shared_ptr<User> host;
};
```

Además, ahora, en lugar del método `User` `createNewChat`, declararíamos una función con el mismo nombre:

```c++
std::shared_ptr<Chat> createNewChat(std::string name, const std::shared_ptr<User>& host);
```

Esta función debería tomar el nombre del chat a crear, así como el puntero compartido al usuario que se convertirá en su anfitrión.

Ahora, supongamos que esta función crea un puntero compartido `chat`, apuntando a un nuevo objeto `Chat`, luego asigna el puntero `chat->host` a `host`, y `host->chat` a `chat`. Esto resultaría en un ciclo de referencias. Mientras `chat` y `host` almacenen punteros compartidos entre sí, ambos contadores de referencia no podrán reducirse por debajo de `1`. Esto significa que el objeto nunca será liberado — en otras palabras, ¡tenemos una fuga de memoria!

Para evitar esto, necesitamos usar `std::weak_ptr` para romper el ciclo de referencias. En particular, el campo `host` del objeto `Chat` debería declararse como un puntero débil.

Noten que el método `getHost` de la clase `Chat` todavía debe retornar un puntero compartido:

```c++
inline std::shared_ptr<User> getHost() const;
```

Para lograr esto, necesitas utilizar el método `lock()` de `std::weak_ptr`. Este método crea un nuevo `std::shared_ptr` apuntando al mismo objeto que el `std::weak_ptr` dado, si todavía existe; de lo contrario, devuelve un `std::shared_ptr` vacío.

Para completar esta lección, por favor arregla la implementación de la clase `Chat` (ver archivo `include/chat.hpp`) utilizando `std::weak_ptr` en lugar de `std::shared_ptr` para el campo `host`. Además, proporciona una implementación para la función `createNewChat` (ver archivo `task.cpp`).