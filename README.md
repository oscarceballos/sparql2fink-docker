# SPARQL2Flink-Docker
This repository contains a step-by-step guide to test the SPARQL2Flink library with docker-compose. The proof of the SPARQL2Flink library reused a subset of the queries defined by the Berlin SPARQL Benchmark (BSBM) [Bizer and Schultz, 2009]. The SPARQL2Flink library does not implement the SPARQL protocol and cannot be used as a SPARQL endpoint. It is important to note that this does not impose a strong limitation to our approach. This is an engineering task that will be supported in the future. For this reason, we do not use the test drive proposed in BSBM.

## Datasets
One dataset in N-Triples format was generated using the BSBM data generator by setting up the number of products, number of producers, number of vendors, number of offers, and number of triples. The name of the dataset is associated with the size of the dataset in Megabytes, as shown in Table 1.

| Dataset | Products | Producers | Vendors | Offers | No. Triples |
|:--------------|:-------------:|:--------------:|:-------------:|:--------------:|:--------------:|
| ds20mb | 209 | 5 | 2 | 4,180 | 78,351 |

## SPARQL query supported by SPARQL2Flink library
The BSBM offers 12 different SPARQL query templates to emulate the search and navigation pattern of a consumer looking for a product [Bizer and Schultz, 2009]. We modify the query template omitting SPARQL operators and ex- pressions that are not yet implemented in the library. The SPARQL query templates Q1, Q2, Q3, Q4, Q5, Q7, Q8, Q10, and Q11 were instantiated. Table 6.2 summarizes the list of queries that are Supported (S), Partially Supported (PS), and Not Supported (NS) by SPARQL2Flink library. In the case where the query is Partially Supported, it is detailed how the query was modified to be able to transform it into a Flink program.

![Image text](/images/queries-citybench-stream.png)

Queries Q1, Q2, Q3, Q4, Q5, Q7, Q8, Q9, and Q10 are available in the queries folder. Each folder contains the query expressed in SPARQL sintax and its corresponding transformation into DataSet Flink program.

## SPARQL2Flink with docker-compose
The SPARQL2Flink library is composed of two modules, called: Mapper and Runner. The Mapper module transforms a declarative SPARQL query into a DataSet Flink program. This Runner module allows executing a Flink program (as a jar file) on a local cluster.

### Steps to run Mapper module
1. Select home directory
```
cd ~/
```
2. Download SPARQL2Flink repository
```
git clone https://github.com/oscarceballos/sparql2flink-docker.git
```
3. Run the following command to deploy on docker
```
./runner-query.sh 2 queries/query1/query-1.0-SNAPSHOT.jar
```
3. Run the following command to see the query results
```
tail -f /output/Query-Flink-Result
``` 


### References
Bizer, C. and Schultz, A. (2009). The berlin sparql benchmark. Int. J. Semantic Web Inf. Syst., 5:1–24.
