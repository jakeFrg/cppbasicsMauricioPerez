En C++, los iteradores se clasifican en varias categorías según sus capacidades y comportamientos. Es importante comprender estas categorías, ya que diferentes contenedores de la STL proporcionan distintas categorías de iteradores. Estas incluyen:
1. **Iteradores de entrada**: Permiten leer valores de los elementos a los que apuntan. Una vez leído el elemento, el iterador puede incrementarse para apuntar al siguiente elemento.
2. **Iteradores de salida**: Permiten escribir valores en los elementos a los que apuntan. Una vez escrito el valor, el iterador puede incrementarse para apuntar al siguiente elemento.
3. **Iteradores de avance**: Combinan las características de los iteradores de entrada y salida. Permiten múltiples pasadas a través de un rango y soportan operaciones de lectura y escritura.
4. **Iteradores bidireccionales**: Mejoran a los iteradores de avance al agregar la posibilidad de moverse hacia atrás en un rango usando el operador `--`.
5. **Iteradores de acceso aleatorio**: Son los iteradores con mayor cantidad de funcionalidades, ya que proporcionan acceso en tiempo constante a cualquier elemento del rango, operaciones aritméticas y un comportamiento similar a los punteros.

A continuación, se muestra una tabla comparativa simplificada de las categorías de iteradores:

| Categoría       | Lectura | Escritura | Avance | Retroceso | Acceso Aleatorio |
|-----------------|---------|-----------|--------|-----------|------------------|
| Entrada         | Sí      | No        | Sí     | No        | No               |
| Salida          | No      | Sí        | Sí     | No        | No               |
| Avance          | Sí      | Sí        | Sí     | No        | No               |
| Bidireccional   | Sí      | Sí        | Sí     | Sí        | No               |
| Acceso aleatorio| Sí      | Sí        | Sí     | Sí        | Sí               |

Los iteradores pueden invalidarse debido a ciertas operaciones realizadas sobre el contenedor con el que están asociados. Entender la invalidación de iteradores es fundamental para evitar comportamientos indefinidos. Las situaciones comunes que provocan la invalidación de iteradores son:
- **Inserción y eliminación**: Insertar o eliminar elementos en el contenedor puede invalidar los iteradores que apuntan a los elementos modificados.
- **Redimensionamiento del contenedor**: Las operaciones de redimensionamiento pueden causar una realocación, lo que lleva a la invalidación de todos los iteradores.
- **Vaciado del contenedor**: Vaciar el contenedor invalida todos los iteradores que apuntan a sus elementos.

Para más casos, consulta este [artículo](http://kera.name/articles/2011/06/iterator-invalidation-rules-c0x/).

Diferentes contenedores de la STL proporcionan diferentes categorías de iteradores. A continuación, se muestra una correspondencia de cada contenedor de la STL mencionado con la categoría de iterador que proporciona, junto con las reglas de invalidación para cada contenedor:

| Contenedor      | Categoría de iterador | Reglas de invalidación               |
|-----------------|----------------------|--------------------------------------|
| vector          | Acceso aleatorio     | Inserción, eliminación, redimensionamiento    |
| string          | Acceso aleatorio     | Inserción, eliminación, redimensionamiento    |
| list            | Bidireccional        | Ninguna                              |
| deque           | Acceso aleatorio     | Inserción, eliminación en ambos extremos      |
| stack           | N/A                  | N/A                                  |
| queue           | N/A                  | N/A                                  |
| set             | Bidireccional        | Inserción, eliminación                |
| map             | Bidireccional        | Inserción, eliminación                |
| unordered_set   | Avance               | Inserción, eliminación, rehashing     |
| unordered_map   | Avance               | Inserción, eliminación, rehashing     |

Ten en cuenta que los contenedores stack y queue no proporcionan iteradores. Más información sobre las categorías de iteradores, así como una tabla completa, puede encontrarse en la [referencia de C++](https://en.cppreference.com/w/cpp/iterator).