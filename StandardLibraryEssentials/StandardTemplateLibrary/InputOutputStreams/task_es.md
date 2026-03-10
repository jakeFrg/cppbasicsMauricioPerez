En C++, las operaciones de entrada/salida (E/S) se realizan utilizando flujos. Un flujo es una secuencia de bytes que fluye desde una fuente (como un teclado, un archivo o una conexión de red) hasta un destino (como una pantalla, un archivo o una conexión de red). La biblioteca estándar de C++ proporciona varias clases para realizar operaciones de E/S. Su jerarquía se muestra [aquí](https://en.cppreference.com/w/cpp/io#Hierarchy).

Los tipos de flujo más básicos son el flujo de entrada `istream` y el flujo de salida `ostream`, con las funciones correspondientes `std::cin` y `std::cout`. El tipo `istream` proporciona un operador `>>` sobrecargado para entrada, y el tipo `ostream` proporciona un operador `<<` sobrecargado para salida.

```cpp
// Salida estándar (consola)
std::cout << "Hello, World!" << std::endl;

// Entrada estándar (consola)
int inputNumber;
std::cout << "Enter a number: ";
std::cin >> inputNumber;
std::cout << "You entered: " << inputNumber << std::endl;
```

Además de la E/S por consola, C++ ofrece la biblioteca `fstream` para manejar E/S de archivos. La entrada y salida desde/hacia un archivo se realiza mediante `ifstream` (flujo de archivo de entrada) y `ofstream` (flujo de archivo de salida). Estas clases heredan de `istream` y `ostream`, respectivamente.
A continuación, se muestra un ejemplo sencillo de escritura y lectura de un archivo:

```cpp
std::string inputFile = "input.txt";
std::string outputFile = "output.txt";

// Escritura en un archivo
std::ofstream outFile(outputFile);
if (outFile.is_open()) {
    outFile << "Hello, File!" << std::endl;
    outFile.close();
}

// Lectura de un archivo
std::ifstream inFile(inputFile);
std::string line;
if (inFile.is_open()) {
    while (getline(inFile, line)) {
        std::cout << line << '\n';
    }
    inFile.close();
}
```

Tenga en cuenta que para poder acceder al archivo, este debe estar en el mismo directorio que el programa, o se debe especificar la ruta completa del archivo.

Otro tipo importante de flujo es `stringstream`. Permite realizar operaciones de entrada y salida sobre cadenas en memoria, lo cual puede ser útil para el procesamiento y formateo de texto. A continuación se muestra un ejemplo de uso de `stringstream`:

```cpp
    std::string inputString = "Hello, World!";
    std::istringstream inputStream(inputString);
    std::string word;

    while (inputStream >> word) {
        std::cout << word << std::endl;
    }
    
    std::ostringstream outputStream;
    outputStream << "Hello, World!" << std::endl;

    std::cout << outputStream.str();
```

Además, la biblioteca estándar ofrece varios métodos para verificar y manejar errores de E/S, como `fail()`, `bad()`, `eof()` y `good()`. Estos métodos pueden utilizarse para comprobar el estado del flujo y para limpiar las banderas de error.

Por ejemplo, cada flujo tiene asociado un *failbit*, *badbit*, *eofbit* y *goodbit* que pueden verificarse para determinar el estado del flujo. El *failbit* se activa cuando ocurre un error de E/S no fatal, como cuando una operación de entrada no consigue convertir una secuencia de caracteres a un valor válido. El *badbit* se activa cuando ocurre un error fatal de E/S, por ejemplo, al intentar escribir en un archivo cuando el disco está lleno. El *eofbit* se activa cuando una operación de entrada llega al final de una secuencia de entrada. El *goodbit* indica que ninguno de los otros bits está activado.
Así es como se comprueba el estado de un flujo:

```cpp
std::ifstream file("input.txt");
if (file.good()) {
    std::cout << "File opened successfully" << std::endl;
} else {
    if (file.eof()) {
        std::cout << "End of file reached" << std::endl;
    } else if (file.fail()) {
        std::cout << "Non-fatal I/O error" << std::endl;
    } else if (file.bad()) {
        std::cout << "Fatal I/O error" << std::endl;
    }
}
```

Además de comprobar el estado de un flujo, también puede limpiar las banderas de error utilizando la función `clear()` y establecerlas usando la función `setstate()`.

__Los manipuladores de flujo__ son funciones especiales que modifican el comportamiento de los flujos. Por ejemplo, `std::endl` es un manipulador que inserta un salto de línea y vacía el búfer de salida. También podemos utilizar manipuladores como `std::setw` para establecer el ancho de la salida, `std::setprecision` para fijar la precisión de los números en coma flotante y `std::fixed` para mostrar estos números en notación fija. La lista completa de manipuladores puede encontrarse [aquí](https://en.cppreference.com/w/cpp/io/manip).

Aquí algunos ejemplos:
```cpp
std::cout << std::setw(10) << std::left << "Top left" << std::setw(26) << std::right << "Top right" << std::endl;
std::cout << std::setw(10) << std::left << "Bottom left" << std::setw(25) << std::right << "Bottom right" << std::endl;

std::cout << std::fixed << std::setprecision(3) << M_PI << std::endl;
std::cout << std::scientific << std::setprecision(10) << M_PI << std::endl;

std::cout << std::hex << 123456 << std::endl;
std::cout << std::oct << 123456 << std::endl;
std::cout << std::dec << 123456 << std::endl;
```

La salida del programa será:
```
Top left                   Top right
Bottom left             Bottom right
3.142
3.1415926536e+00
1e240
361100
123456
```

Necesita crear un programa que lea toda la entrada cadena por cadena, hasta que se lea la cadena "end". Después de eso, el programa debe mostrar respuestas para cada token en el siguiente formato:

 - Si se lee un número, el programa debe mostrar "Got number: <number>" con una precisión de 3 decimales.
 - Si el token no es un número, el programa debe mostrar "Got string: <string>".
<div class="hint">
  Le recomendamos utilizar `stringstream` para analizar la entrada y recolectar los tokens, ya que es la forma más eficiente para modificar dinámicamente una cadena.

  Un número es una secuencia de dígitos, que puede contener un punto decimal y un signo menos al inicio.
</div>

*¡Felicidades por terminar este módulo! Le animamos a volver a la tarea del [Marcador](course://ObjectOrientedProgramming/ClassesAndObjects/Scoreboard) y ampliar el Planet Game con nuevas características.*