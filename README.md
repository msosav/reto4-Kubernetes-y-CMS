# ST0263 Tópicos Especiales en Telemática

- **Estudiante: Miguel Sosa, msosav@eafit.edu.co**
- **Estudiante: Miguel Jaramillo, mjaramil20@eafit.edu.co**
- **Estudiante: Sergio Córdoba, sacordobam@eafit.edu.co**

**Profesor: Edwin Montoya, emontoya@eafit.edu.co**

## Reto 4

### 1. Breve descripción de la actividad

Como se ha observado a lo largo del curso, son varios los ambientes en los cuales se puede desplegar una aplicación, desde servidores en data centers propios (on-premise), servidores en nube con muchos servidores propios o administrados para mejorar su disponibilidad, menores costos, tiempos de despliegue de aplicaciones etc.

En el reto 3, se desplegó una versión dockerizada de un CMS o LMS, con un balanceador simple de cargas, sin autoescalamiento y con dependencia de la base de datos y el sistema de archivos distribuido.
En este reto 4, uds desplegarán la misma aplicación del reto 3 pero en un clúster Kubernetes en nube. Se utilizará un servicio administrado en nube como EKS de AWS o Kubernets de GCP.

Debe cumplir los mismos requerimientos del reto 3, respecto a contar con nombre de dominio, https, balanceador, base de datos externa y sistema de archivos externos a la capa de servicios (app).

Los clústeres Kubernetes hoy en día se están empleando mucho, porque con un diseño relativamente simple y con un mecanismo de Manifiestos o lenguajes declarativos, podemos soportar grandes escalamientos, tanto por el incremento de capacidad de nodos en el clúster de Kubernetes, así como el escalamiento dentro del clúster Kubernetes de las aplicaciones contenerizadas.

#### 1.1. Que aspectos cumplió o desarrolló de la actividad propuesta por el profesor (requerimientos funcionales y no funcionales)

#### 1.2. Que aspectos NO cumplió o desarrolló de la actividad propuesta por el profesor (requerimientos funcionales y no funcionales)

### 2. Información general de diseño de alto nivel, arquitectura, patrones, mejores prácticas utilizadas.

### 3. Descripción del ambiente de desarrollo y técnico: lenguaje de programación, librerias, paquetes, etc, con sus numeros de versiones.

- Como se compila y ejecuta.
- Detalles del desarrollo.
- Detalles técnicos
- Descripción y como se configura los parámetros del proyecto (ej: ip, puertos, conexión a bases de datos, variables de ambiente, parámetros, etc)
- Opcional - detalles de la organización del código por carpetas o descripción de algún archivo. (ESTRUCTURA DE DIRECTORIOS Y ARCHIVOS IMPORTANTE DEL PROYECTO, comando 'tree' de linux)
- Opcional - si quiere mostrar resultados o pantallazos

### 4. Descripción del ambiente de ejecución (en producción) lenguaje de programación, librerias, paquetes, etc, con sus numeros de versiones.

- IP o nombres de dominio en nube o en la máquina servidor.
- Descripción y como se configura los parámetros del proyecto (ej: ip, puertos, conexión a bases de datos, variables de ambiente, parámetros, etc)
- Como se lanza el servidor.
- Una mini guia de como un usuario utilizaría el software o la aplicación
- Opcional - si quiere mostrar resultados o pantallazos

### 5. Otra información que considere relevante para esta actividad.

## Referencias:
