
1. Installation Virtuoso (on MacOS): 
   - Install Honeybrew by opening Terminal, use the following command. Homebrew is a package manager for Mac OS and provides builds for      many popular open source software packages:
          
          
          ruby -e "$(curl –fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 

   - Install Virtuoso using Honeybrew by the following command: 
          
          brew install virtuoso 
          
2. Starting Virtuoso: 
   - After Homebrew has installed all dependencies and Virtuoso itself, we are ready to go. Virtuoso needs a virtuoso.ini file that contains all settings for the server. Our installation comes with a sample .ini file, located in /usr/local/Cellar/virtuoso/7.2.4.2/var/lib/virtuoso/db/. Change into that directory and start virtuoso by running the following two commands: 
    
         cd usr/local/Cellar/virtuoso/7.2.4.2/var/lib/virtuoso/db  
         virtuoso-t –f 
         
   - Now, you are running Virtuoso already. From this point, you have two options to run SPARQL queries in Virtuoso: 
 
      + Option 1: Access Virtuoso SQL via command line: Open a new shell in your terminal and then use the below command to access:
      
	        isql 
          
          You should see a new prompt now: SQL>. This is where you can run your queries.
          
      + Option 2: Access Virtuoso SPARQL queries GUI at: http://localhost:8890/sparql 

3. Loading data into Virtuoso DB:

   - In order to use SPARQL to query data, first you need to load data into Virtuoso DB. In this example, we want to query the rdf (turtle) file named [simulate_data_collection_wf_model.ttl](https://github.com/idaks/DataONE-Prov-Summer-2017/blob/master/examples/simulate_data_collection/RDF-facts/simulate_data_collection_wf_model.ttl). Please make sure you got the latest turtle file (now is version 4). Then, we have to move this RDF file into Virtuoso folder by the following command:

         mv ~/Downloads/simulate_data_collection_wf_model.ttl /usr/local/Cellar/virtuoso/7.2.4.2/var/lib/virtuoso/db/simulate_data_collection_wf_model.ttl 
 
   - Now start accessing Virtuoso by using the command line:
   
         virtuoso-t –f 
   
   - Open "isql" shell, using the following command to load the similate_data_collection_wf_model.ttl file in to the Virtuoso DB:
   
         DB.DBA.TTLP_MT (file_to_string_output ('/usr/local/Cellar/virtuoso/7.2.4.2/var/lib/virtuoso/db/simulate_data_collection_wf_model.ttl'), '', 'http://mytest.com')

*Notes: some queries are taking data across different turtle files. Therefore, make sure you import all of these turtle files into the Virtuoso DB using the same above instruction. For example: simulate_data_collection_recon_model.ttl file for recon facts.
	 
4. Testing SPARQL queries:
   - Connect to Virtuoso using the following command lines:
   
         cd usr/local/Cellar/virtuoso/7.2.4.2/var/lib/virtuoso/db  
	     virtuoso-t –f 
   - All the sample SPARQL queries are stored in the bash file "virtuoso_run_queries.sh". In order to run the file, open new shell in the terminal, run the following command line:
         
         sh virtuoso_run_queries.sh
   - If you want to export the results to txt file, use the following command lines:
   
         sh virtuoso_run_queries.sh > virtuoso_queries_results.txt
   
