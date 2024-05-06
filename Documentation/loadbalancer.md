# Load Balancer

Para este reto se usará NGINX como balanceador de carga.

## Creación de Load Balancer

Para crear un balanceador de carga con NGINX, se deben seguir los siguientes pasos (en AWS CloudShell):

1. Instale `kubectl` en `AWS CloudShell` con el siguiente comando:

   ```bash
   curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.29.3/2024-04-19/bin/linux/amd64/kubectl
   ```

1. Instale `helm` en `AWS CloudShell` con el siguiente comando:

   ```bash
   curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh
   chmod 700 get_helm.sh
   ./get_helm.sh
   ```

1. Desplegar el controlador de NGINX Ingress con Helm:

   ```bash
   helm upgrade --install ingress-nginx ingress-nginx \
   --repo https://kubernetes.github.io/ingress-nginx \
   --namespace ingress-nginx --create-namespace
   ```

1. Verificar que el controlador de NGINX Ingress se haya desplegado correctamente:

   ```bash
   kubectl get service ingress-nginx-controller --namespace=ingress-nginx
   ```

1. Instalar cert-manager con Kubectl:

   ```bash
   kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.5/cert-manager.yaml
   ```

1. Verificar que cert-manager se haya desplegado correctamente:

   ```bash
   kubectl get pods --namespace cert-manager
   ```

1. Crear un archivo `cluster-issuer.yaml` con el siguiente contenido:

   ```yaml
   apiVersion: cert-manager.io/v1
   kind: ClusterIssuer
   metadata:
   name: letsencrypt-prod
   spec:
   acme:
     server: https://acme-v02.api.letsencrypt.org/directory
     email: correo@email.com
     privateKeySecretRef:
       name: letsencrypt-prod
     solvers:
       - http01:
           ingress:
             class: nginx
   ```

1. Aplique el archivo `cluster-issuer.yaml` con el siguiente comando:

   ```bash
   kubectl apply -f cluster-issuer.yaml
   ```

1. Crear un archivo `nginx.yaml` con el siguiente contenido:

   ```yaml
   apiVersion: networking.k8s.io/v1
   kind: Ingress
   metadata:
   name: ingress-service
   annotations:
      cert-manager.io/issuer: letsencrypt-prod
      nginx.ingress.kubernetes.io/ssl-redirect: "true"
      nginx.ingress.kubernetes.io/backend-protocol: "HTTP"
      nginx.ingress.kubernetes.io/use-regex: "true"
      nginx.ingress.kubernetes.io/rewrite-target: /$1
   spec:
   ingressClassName: nginx
   tls:
      - hosts:
         - dominio.com
      secretName: dominio-com-tls
   rules:
      - host: dominio.com
      http:
         paths:
            - path: /
            pathType: Prefix
            backend:
               service:
                  name: wordpress
                  port:
                  number: 80
   ```

1. Aplique el archivo `nginx.yaml` con el siguiente comando:

   ```bash
   kubectl apply -f nginx.yaml
   ```

1. Verifique que el balanceador de carga se haya creado correctamente:

   ```bash
   kubectl get ingress
   ```

1. Vaya a la consola de AWS y busque el balanceador de carga creado.

1. Copie la dirección del balanceador de carga y péguela en el navegador.

1. Debería ver la página de inicio de Wordpress.

1. Para registrarla en el DNS, cree un CNAME en la zona de DNS de su dominio que apunte al balanceador de carga.

## Referencias

- [NGINX Ingress Controller](https://kubernetes.github.io/ingress-nginx/deploy/#quick-start)
- [How to expose Ingress Nginx on EKS AWS](https://www.youtube.com/watch?v=vc9ktVSBjfo)
- [Using Helm with Amazon EKS](https://docs.aws.amazon.com/eks/latest/userguide/helm.html)
- [Cert Manager installation](https://cert-manager.io/docs/installation/kubectl/)
