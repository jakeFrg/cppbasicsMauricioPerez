En C++, los argumentos se pasan por defecto a la función _por valor_. Siempre que un programa realiza una llamada a función con argumentos, estos argumentos son copiados y pasados a la función. Por lo tanto, si los argumentos se modifican durante la ejecución del cuerpo de la función, el sitio donde se realizó la llamada no estará al tanto de estas modificaciones, ya que solo tiene los originales.

Por ejemplo, considere una versión de la función `swap` con la siguiente firma:

```c++
void swap(int a, int b) {
    int c = a;
    a = b;
    b = c;
}
```

Esta función no intercambiará realmente el contenido de las variables, contrario a lo que uno podría esperar.

```c++
int a = 5;
int b = 7;
swap(a, b);
// imprime 5
std::cout << a << "\n";
// imprime 7
std::cout << b << "\n";
```

Esto se debe a que los argumentos se pasan por valor y, por lo tanto, se copian.

<div class="hint">

A este punto, ya deberías saber que la forma correcta de implementar funciones `swap` es utilizando punteros o referencias. Hablaremos más de esto en un momento.

</div>

La copia de argumentos también podría ser indeseada si una función necesita tomar una estructura grande y que consume mucha memoria como argumento.

Considere la siguiente estructura:

```c++
// rectángulo definido por su esquina superior izquierda
// y la esquina inferior derecha
struct Rectangle {
    Point2D topLeft;
    Point2D botRight;
};
```

Asumiendo que `float` ocupa 4 bytes, la estructura `Rectangle` ocupa 4 * 4 = 16 bytes.

```c++
// imprime 16
std::cout << sizeof(Rectangle) << "\n";
```

Por lo tanto, cualquier función que tome la estructura `Rectangle` por valor terminaría copiando 16 bytes en cada llamada.

Además, si la función necesita modificar el rectángulo en su lugar, ¡no podrá hacerlo porque solo cambiaría la versión copiada!

Para superar estas limitaciones, C++ permite pasar argumentos _por referencia_. Dado que una referencia es solo la dirección de una variable en memoria, solo ocupa 4 u 8 bytes, sin importar el tamaño del tipo de la variable. Además, si un argumento se pasa por referencia, la función puede realmente modificarlo.

Por ejemplo, podemos definir una función para escalar un rectángulo:

```c++
void scale(Rectangle& rect, float factor) {
    float width = rect.botRight.x - rect.topLeft.x;
    float height = rect.topLeft.y - rect.botRight.y;
    rect.botRight.x = rect.topLeft.x + width * factor;
    rect.botRight.y = rect.topLeft.y - height * factor;
}
```

Puedes verificar que la función realmente modifica el rectángulo pasado como argumento.

```c++
Rectangle rect = { {1, 5}, {6, 3} };
scale(rect, 2);
// imprime { {1, 5}, {11, 1} }
print(rect);
```

Con bastante frecuencia, la función no necesita realmente modificar los argumentos pasados; las referencias solo se necesitan para evitar copias excesivas. En tales casos, se utilizan referencias `const`. La función `print` mencionada en el fragmento de código anterior es un buen ejemplo de tal escenario:

```c++
void print(const Rectangle& rect) {
    std::cout << "{ " 
              << "{ " << rect.topLeft.x  << ", " << rect.topLeft.y  << "}, "
              << "{ " << rect.botRight.x << ", " << rect.botRight.y << "}" 
              << " }";
}
```

De hecho, si tu función toma un argumento por referencia pero no necesita modificarlo, siempre deberías usar la referencia `const`. Esta convención ayuda a prevenir un error común cuando una función modifica accidentalmente el argumento pasado.

Las funciones que toman argumentos por referencia `const` son un patrón muy común, que verás frecuentemente en una base de código C++.

Además, como ya hemos visto, las funciones C++ también pueden tomar argumentos _por punteros_. Como ejemplo, considera la función `scalePtr`, que toma un puntero al rectángulo en lugar de una referencia:

```c++
void scalePtr(Rectangle* rect, float factor) {
    float width = rect->botRight.x - rect->topLeft.x;
    float height = rect->topLeft.y - rect->botRight.y;
    rect->botRight.x = rect->topLeft.x + width * factor;
    rect->botRight.y = rect->topLeft.y - height * factor;
}
```

Como puedes ver, pasar argumentos por punteros comparte muchas similitudes con pasarlos por referencias. En C++, el último enfoque es generalmente preferido en la mayoría de las circunstancias. Sin embargo, hay algunos casos donde se prefiere pasar por punteros:

- si la implementación de la función involucra aritmética de punteros;
- si la estructura pasada por el puntero es parte de alguna estructura de datos dinámica (un ejemplo de esto es un nodo de una lista enlazada que vimos anteriormente);
- si la función necesita tomar posesión de la memoria apuntada (por ejemplo, para desalojarla).

Discutiremos el concepto de posesión con más detalle más adelante en este curso.