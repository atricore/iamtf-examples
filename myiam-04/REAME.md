# IAM.tf example: myiam-04

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
export JOSSO_API_APPLIANCE=myiam-04
export JOSSO_API_CLIENT_ID=idbus-f2f7244e-bbce-44ca-8b33-f5c0bde339f7
export JOSSO_API_SECRET=7oUHlv(HLT%vxK4L
export JOSSO_API_ENDPOINT=http://localhost:8081/atricore-rest/services

iamtfctl start
iamtfctl list appliances
ID        NAME       STATE     LOCATION
1         myiam-04   STARTED   http://localhost:8081/IDBUS/myiam-04
```
# Test it!

Open a browser in one of the two applications: 

* http://localhost:8080/partnerapp1
* http://localhost:8080/partnerapp2

Try **user1** and **user1pwd** credentials

# Installing extensions

1. Deploy OSGi bundle
2. Add bundle symbolic name to appliance bundles property

# Common errors

If you missconfigured the extension (i.e. wrong URI, missing JAR), you will see something like:

```log
myiam-04-iamtf-1  | INFO  | Thread-4         | FeaturesServiceImpl              | res.internal.FeaturesServiceImpl  302 | 13 - org.apache.karaf.features.core - 2.2.3 | Error when installing feature josso-ce: java.lang.RuntimeException: URL [mvn:org.atricore.idbus.examples/org.atricore.idbus.examples.custom-identity-source-db/1.6.0-SNAPSHOT] could not be resolved.
```