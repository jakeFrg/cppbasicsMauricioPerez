En C++, la propiedad se refiere a la responsabilidad de gestionar el ciclo de vida de ciertos recursos, como memoria, archivos, conexiones de red, objetos, _etc._ El modelo de propiedad en C++ se puede categorizar ampliamente en dos tipos: propiedad de sub-objetos almacenados en campos de objetos y propiedad de objetos creados dinámicamente usando punteros.

En C++, las clases a menudo contienen campos miembros que representan sub-objetos. Estos sub-objetos son típicamente propiedad del objeto padre. El objeto padre es responsable de llamar a sus constructores y destructores, y la memoria que ocupan se gestiona automáticamente según el ciclo de vida del objeto padre.

<div class="hint">

Nota que los constructores y destructores se llaman en un orden específico, y, además, el orden de destrucción es el orden inverso de la inicialización. Por ejemplo, considera la siguiente jerarquía de clases:

```c++
class Motherboard { /* ... */ };
class Processor { /* ... */ };
class RandomAccessMemory { /* ... */ };

class Device { /* ... */ };

class Laptop : public Device {
private:
    // La propiedad de los objetos almacenados en los campos
    // se gestiona automáticamente
    Motherboard motherboard;
    Processor processor;  
    RandomAccessMemory ram;
public:
    /* ... */
};
```

El orden de construcción de un objeto `Laptop` sería el siguiente:
1. el constructor de la clase base `Device` se llamaría primero;
2. luego se llamarían los constructores de los sub-objetos:
   * el constructor de `Motherboard` para el campo `motherboard`;
   * el constructor de `Processor` para el campo `processor`;
   * el constructor de `RandomAccessMemory` para el campo `ram`;
3. finalmente, se llamaría al constructor de `Laptop`.

El orden de destrucción es el opuesto:
1. primero, se llamaría al destructor de la clase derivada `Laptop`;
2. luego se llamarían los destructores de los sub-objetos:
   * el destructor de `RandomAccessMemory`;
   * el destructor de `Processor`;
   * el destructor de `Motherboard`;
3. finalmente, se llama al destructor de la clase base `Device`.

</div>

Los objetos almacenados en campos tipados con punteros, por defecto, se consideran no poseídos. Cuando una clase contiene un puntero a un objeto, la responsabilidad de su ciclo de vida y la gestión de la duración del almacenamiento recae fuera de la clase. Es crucial comprender este hecho para evitar fugas de memoria y comportamientos indefinidos, ya que la propiedad no se transfiere automáticamente con la asignación de punteros.

```c++
class Student {
private:
    // No es propiedad por defecto
    Laptop* laptop;
public:
    explicit Student(Laptop* laptop) 
        : laptop(laptop) {}
        
    // el destructor no destruye el objeto
    // apuntado por el campo laptop por defecto
    ~Student() = default;
};
```

En el ejemplo anterior, la clase Student contiene un puntero a un objeto `Laptop` asignado dinámicamente. La responsabilidad de la propiedad del objeto `Laptop` puede, o no, asignarse a la clase `Student` dependiendo de la semántica deseada. Si la semántica deseada es que el `Student` tome la propiedad del objeto `laptop` pasado en el constructor, entonces el desarrollador de esta clase debe asegurarse de que el objeto se destruya manualmente en el destructor (por ejemplo, usando el operador `delete`).

Los objetos en campos tipados con punteros se consideran no poseídos por defecto para permitir un control más explícito sobre la gestión de memoria, brindando más flexibilidad y eficiencia.

En los escenarios donde la propiedad necesita transferirse, se pueden usar [_smart pointers_](https://en.wikipedia.org/wiki/Smart_pointer), como `std::unique_ptr` y `std::shared_ptr`, proporcionando una gestión de memoria automatizada con riesgos reducidos de problemas relacionados con la memoria. Estos smart pointers son clases especializadas definidas en la biblioteca estándar de C++. Se comportan como punteros simples, en el sentido de que soportan el mismo conjunto de operaciones, como la desreferenciación, pero además, proporcionan semánticas específicas de propiedad. Discutiremos los smart pointers con más detalle en las próximas lecciones.