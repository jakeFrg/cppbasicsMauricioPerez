Las variables locales declaradas dentro de funciones se mantienen en la región de memoria __stack__. Esta región de memoria está dividida en partes llamadas _frames de stack_. Cada vez que se llama a una función, un frame de stack que contiene todas las variables locales de esa función se coloca en la parte superior del stack. Una vez que finaliza la ejecución de la función, el frame de stack correspondiente se elimina del stack.

<div class="hint">

La política de gestión de memoria de esta región se asemeja a la [estructura de datos stack](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)), de ahí el nombre.

</div>

El programa adjunto a este paso define dos funciones: `f` y `g`, cada una declarando dos variables locales y luego imprimiendo sus direcciones. La función `g` es llamada desde `f`, y `f` a su vez es llamada desde la función principal. Ejecuta el programa para ver qué direcciones se asignaron a estas variables. Nota que las direcciones aumentan o disminuyen monótonamente (dependiendo de tu sistema), mostrando así la dirección del crecimiento del stack en el espacio de memoria.

![Diseño de Memoria de Stack](../../../images/stack.svg)