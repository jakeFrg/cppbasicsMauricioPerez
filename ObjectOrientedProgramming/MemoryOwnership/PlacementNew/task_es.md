El operador `new` de colocación es una versión especial del operador `new`.  
Permite la construcción de un objeto en una región de memoria pre-asignada.  
Esto puede ser útil en varias situaciones,  
como reducir la fragmentación de memoria y mejorar el rendimiento.

Para usar el operador `new` de colocación,  
primero se debe asignar una región de memoria de tamaño apropiado.  
Luego, esta región de memoria debe pasarse al operador `new` de colocación.  
El operador construirá entonces un objeto del tipo especificado dentro de la región de memoria dada.

Cuando un objeto creado con la ayuda del operador `new` de colocación ya no es necesario,  
debe ser destruido llamando explícitamente al destructor.  
Cuando se trabaja con arreglos, el destructor debe llamarse para cada objeto en el arreglo.

Aquí hay un ejemplo de cómo usar el operador `new` de colocación para construir  
un objeto entero dentro de una región de memoria pre-asignada:

```cpp
#include <new>

class Cat {
public:
    explicit Cat(const std::string& name) { /* ... */ }
    ~Cat() { ... }
    std::string getName() { /* ... */ } 
    /* ... */
};

int main() {
  // Asignar una región de memoria del tamaño apropiado.
  char buffer[sizeof(Cat)];

  // Construir un objeto Cat en la región de memoria dada.
  Cat* cat = new (buffer) Cat("Garfield");

  // Acceder al objeto.
  std::cout << cat->getName(); << std::endl;

  // Destruir el objeto.
  cat->~Cat();

  return 0;
}
```

Con la ayuda del operador `new` de colocación, es posible  
ajustar los periodos de vida de varios objetos dentro de la misma duración de almacenamiento.  
Por ejemplo, cuando se reutiliza una región de memoria para construir un nuevo objeto,  
el periodo de vida del objeto anterior termina, y el periodo de vida del nuevo objeto comienza.  
Sin embargo, la duración de almacenamiento de la región de memoria permanece igual.

Para completar esta tarea, implemente las siguientes funciones.

La función `createCat` debe crear un objeto `Cat` con el nombre `"Tom"` en el bloque de memoria dado:

```c++
Cat* createCat(char* memory);
```

La función `destroyCat` debe destruir el objeto `Cat` que reside en el bloque de memoria dado:

```c++
void destroyCat(char* memory);
```

La función `createMouse` debe crear un objeto `Mouse` con el nombre `"Jerry"` en el bloque de memoria dado:

```c++
Mouse* createMouse(char* memory);
```

La función `destroyMouse` debe destruir el objeto `Cat` que reside en el bloque de memoria dado:

```c++
void destroyMouse(char* memory);
```