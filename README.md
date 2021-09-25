# SPARQL2Flink-Docker
This repository contains a step-by-step guide to test the SPARQL2Flink library with docker-compose. The proof of the SPARQL2Flink library reused a subset of the queries defined by the Berlin SPARQL Benchmark (BSBM) [Bizer and Schultz, 2009]. The SPARQL2Flink library does not implement the SPARQL protocol and cannot be used as a SPARQL endpoint. It is important to note that this does not impose a strong limitation to our approach. This is an engineering task that will be supported in the future. For this reason, we do not use the test drive proposed in BSBM.

## Datasets
One dataset was generated using the BSBM data generator by setting up the number of products, number of producers, number of vendors, number of offers, and number of triples, as shown in Table 1.

| Dataset | Products | Producers | Vendors | Offers | No. Triples |
|:--------------|:-------------:|--------------:|:-------------:|:--------------:|:--------------:|
| ds20mb | 209 | 5 | 2 | 4,180 | 78,351 |

![Image text](/images/queries-citybench-stream.png)

For each dataset, one file was generated in N-Triples format. The name of each dataset is associated with the size of the dataset in Megabytes or Gigabytes. The ds20mb dataset was used to perform the correctness tests. ds300mb, ds600mb, ds1gb, ds2gb, and ds18gb datasets were used to perform the scalability tests in the local cluster.

## Verify which SPARQL query templates are supported
The BSBM offers 12 different SPARQL query templates to emulate the search and navigation pattern of a consumer looking for a product [Bizer and Schultz, 2009]. We modify the query template omitting SPARQL operators and ex- pressions that are not yet implemented in the library. The SPARQL query templates Q1, Q2, Q3, Q4, Q5, Q7, Q8, Q10, and Q11 were instantiated. Table 6.2 summarizes the list of queries that are Supported (S), Partially Supported (PS), and Not Supported (NS) by SPARQL2Flink library. In the case where the query is Partially Supported, it is detailed how the query was modified to be able to transform it into a Flink program.

![Image text](/images/queries-citybench-stream.png)

The following is the modified Q3 query template after removing the bounded function.

```
PREFIX
PREFIX
PREFIX
PREFIX

```

Subsequently, the SPARQL2Flink library converts each SPARQL query into a Logical Query Plan expressed in terms of SPARQL Syntax Expression (SSE). The Logical Query Plans of Q3 query template can be seen in the following.

```
(project (?product ?label)
  (order (? label)
    (filter (exprlist (> ?p1%x%) (< ?p3%y%))
      (leftjoin
        (bgp
          

```

Finally, each Logical Query Plan was transformed into a Flink program through the SPARQL2Flink library. The Flink program corresponding to Logical Query Plans of Q3 query template can be seen in the following.

```
...
public class Query {

```


### References
Bizer, C. and Schultz, A. (2009). The berlin sparql benchmark. Int. J. Semantic Web Inf. Syst., 5:1–24.
