# Base de datos

Para este reto estaremos utilizando el servicio de RDS (Relational Database Service) de AWS. Este servicio nos permite tener una base de datos relacional en la nube. En este caso, utilizaremos RDS para almacenar la base de datos de WordPress.

## Creación de RDS

Para crear una base de datos de RDS, siga los siguientes pasos:

1. Ingrese a la consola de AWS y busque el servicio de RDS.

1. Haga clic en el botón de "Create database".

1. Seleccione el motor de base de datos que desea utilizar. En este caso, utilizaremos MySQL.

1. Seleccione la opción de "Standard Create".

1. En la sección de "Templates", seleccione la plantilla de "Free tier".

1. En la sección de "Settings", configure los siguientes campos (darle a "Self managed"):

   - DB instance identifier: Nombre de la base de datos.
   - Master username: Usuario de la base de datos.
   - Master password: Contraseña de la base de datos.

1. EN "VPC", seleccione la VPC en la que se encuentra el cluster de Kubernetes.

1. En "Security group", cree un nuevo security group llamado `db-reto-4` y selecciónelo.

1. Darle click en "Create database".

## Configuración de RDS

Para terminar de configurar la base de datos se deben seguir los siguientes pasos:

1. Ingrese a la consola de AWS y busque el servicio de EC2.

1. En la sección de "Security Groups", seleccione el security group que se creó anteriormente.

1. En la pestaña de "Inbound rules", darle click en "Edit inbound rules".

1. Agregar una nueva regla con los siguientes valores:

   - Type: MySQL/Aurora
   - Protocol: TCP
   - Port range: 3306
   - Source: Anywhere

1. Darle click en "Save rules".

1. Luego, cree una máquina EC2 en la misma VPC que el cluster de Kubernetes.

1. En ella instale el cliente de MariaDB:

   ```bash
   sudo apt-get update
   sudo apt-get install mariadb-client
   ```

1. Conéctese a la máquina EC2 y ejecute el siguiente comando para conectarse a la base de datos de RDS:

   ```bash
   mysql -h <endpoint> -P 3306 -u <username> -p
   ```

   Donde `<endpoint>` es el endpoint de la base de datos de RDS y `<username>` es el usuario de la base de datos.

1. Ingrese la contraseña de la base de datos y verifique que se haya conectado correctamente.

1. Ejecutar el siguiente comando para crear la base de datos de WordPress:

   ```sql
   CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
   ```

1. Verificar que la base de datos se haya creado correctamente:

   ```sql
    SHOW DATABASES;
   ```

1. Crear un usuario para la base de datos de WordPress:

   ```sql
   CREATE USER 'wordpress'@'%' IDENTIFIED BY 'password';
   ```

1. Darle permisos al usuario sobre la base de datos:

   ```sql
    GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';
   ```

1. Actualizar los permisos:

   ```sql
    FLUSH PRIVILEGES;
   ```

1. Salir de la consola de MySQL:

   ```sql
    exit;
   ```

## Referencias

- [Wordpress Conectado a RDS con MySQL (AWS en Español) 🔥](https://www.youtube.com/watch?v=mXlTkvZ8l4g)
