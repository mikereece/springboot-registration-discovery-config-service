# registration-discovery-config

This project utilises a number of technologies from the Spring Framework version 4.x, notably: Spring Boot to create stand-alone applications (microservices) with embedded servers; Spring Cloud Netflix featuring Eureka and Zuul for service discovery and registration; Spring Cloud Config to provide server and client-side support for externalised configuration.

## Getting Started

Functionality wise, the project is configured and ready to run out of the box. There are 3 Microservices which make up the project:

1) config-service - annotated with @EnableConfigServer this microservice acts as a Configuration Server pointing to a repository or directory containing externalised configuration for other microservices. In this project the externalised configuration is held within the projects resources directory, however, if this project had its own Git repository, then the configuration files would be contained within there own repository. This best practice would ensure that if any changes to configuration were required then, it would require the Configuration Server being taken down to be redeployed with the new set of configuration.

This microservice is also registered to the discovery server with the @EnableDiscoveryClient annotation and configuration within the application.yml file.

2) discovery-service - annotated with @EnableEurekaServer this microservice acts as the Discovery Server, which is powered through Spring's Eureka. Eureka has its own front end UI, which shows the services currently registered to it, which can be accessed through <http://localhost:8761/>. This service is run on its own port, allowing other microservices to register themselves to it so the administration of those services can take place and be monitored from one central location.

3) gateway-service - annotated with @EnableZuulProxy this microservice acts as the Gateway API service from which all other microservices within a web application can be routed through to provide a method of load balancing (Hystrix and Ribbon) requests as well as added security and an authentication layer (Zuul). API routes are defined within the application.yml. 

This microservice is also registered to the discovery server with the @EnableDiscoveryClient annotation and configuration within the application.yml file.

## Prerequisites

The setup and running of this project assumes that you have Java, Spring Framework v4.x, Maven and an IDE (e.g. Eclipse) running..

## Running the Applications

Within the parent folder of this project there is a start-microservice.sh script, which builds and starts each of the Spring Boot microservices. Once running, enter the URL <http://localhost:8761/> into a web browser and Spring's Eureka UI will be displayed. If the application has been deployed and is running successfully, you should see both the CONFIGSERVER and GATEWAYSERVICE applications displayed as registered instances with Eureka.

## Deployment

This project is built and deployed using Maven.

The goal for this project is to Docker-ise it so the Microservices are deployed as Docker Images within a single Docker Container.

A further enhancement would be to put this project into a Git repository. This would allow the configuration files which are accessed by the configuration server to be contained within their own repository (externalised from the application itself).

## Versioning

0.0.1-SNAPSHOT (First Pass)

## Authors

Michael Reece

## References

<http://docs.spring.io/spring-boot/docs/2.0.0.M1/reference/htmlsingle/>
<http://cloud.spring.io/spring-cloud-netflix/spring-cloud-netflix.html>
<http://cloud.spring.io/spring-cloud-static/spring-cloud.html#_spring_cloud_config>