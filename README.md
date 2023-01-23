 [![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/openapi-server-gen)
 [![Quality Gate Status](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Fopenapi-server-gen&metric=alert_status)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Fopenapi-server-gen)
 [![Reliability Rating](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Fopenapi-server-gen&metric=reliability_rating)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Fopenapi-server-gen)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat&logo=AdGuard)](LICENSE)

# openapi-server-gen

This is a library to generate server-side REST classes for intersystems IRIS.  


## Installation zpm

```
zpm "install openapi-server-gen"
```

optional swagger-ui

```
zpm "install swagger-ui"
```

## Installation docker

```
git clone git@github.com:lscalese/openapi-server-gen.git
cd openapi-server-gen
docker-compose up -d
```


## Usage

Generate petstore server-side class from OpenAPI 3 specification

Open an IRIS terminal : 

```
Set applicationName = "petstoresrv" ; this is the package name for the generated classes.  
Set webApplication = "/petstore/api" ; webapplication name to create, leave empty if you don't want create the web apps
Set sc = ##class(dc.openapi.server.ServerAppGenerator).Generate(applicationName, "https://petstore3.swagger.io/api/v3/openapi.json", webApplication)
```

Explorer generated class in `petstoresrv` package.  

If you install `swagger-ui`  you can open this page http://localhost:52796/swagger-ui/index.html and then explore http://localhost:52796/petstore/api/_spec


More information about this package will be available soon on [OpenExchange](https://openexchange.intersystems.com).  