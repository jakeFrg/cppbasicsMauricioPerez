Tu próxima tarea es mover el planeta en la pantalla con la ayuda de unas pocas líneas de código en C++.

La posición de un objeto en la pantalla se define por sus coordenadas. En una escena bidimensional, cada objeto tiene dos coordenadas: la coordenada x horizontal y la coordenada y vertical. Como primer paso, solo necesitarás mover el objeto horizontalmente.

Para mover un objeto, necesitas implementar la función `move`. Dada la posición anterior del objeto, la velocidad del objeto y el tiempo transcurrido desde la última actualización de la escena, esta función debe calcular y devolver la nueva posición del objeto.

Para calcular la trayectoria de un objeto, puedes usar una fórmula simple:

```
x` = x + d * v
```

Aquí,

* `x` es la coordenada x anterior del objeto;
* `` x` `` es la nueva coordenada x del objeto;
* `v` es la velocidad del objeto;  
* `d` es el delta de tiempo.