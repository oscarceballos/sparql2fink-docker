
--------------------------------------------------------------------------------
PASO PARA TRANSFORAR UNA CONSULTA SPARQL A UN PROGRAMA EN FLINK Y SU EJECUCIÓN
--------------------------------------------------------------------------------

1. Ubicarse en el directorio home
------------------------------------------------------
cd ~/



2. Descarge el repositorio sparql2flink desde GitHub
------------------------------------------------------
git clone https://github.com/oscarceballos/sparql2flink.git



3. Descomprimir en el directorio home el archivo sparql2flink-docker.zip



4. Ingresar al directorio sparql2flink-docker
------------------------------------------------------
cd sparql2flink-docker



5. Ejecutar el siguiente comando:
------------------------------------------------------
(Plantilla)
./mapper-query.sh <path-to-query.rq> <path-to-copy-jar>

(Ejemplo)
./mapper-query.sh example/query.rq example/



6. Ejecutar el siguiente comando:
------------------------------------------------------
(Plantilla)
./runner-query.sh <parallelism> <path-to-jar> <dataset>

(Ejemplo)
./runner-query.sh 2 queries/example/query-1.0-SNAPSHOT.jar dataset.nt



7. Repetir los pasos 5 y 6 por cada consulta
