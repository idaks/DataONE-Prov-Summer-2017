This is an example of how to use PROPERTY PATH in SPARQL to run recursive queries in HAMMING NUMBERS example.

SPARQL Tool: Before running the queries, you need to have Virtuoso installed on your machine. Virtuoso installation & manual can be find here [Virtuoso Manual](https://github.com/idaks/DataONE-Prov-Summer-2017/tree/master/examples/simulate_data_collection/SPARQL-queries/Virtuoso)

Data: [hamming_numbers.ttl](https://github.com/idaks/DataONE-Prov-Summer-2017/blob/master/examples/hamming_numbers/hamming_numbers.ttl)

![Hamming Numbers Example](https://github.com/idaks/DataONE-Prov-Summer-2017/blob/master/examples/hamming_numbers/hamming_numbers.png)

1. Loading data into Virtuoso DB:

   - In order to use SPARQL to query data, first you need to load data into Virtuoso DB. In this example, we want to query the rdf (turtle) file named "virtuoso_family.ttl". Therefore, we have to move this RDF file into Virtuoso folder by the following command:

         mv ~/Downloads/hamming_numbers.ttl /usr/local/Cellar/virtuoso/7.2.4.2/var/lib/virtuoso/db/hamming_numbers.ttl 
 
   - Now start accessing Virtuoso by using the command line:
   
         virtuoso-t –f 
   
   - Open another shell in the terminal, accessing isql and then using the following command to load the virtuoso_family.ttl file in to the Virtuoso DB:
   
         DB.DBA.TTLP_MT (file_to_string_output ('/usr/local/Cellar/virtuoso/7.2.4.2/var/lib/virtuoso/db/hamming_numbers.ttl'), '', 'http://mytest.com')
	 
4. Testing SPARQL queries:
   - Connect to Virtuoso using the following command lines:
   
   	      cd usr/local/Cellar/virtuoso/7.2.4.2/var/lib/virtuoso/db  
	      virtuoso-t –f 
   
   - All the sample SPARQL queries are stored in the bash file "virtuoso_hamming_queries.sh". In order to run the file, open new shell in the terminal, run the following command line:
         
         sh virtuoso_hamming_queries.sh
	 
   - If you want to export the results to txt file, use the following command:
                
         sh virtuoso_hamming_queries.sh > virtuoso_hamming_queries_results.txt
