# Jena-ARQ to execute SPARQL queries

## Installing Apache Jena and command-line tool ARQ

### Download Apache Jena

ARQ is a query engine for [Jena](http://jena.apache.org/) that supports the [SPARQL RDF Query language](http://www.w3.org/TR/sparql11-query/). To download Apache Jean, please visit this [webpage](https://jena.apache.org/download/index.cgi).

### Set JENA_HOME environment variable

To use the Jena tools from the command line, we need to set the `JENA_HOME` environment variable to point to the location where you have unzipped the Jena distribution:

  1. Windows:
    * set `JENA_HOME=\path\to\apache-jena-x.y.z`
    
    * add a new environment variable `%JENA_HOME%\bat`
       
  2. Linux:
    * Open a file ".bashrc", and add two lines like 
    `export JENA_HOME=/Users/syc/jena/apache-jena-3.1.1` 
    `export PATH="/Users/syc/jena/apache-jena-3.1.1/bin:$PATH"`
    
    * Run the following commands `source ~/.bashrc` Then we can call the command "arq" from the command line.

## Testing ARQ command
   
Please put the RDF facts Turtle file and the SPARQL files in the same folder. Then we can try the YW model query example on the local computer by typing the following in command line:

 `arq --data wf_model.ttl --query mq2.rq`.
             
