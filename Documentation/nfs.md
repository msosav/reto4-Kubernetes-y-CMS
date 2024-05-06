# NFS

Para este reto estaremos utilizando el servicio de EFS (Elastic File System) de AWS. Este servicio nos permite tener un sistema de archivos compartido entre varios nodos de un cluster de Kubernetes. En este caso, utilizaremos EFS para almacenar los archivos de WordPress.

## Creación de EFS

Para crear un sistema de archivos de EFS, siga los siguientes pasos:

1. Ingrese a la consola de AWS y busque el servicio de EFS.

1. Haga clic en el botón de "Create file system".

1. Seleccione la VPC en la que se encuentra el cluster de Kubernetes.

1. Seleccione el File system recién creado.

1. Ir a la pestaña de "Network" y darle click en "Manage".

1. En los Security groups, seleccionar el security group que se está utilizando en el cluster de Kubernetes. Ejemplo: `eksctl-cluster-eksworkshop-eksctl-cluster-ClusterSharedNodeSecurityGroup-1QJZQJZQJZQJZ`.

## Configuración de EFS en Kubernetes

Para montar el sistema de archivos de EFS en los pods de Kubernetes, se debe crear un PersistentVolume y un PersistentVolumeClaim. A continuación se muestra un ejemplo de cómo se puede hacer esto:

efs.yaml

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: reto-4-efs
spec:
  accessModes:
    - ReadWriteMany
  capacity:
    storage: 1Mi
  nfs:
    path: /
    server: <DNS-name-efs>
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: reto-4-claim
spec:
  storageClassName: ""
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1Mi
```

En el campo `server` se debe colocar el DNS name del EFS que se creó anteriormente.

## Aplicar los cambios

1. Instale `kubectl` en `AWS CloudShell` con el siguiente comando:

   ```bash
   curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.29.3/2024-04-19/bin/linux/amd64/kubectl
   ```

1. Para aplicar los cambios, se debe ejecutar el siguiente comando:

   ```bash
   kubectl apply -f efs.yaml
   ```

## Referencias

- [Kubernetes Persistent Volumes NFS (AWS | EKS | EFS Storage Class | EFS Provisioner | ReadWriteMany)](https://www.youtube.com/watch?v=Sj0MVk0jM_4)
