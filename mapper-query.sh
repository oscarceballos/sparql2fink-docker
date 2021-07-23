#!/bin/bash

#Variables: 1->path-to-query.rq 2->path-to-copy-jar

cd ~/

#Open sparql2flink directory
cd sparql2flink

#Run the following command
mvn clean install -DskipTests

#Open target folder
cd target
ls -l

#Run the following command
java -cp sparql2flink-1.0-SNAPSHOT.jar SPARQL2Flink ~/sparql2flink-docker/queries/$1 &

#Open sparql2flink directory
cd ..

#Run the following command
mvn -f pom_query.xml clean package

#Move the query-1.0-SNAPSHOT.jar to queries directory
mv target/query-1.0-SNAPSHOT.jar ~/sparql2flink-docker/queries/$2
ls -l ~/sparql2flink-docker/queries/$2

exit
