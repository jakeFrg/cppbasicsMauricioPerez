El primer tipo de punteros inteligentes en C++ que vamos a examinar es [std::unique_ptr](https://en.cppreference.com/w/cpp/memory/unique_ptr).

Este puntero inteligente está diseñado para gestionar la vida útil de objetos asignados dinámicamente y proporciona semánticas de propiedad exclusiva. El modelo de propiedad única asegura que, en un momento dado, solo una instancia de `std::unique_ptr` posea un objeto asignado dinámicamente específico. Cuando el `std::unique_ptr` propietario se destruye o se reinicia explícitamente, el objeto señalado se destruye automáticamente y la memoria asociada se libera.

Otra ventaja de `std::unique_ptr` es que ayuda a prevenir errores de memoria, como fugas de memoria y eliminaciones dobles. El `std::unique_ptr` asegura que un objeto será eliminado cuando ya no se necesite y que se eliminará solo una vez.

Además, el uso de `std::unique_ptr` mejora la legibilidad del código al dejar claro qué puntero posee un objeto y es responsable de eliminarlo.

Veamos algunos ejemplos. Supongamos que tenemos una clase `Dog` definida de la siguiente manera:

```c++
class Dog {
public:
    explicit Dog(const std::string& name) : name(name) {}
    ~Dog() {}

    std::string bark() const {
        std::cout << "Woof!\n";
    }
private:
    std::string name;
};
```

El siguiente fragmento de código demuestra cómo crear un nuevo objeto `Dog` poseído por un `unique_ptr`:

```c++
void makeBark() {
    // creando un puntero único
    std::unique_ptr<Dog> dog = std::make_unique<Dog>("Snoopy");
    // puedes comprobar si el puntero único es un puntero nulo,
    // similar a cómo lo harías con un puntero simple
    if (!dog) {
        return;
    }
    // el puntero único se puede utilizar 
    // de forma similar a cómo se usan los punteros simples
    dog->bark();
    // cuando la función termina, 
    // el unique_ptr destruye automáticamente 
    // el objeto Dog y libera la memoria
}
```

<div class="hint">

¿Cómo se logra la destrucción automatizada del objeto señalado por el `std::unique_ptr`? De hecho, la implementación de la biblioteca estándar de la clase `std::unique_ptr` simplemente sobrescribe el destructor de esta clase.

</div>

Alternativamente, uno puede reiniciar explícitamente el puntero, activando así la eliminación del objeto señalado:

```c++
std::unique_ptr<Dog> dog = std::make_unique<Dog>("Snoopy");
dog->bark();
// en este punto, el puntero se restablecerá a nulo,
// y el objeto señalado será destruido
dog.reset();
assert(dog == nullptr);
}
```

También es posible transferir un puntero simple existente a un nuevo `std::unique_ptr`:

```c++
Dog* dog = new Dog("Snoopy");
// la propiedad del objeto Dog es tomada por el unique_ptr,
// no debería eliminarse manualmente, 
// ya que el puntero único lo hará
std::unique_ptr smartDog(dog);
```

Por el contrario, es posible quitar el puntero junto con su propiedad del comando `std::unique_ptr`:

```c++
std::unique_ptr<Dog> smartDog = std::make_unique<Dog>("Snoopy");
// el objeto Dog se transfiere al puntero simple,
// debe eliminarse manualmente eventualmente 
// porque el puntero único no lo hará
Dog* dog = smartDog.release();
// después de release, el puntero único está en estado nulo
assert(smartDog == nullptr);
```

Es posible obtener un puntero simple sin liberar la propiedad. Sin embargo, el puntero simple no debería sobrevivir al puntero único; de lo contrario, puede resultar en un error de uso después de liberar.

```c++
std::unique_ptr<Dog> smartDog = std::make_unique<Dog>("Snoopy");
// ahora, dog y smartDog apuntan al mismo objeto;
// la propiedad todavía pertenece al puntero smartDog
Dog* dog = smartDog.get();
```

<div class="hint">

El método `get()` se utiliza típicamente para pasar un puntero único a una función que espera un puntero simple. Esto es común cuando el código C++ necesita interactuar con bibliotecas C.

</div>

Nota que al convertir punteros simples a punteros únicos y viceversa, usando los métodos dados anteriormente, podrías crear accidentalmente dos punteros únicos apuntando al mismo objeto, violando así las reglas de propiedad de `std::unique_ptr`. Esto resultaría en un comportamiento indefinido:

```c++
std::unique_ptr<Dog> dog = std::make_unique<Dog>("Snoopy");
// dog y anotherDog apuntan al mismo objeto,
// y ambos asumen incorrectamente la propiedad única del objeto;
// por lo tanto, ambos pueden intentar destruir el objeto, 
// llevando a un comportamiento indefinido.
std::unique_ptr<Dog> anotherDog(dog.get());
```

Por esta razón, deberías tener extremo cuidado al convertir entre punteros simples y únicos. Como regla general, intenta evitar por completo estas conversiones en tu código.

Por defecto, `std::unique_ptr` intenta prevenir tales errores y hacer cumplir la regla de propiedad única. Esta es la razón por la que, por ejemplo, el constructor de copia de `std::unique_ptr` está deshabilitado:

```c++
std::unique_ptr<Dog> dog = std::make_unique<Dog>("Snoopy");
// error de compilación
std::unique_ptr<Dog> anotherDog = dog;
```

Para consolidar el material de esta lección, completa la implementación de la función `copy`. Esta función toma un arreglo de enteros como argumento, dado como un puntero simple y su tamaño, y debería devolver un arreglo copiado como un puntero único. Si el tamaño del arreglo dado es `0`, entonces la función debería devolver un puntero nulo.

<div class="hint">

Para crear un puntero único a un arreglo, usa la siguiente sintaxis:
```c++
std::make_unique<int[]>(size)
```

</div>