Hasta ahora, hemos aprendido que la memoria del programa consiste en celdas de memoria individuales direccionables. También hemos aprendido cómo obtener las direcciones de las variables en memoria y cómo almacenarlas y moverlas utilizando punteros. Lo que aún no hemos aprendido es cómo se asigna y libera la memoria una vez que las variables que ocupan esta memoria ya no se necesitan. Al igual que en nuestra vida diaria, es muy importante reciclar recursos; en nuestro caso, la memoria del programa. Si un programa sigue asignando memoria para nuevas variables sin liberarla nunca, eventualmente podría agotar toda la memoria disponible en la máquina del usuario.

En la mayoría de los lenguajes de programación modernos, la desasignación de memoria se realiza automáticamente, sin que el programador lo note, por el subsistema del lenguaje conocido como [recolector de basura](https://es.wikipedia.org/wiki/Recolección_de_basura_(informática)). Aunque esto es realmente muy conveniente, ya que libera al programador de la carga de manejar la memoria manualmente, la recolección de basura conlleva ciertos costos:

* Consume una parte del tiempo de ejecución del programa para buscar memoria no utilizada, y
* Puede introducir pausas inesperadas, lo que puede impactar negativamente en la capacidad de respuesta y el rendimiento del programa.

C++ tiende a dar al programador el máximo control sobre cómo se ejecuta el programa. Esto incluye la posibilidad de manejar manualmente la asignación y desasignación de memoria.

En C++, hay tres regiones de memoria distintas gobernadas por diferentes políticas de gestión de memoria:

* memoria estática global,
* memoria de pila, y
* memoria dinámica del montón.

En los siguientes pasos, aprenderás sobre todas ellas.

![Distribución de la Memoria](../../../images/memory.svg)