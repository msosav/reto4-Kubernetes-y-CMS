# WordPress

## Creación de un WordPress en Kubernetes

Para montar un WordPress en un cluster de Kubernetes, se deben seguir los siguientes pasos:

1. Ingrese a la consola de AWS y busque el servicio de EKS.

1. Cree un cluster de EKS.

1. Instale `kubectl` en `AWS CloudShell` con el siguiente comando:

   ```bash
   curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.29.3/2024-04-19/bin/linux/amd64/kubectl
   ```

1. Cree un archivo `wordpress.yaml` con el siguiente contenido:

   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
   name: wordpress
   spec:
   replicas: 3
   selector:
       matchLabels:
       app: wordpress
   template:
       metadata:
       labels:
           app: wordpress
       spec:
       containers:
           - name: wordpress
           image: wordpress
           ports:
               - containerPort: 80
           env:
               - name: WORDPRESS_DB_HOST
               value: <DNS-DB>
               - name: WORDPRESS_DB_USER
               value: wordpressuser
               - name: WORDPRESS_DB_PASSWORD
               value: password
               - name: WORDPRESS_DB_NAME
               value: wordpress
           volumeMounts:
               - name: efs
               mountPath: /mnt/wordpress
       volumes:
           - name: efs
           persistentVolumeClaim:
               claimName: reto-4-claim
   ---
   apiVersion: v1
   kind: Service
   metadata:
   name: wordpress
   spec:
   selector:
       app: wordpress
   ports:
       - protocol: TCP
       port: 80
       targetPort: 80
   ```

1. En el campo `value` de `WORDPRESS_DB_HOST`, se debe colocar el DNS de la base de datos de RDS.

1. En el campo `claimName` de `persistentVolumeClaim`, se debe colocar el nombre del `PersistentVolumeClaim` que se creó en el archivo `efs.yaml`.

1. Aplique los cambios ejecutando el siguiente comando:

   ```bash
   kubectl apply -f wordpress.yaml
   ```
