En C++, existe un valor especial llamado **puntero nulo**: `nullptr`.  
Un puntero nulo no apunta a ninguna ubicación de memoria real.  
Desreferenciar un puntero nulo lleva a un *comportamiento indefinido*  
y lo más probable es que cause un error en tiempo de ejecución y haga que tu programa se bloquee.

<div class="hint">

Regresaremos al concepto de *comportamiento indefinido* más adelante en este curso.  
Por ahora, solo recuerda que es algo realmente **malo** que debes evitar.

</div>

```c++
int* p = nullptr;
// imprime 0
std::cout << p << "\n";
// el programa se bloquea
std::cout << *p << "\n";
```

A pesar de que un puntero nulo no puede ser desreferenciado,  
no es completamente inútil.  
Por ejemplo, puede ser utilizado para inicializar un puntero  
que será reasignado a una dirección real más tarde.  
Sin embargo, es importante no intentar nunca  
desreferenciar dicho puntero antes de que haya sido  
reasignado a una dirección real.

<div class="hint">

`nullptr` es una palabra clave específica de C++.  
En el lenguaje C, hay una constante equivalente: `NULL`.

</div>

Si tienes una función que recibe un puntero  
y no hay garantía de que este puntero no sea nulo,  
puedes validarlo antes de intentar  
desreferenciar el puntero.

```c++
void f(int* p) {
    if (p != nullptr) {
        int v = *p;
        // realizar el trabajo real
    }
}
```

Nota que C++ garantiza que `nullptr` se evalúa al valor entero `0`  
cuando se coloca en un contexto donde se espera un entero.  
Por lo tanto, el fragmento de código anterior es equivalente al siguiente:

```c++
void f(int* p) {
    if (p) {
        int v = *p;
        // realizar el trabajo real
    }
}
```