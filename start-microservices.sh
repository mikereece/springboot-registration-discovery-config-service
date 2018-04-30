#!/bin/bash

STEP="Building and Starting Configuration Server"
cd config-service
mvn clean install spring-boot:run &

STEP="Building and Starting Discovery Server"
cd ../discovery-service
mvn clean install spring-boot:run &

STEP="Building and Starting Gateway Server"
cd ../gateway-service
mvn clean install spring-boot:run