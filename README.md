# ST0263 Tópicos Especiales en Telemática

- **Estudiante: Miguel Sosa, msosav@eafit.edu.co**
- **Estudiante: Miguel Jaramillo, mjaramil20@eafit.edu.co**
- **Estudiante: Sergio Córdoba, sacordobam@eafit.edu.co**

**Profesor: Edwin Montoya, emontoya@eafit.edu.co**

## Reto 4

### 1. Breve descripción de la actividad

Se desplegará la misma aplicación que en el reto 3, pero en un clúster Kubernetes en la nube utilizando servicios administrados como EKS de AWS o GCP, lo que permite cumplir con los mismos requisitos de contar con un nombre de dominio, HTTPS, un balanceador de carga, una base de datos externa y un sistema de archivos externo a la capa de servicios de la aplicación, aprovechando la capacidad de escalado eficiente y la rápida implementación que ofrece Kubernetes para gestionar y escalar las aplicaciones contenerizadas.

#### 1.1. Que aspectos cumplió o desarrolló de la actividad propuesta por el profesor (requerimientos funcionales y no funcionales)

- [x] Se desplegó la aplicación en un clúster Kubernetes en la nube.
- [x] Se utilizó un servicio administrado como EKS de AWS o GCP.
- [x] Se cumplió con los mismos requisitos de contar con un nombre de dominio, HTTPS, un balanceador de carga, una base de datos externa y un sistema de archivos externo a la capa de servicios de la aplicación.
- [x] Se implementó el certificado SSL para el dominio.

#### 1.2. Que aspectos NO cumplió o desarrolló de la actividad propuesta por el profesor (requerimientos funcionales y no funcionales)

Se cumplió con todos los requerimientos propuestos por el profesor.

### 2. Información general de diseño de alto nivel, arquitectura, patrones, mejores prácticas utilizadas.

### 3. Descripción del ambiente de ejecución (en producción) lenguaje de programación, librerias, paquetes, etc, con sus numeros de versiones.

#### Configuración

- [Base de datos](https://github.com/msosav/reto4-Kubernetes-y-CMS/blob/main/Documentation/database.md)
- [Sistema de archivos](https://github.com/msosav/reto4-Kubernetes-y-CMS/blob/main/Documentation/nfs.md)
- [Wordpress](https://github.com/msosav/reto4-Kubernetes-y-CMS/blob/main/Documentation/wordpress.md)
- [Load Balancer](https://github.com/msosav/reto4-Kubernetes-y-CMS/blob/main/Documentation/loadbalancer.md)

#### Ejecución

Cuando se ejectute el servicio se debe ejecutar en el siguiente orden:

```bash
kubectl apply -f efs.yaml
kubectl apply -f wordpress.yaml
kubectl apply -f cluster-issuer.yaml
kubectl apply -f nginx.yaml
```

#### Pantallazos

![image](https://github.com/msosav/reto4-Kubernetes-y-CMS/assets/85181687/97e10019-e9ac-46c7-bcb3-4de10b1ccf1c)

## Referencias:
