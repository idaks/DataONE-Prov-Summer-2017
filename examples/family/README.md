This is an example of how to use PROPERTY PATH in SPARQL to run recursive queries.

Data: [virtuoso_family.ttl](DataONE-Prov-Summer-2017/examples/family/virtuoso_family.ttl)

Before running the queries, 

Loading data into Virtuoso DB:

   - In order to use SPARQL to query data, first you need to load data into Virtuoso DB. In this example, we want to query the rdf (turtle) file named [simulate_data_collection_wf_model.ttl](DataONE-Prov-Summer-2017/examples/simulate_data_collection/RDF-facts/simulate_data_collection_wf_model.ttl). Therefore, we have to move this RDF file into Virtuoso folder by the following command:

         mv ~/Downloads/simulate_data_collection_wf_model.ttl /usr/local/Cellar/virtuoso/7.2.4.2/var/lib/virtuoso/db/simulate_data_collection_wf_model.ttl 
 
   - Now start accessing Virtuoso by using the command line:
   
         virtuoso-t –f 
   
   - Open "isql" shell, using the following command to load the similate_data_collection_wf_model.ttl file in to the Virtuoso DB:
   
         DB.DBA.TTLP_MT (file_to_string_output ('/usr/local/Cellar/virtuoso/7.2.4.2/var/lib/virtuoso/db/simulate_data_collection_wf_model.ttl'), '', 'http://mytest.com')
	 
4. Testing SPARQL queries:
   - All the sample SPARQL queries are stored in the bash file "virtuoso_run_queries.sh".
   - In order to run the file, open terminal, run the following command line:
         
         sh virtuoso_run_queries.sh


DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/README.md
