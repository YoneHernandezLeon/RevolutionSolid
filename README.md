# RevolutionSolid
Autor: Yone Hernández León

### Descripción de la aplicación
La aplicación consiste en un programa que dibuja un sólido 3D a partir de una silueta 2D utilizando la tecnica de dibujo de revolución. El programa ofrece la capacidad de reiniciar los puntos de la silueta 2D si así lo requiriese el usuario.

### Caracteristicas de la aplicación
Para la realización de esta aplicación fueron solicitadas algunas características básicas. Estas propiedades son las siguientes:
- Trazado de los puntos de la figura 2D
- Trazado de la figura 3D
- Rotación de la figura 3D
- Capacidad de reiniciar la figura para comenzar de nuevo

### Decisiones adoptadas para la solución propuesta
Para la solución propuesta, primero se creó la clase Point. Esta clase luego servirá para guardar cada cordenada de los clicks del ratón a la hora de crear la silueta 2D. Una vez obtenidos los puntos de la silueta 2D, se aplicó la tecnica de revolución para poder dibujar la figura 3D. Por último, se modificó la posición de la figura resultante y se añadió la capacidad de rotación del mismo.

### Resultado de la aplicación
![Animación 1](https://github.com/YoneHernandezLeon/RevolutionSolid/blob/main/revo.gif?raw=true)

### Errores conocidos
No se han encontrado errores mayores que influyan, salvo quizá la desfasada rotación del objeto en algunos casos.

### Referencias
##### Lenguaje de programación:
- https://processing.org/reference/
