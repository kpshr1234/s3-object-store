# S3-object-store

## Set up instructions for terraform

Set AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY as below

```shell
export AWS_ACCESS_KEY_ID="your accesskey"
export AWS_SECRET_ACCESS_KEY="your secretkey"
````


## Set up insructions for Nodejs Application

Genenrate AWS credentials with s3 read acess and create .env file as below

```shell
accessKeyId = 'your access key'
secretAccessKey = 'your secret key'
```

### Deployment instructions

#### Run terraform templates from tf-templates directory

```shell
cd tf-templates
terraform init
terraform plan
terraform apply
```
#### Create dockerhub account and execute commands as follow

```shell
docker login 
docker build -t hebbarshravan/s3-object-store:latest .
docker push hebbarshravan/s3-object-store:latest
```

#### Update helm chart values to match with dockerhub account and reposiitory as below

```
image:
  repository: hebbarshravan/s3-object-store
  tag: latest
  pullPolicy: IfNotPresent
```

#### Install and start minikube cluster 

https://minikube.sigs.k8s.io/docs/start/

#### Install helm client 

#### Install Helm chart 

```shell 
helm install "my-app" helm-chart
```

#### Get running service list

```shell
minikube service list
```

#### Get the URL using

```shell
minikube service my-app-helm-chart --url 
```













