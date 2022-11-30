# IAM.tf example: MYIAM-02

# Prerequisites

* docker-compose
* docker
* terraform
* IAM.tf terraform provider
* iamtfctl

# Start all containers

```
docker-compose build
docker-compose up
```
# Configure the server

Access the `tf` folder and run terraform commands:

```
cd tf
terraform init
terraform apply
```

# Start the appliance

```
export JOSSO_API_APPLIANCE=myiam-02
export JOSSO_API_CLIENT_ID=idbus-f2f7244e-bbce-44ca-8b33-f5c0bde339f7
export JOSSO_API_SECRET=7oUHlv(HLT%vxK4L
export JOSSO_API_ENDPOINT=http://localhost:8081/atricore-rest/services

iamtfctl start
iamtfctl list appliances
ID        NAME       STATE     LOCATION
1         myiam-02   STARTED   http://localhost:8081/IDBUS/MYIAM-02
```
# Test it!

Open a browser in one of the two applications: 

* http://localhost:8080/partnerapp1
* http://localhost:8080/partnerapp2

Try **user1** and **user1pwd** credentials