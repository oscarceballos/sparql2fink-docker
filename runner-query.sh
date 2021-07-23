#!/bin/bash

#Variables: 1->parallelism 2->path-to-jar 3->dataset

#Launch a cluster in the background
cd docker-compose
docker-compose up -d
cd ..

#Copy the .jar file to container
JOB_CLASS_NAME="sparql2flink.out.Query"
JOBMANAGER_CONTAINER=$(docker ps --filter name=jobmanager --format={{.ID}})
docker cp $2 "${JOBMANAGER_CONTAINER}":/job.jar

#Run the .jar file
docker exec -t -i "$JOBMANAGER_CONTAINER" flink run -p $1 -c ${JOB_CLASS_NAME} /job.jar --dataset /datasets/$3 --output /output/

#Down cluster
cd docker-compose
docker-compose down -v

#Print result
cd ../
ls -l output/
cat output/Query-Flink-Result

exit
