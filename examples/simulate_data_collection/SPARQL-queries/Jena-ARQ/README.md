# Jena-ARQ to execute SPARQL queries

## Installing Apache Jena and command-line tool ARQ

### Download Apache Jena

ARQ is a query engine for [Jena](http://jena.apache.org/) that supports the [SPARQL RDF Query language](http://www.w3.org/TR/sparql11-query/). To download Apache Jean, please visit this [webpage](https://jena.apache.org/download/index.cgi).

### Set JENA_HOME environment variable

To use the Jena tools from the command line, we need to set the `JENA_HOME` environment variable to point to the location where you have unzipped the Jena distribution:

  1. Windows:
    * add a new environment variable `JENA_HOME=...\apache-jena-x.y.z`
    
    * add a new value `%JENA_HOME%\bat` to PATH variable
       
  2. Linux:
  * Open the source file ".bashrc", and add two lines like
    
     `export JENA_HOME=/Users/syc/jena/apache-jena-3.1.1`
    
     `export PATH="/Users/syc/jena/apache-jena-3.1.1/bin:$PATH"`

## Testing ARQ command
   
Please put the RDF facts Turtle file and the SPARQL files in the same folder. Then we can try the YW model query example on the local computer by typing the following in command line:

 `arq --data simulate_data_collection_wf_model_v4.ttl --query mq10_property_path.rq`
 
You can also query on multiple Turtle files by adding another data, such as the following example:
 
 `arq --data simulate_data_collection_wf_model_v4.ttl --data simulate_data_collection_wf_recon_v1.ttl --query extra_mq6.rq`

