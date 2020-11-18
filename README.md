# persona-api/Kubernetes

DESARROLLO

Docker

  1- Empaquetar la API (mvn clean package -DskipTests)
  
  2- Crear la imagen a partir del docker file(docker build -t persona-image)
  
  3- Subir imagen a docker hub( docker tag persona-image {$UsuarioDocker$}/api-persona1.0:latest) y pushearla ( docker push {$UsuarioDocker$}/api-persona1.0)


Kubernetes

  1- Levantar cluster de Minikube con: minikube start
  
  2- Creacion de pods y services(ubicados en resources)
  
  3- Correr todos los ymls (kubectl apply -f $Nombreyml.yml$), para los 5 (deployment,mysqlconfigmap,mysqlcredentials,mysqlrootcredentials,mysqldeployment)
  
  4- Para correr la aplicacion verificar la IP, puertos: minikube service persona-image --url, luego nos metemos a esa url para corrobar que funcione
  
Ver logs y estado de los PODS

  5- Para ver el estado de los PODs: kubectl get pods
  
  6- Para ver el estado particular de un POD: kubectl describe pod -namepod-
  
  7- Para ver los estados de los services kubectl get svc
  
  8- Para ver el estado de los PODs con la IP  kubectl get pods -o wide
  

