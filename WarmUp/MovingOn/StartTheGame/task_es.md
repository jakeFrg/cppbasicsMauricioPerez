¡Felicidades! Ya has aprendido cómo definir variables en C++ y cómo interactuar con el usuario del programa a través del terminal. En esta lección, continuarás estudiando el lenguaje C++ y aprenderás los siguientes temas:

* Operadores básicos de control de flujo: condicionales, switches y bucles.
* Arreglos e iteración sobre sus elementos.
* Tipos de datos personalizados: estructuras y enums.
* Descomposición de programas usando funciones.

Aprenderás estos conceptos desarrollando un sencillo juego 2D basado en la biblioteca gráfica [SFML](https://www.sfml-dev.org/) (Simple and Fast Multimedia Library). Pero primero, debes instalar esta biblioteca en tu sistema. Encuentra las instrucciones de instalación para tu sistema a continuación. Después de instalar la biblioteca, es posible que necesites recargar el proyecto. Para hacerlo, selecciona __File | Reload CMake Project__.

Para verificar que has instalado con éxito la biblioteca, ejecuta el programa adjunto a este paso. Deberías ver una nueva ventana de aplicación que muestra un pequeño planeta en el vasto espacio cósmico.

Para ejecutar el juego, espera hasta que la acción `Loading CMake project` se complete y luego presiona el botón `Run` (un botón de triángulo verde situado en la esquina superior derecha). Asegúrate de que la [configuración de ejecución](https://www.jetbrains.com/help/clion/run-debug-configuration.html) correcta esté seleccionada. Necesitas la configuración "WarmUp-MovingOn-StartTheGame-run".

### Windows

En Windows, no necesitas hacer nada: la biblioteca se instalará junto con este curso. La biblioteca se compila desde el código fuente directamente en tu sistema usando el compilador [incluido](https://www.jetbrains.com/help/clion/quick-tutorial-on-configuring-clion-on-windows.html#MinGW) con el IDE CLion. El script para descargar las fuentes y compilar la biblioteca está incluido en el curso.

### MacOS

En macOS, por favor utiliza el gestor de paquetes [brew](https://brew.sh/) para instalar la biblioteca `sfml`.

```shell
brew install sfml
```

### Ubuntu

En Ubuntu, por favor utiliza el gestor de paquetes [apt](https://ubuntu.com/server/docs/package-management) para instalar la biblioteca `libsfml-dev`.

```shell
sudo apt install libsfml-dev
```

### Otras distribuciones de Linux

Por favor utiliza el gestor de paquetes de tu distribución para instalar la biblioteca SFML.