Debido a la política de gestión de memoria de la pila, las direcciones de las variables locales pueden pasarse a otras funciones más abajo en la pila de llamadas, pero nunca pueden ser devueltas de la función al llamador. Esto se debe a que la memoria ocupada por sus variables locales se desaloca cuando la función devuelve.

Para dar un ejemplo específico, el siguiente fragmento de código es completamente válido: la dirección de la variable local definida dentro del cuerpo de la función `caller` se pasa a la función `callee`.

```c++
void callee(int* p) {
    std::cout << p << " -> " << *p << "\n";
}

void caller() {
    int a = 42;
    callee(&a);
}
```

De hecho, dado que `callee` es llamada desde `caller`, el marco de pila asociado con `caller` no puede ser expulsado de la pila antes que el marco de pila de `callee`. Por lo tanto, la memoria ocupada por la variable `a` está asignada todo el tiempo que `callee` está siendo ejecutada.

Por el contrario, el siguiente fragmento de código es erróneo.

```c++
int* escape() {
    int a = 42;
    return &a;
}

void escapeCaller() {
    int* p = escape();
    std::cout << p << " -> " << *p << "\n";
}
```

En este caso, la dirección de la variable `a` _escapa_ de la función. Se pasa al llamador, y para cuando se accede, el marco de pila de `escape` ya ha sido expulsado de la pila. Por lo tanto, la memoria ocupada por `a` ha sido desalocada. Si intentas compilar y ejecutar el código anterior, el programa probablemente se bloqueará o imprimirá algún dato basura.

Ten en cuenta que un error similar ocurre cuando la dirección de una variable local se almacena en una variable global.

```c++
int* q = nullptr;

void escapeGlobal() {
    int a = 42;
    q = &a;    
}

void escapeGlobalCaller() {
    escapeGlobal();
    std::cout << q << " -> " << *q << "\n";
}
```