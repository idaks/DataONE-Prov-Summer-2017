#!/bin/bash
/usr/local/Cellar/virtuoso/7.2.4.2/bin/isql 1111 dba dba << 'EOF'


print ("Query 1:  Where is the definition of block simulate_data_collection.collect_data_set?");

SPARQL PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX p1:   <http://dataone.org/ns/provone#>;


print ("Query 2: What is the name and description of the top-level workflow?");

SPARQL PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX p1:   <http://dataone.org/ns/provone#>

SELECT DISTINCT ?name ?description
WHERE
{
  ?workflow     rdf:type            p1:Workflow ;
                rdfs:label          ?name ;
                rdfs:comment        ?description .
  FILTER NOT EXISTS { ?parentWorkflow p1:hasSubProgram ?workflow }
};



print ("Query 3: What are the names of any top-level functions?");

SPARQL PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?name
WHERE
{
  ?function     rdf:type            yw:Function ;
                rdfs:label          ?name.
                
  FILTER NOT EXISTS { ?workflow p1:hasSubProgram ?function }
};


print ("Query 4: What are the names of the programs comprising the top-level workflow?");

SPARQL PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?name
WHERE
{
  ?program      rdf:type            p1:Program ;
                rdfs:label          ?name .
                
  ?workflow p1:hasSubProgram ?program.
  
  FILTER NOT EXISTS { ?parentWorkflow p1:hasSubProgram ?workflow }
};


print ("Query 5: What are the names and descriptions of the inputs to the top-level workflow?");

SPARQL PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?name ?description
WHERE
{
  ?port          rdf:type            p1:Port ;
                 rdfs:label          ?name ;
                 rdfs:comment        ?description . 
      
  ?workflow      rdf:type            p1:Workflow ;
                 p1:hasInPort        ?port .
                
  FILTER NOT EXISTS { ?parentWorkflow p1:hasSubProgram ?workflow }
};

print ("Query 6: What data is output by program block simulate_data_collection.collect_data_set?");

SPARQL PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?port_name ?port_description
WHERE
{  
  ?port          rdf:type            p1:Port ;
                 rdfs:label          ?port_name ;
                 rdfs:comment        ?port_description .

  ?program      rdf:type            p1:Program ;
                rdfs:label          ?program_name;
                p1:hasOutPort       ?port .
                

  FILTER regex(?program_name, "collect_data_set")
};

print ("Query 7: What program blocks provide input directly to simulate_data_collection.collect_data_set?");

SPARQL PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?parent_program_name
WHERE {?parent_program rdf:type p1:Program;
                       rdfs:label     ?parent_program_name;
                       p1:hasOutPort  ?port.

      ?port      rdf:type         p1:Port;
                 rdfs:label       ?port_name.
       
 {
  SELECT DISTINCT ?port_name
  WHERE
  {  
     ?port      rdf:type         p1:Port;
                rdfs:label       ?port_name.

     ?program    rdf:type        p1:Program;
                        rdfs:label     ?program_name;
                        p1:hasOutPort  ?port.
    
     FILTER (?program_name = "collect_data_set")
   }
 }
};

print ("Query 8: What programs have input ports that receive data simulate_data_collection[cassette_id]");

SPARQL PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?program_name
WHERE
{  

  ?program   rdf:type        p1:Program;
             rdfs:label      ?program_name;
             p1:hasInPort    ?port.

  ?port      rdf:type         p1:Port;
             rdfs:label       ?port_name

  FILTER (?port_name = "cassette_id")
   
};

print ("Query 9: How many ports read data simulate_data_collection[frame_number]?");

SPARQL PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT count(DISTINCT ?port) as ?count
WHERE
{  
  ?port      rdf:type         p1:Port;
             rdfs:label       ?port_name

  FILTER (?port_name = "frame_number")
   
};



print ("Query 11: What program blocks are immediately downstream of calculate_strategy?");

SPARQL PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?program_name
WHERE {?program rdf:type p1:Program;
               rdfs:label     ?program_name;
               p1:hasInPort  ?port.

      ?port      rdf:type         p1:Port;
                 rdfs:label       ?port_name.
       
 {
  SELECT DISTINCT ?port_name
  WHERE
  {  
     ?port      rdf:type         p1:Port;
                rdfs:label       ?port_name.

     ?parent_program    rdf:type        p1:Program;
                        rdfs:label     ?parent_program_name;
                        p1:hasOutPort  ?port.
    
     FILTER (?parent_program_name = "calculate_strategy")
   }
 }
};

print ("Query 12: What program blocks are immediately upstream of transform_images?");

SPARQL PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?parent_program_name
WHERE {?parent_program rdf:type p1:Program;
                       rdfs:label     ?parent_program_name;
                       p1:hasOutPort  ?port.

      ?port      rdf:type         p1:Port;
                 rdfs:label       ?port_name.
       
 {
  SELECT DISTINCT ?port_name
  WHERE
  {  
     ?port      rdf:type         p1:Port;
                rdfs:label       ?port_name.

     ?program    rdf:type        p1:Program;
                        rdfs:label     ?program_name;
                        p1:hasInPort  ?port.
    
     FILTER (?program_name = "transform_images")
   }
 }
};

print ("Query 13: (UpstreamProgramName) - What program blocks are upstream of transform_images?");

SPARQL PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?higher_up_program_name 
WHERE 
{   {
     ?in_port      rdf:type          p1:Port;
                   rdfs:label        ?port_name.

     ?out_port      rdf:type         p1:Port;
                   rdfs:label        ?port_name.

     ?up_program    rdf:type         p1:Program;
                    rdfs:label       ?up_program_name;
                    p1:hasOutPort     ?out_port.

     ?down_program  rdf:type         p1:Program;
                    rdfs:label       ?down_program_name;
                    p1:hasInPort    ?in_port.
  
     FILTER (?down_program_name = "transform_images")

   }

  UNION

  {
     ?in_port      rdf:type          p1:Port;
                   rdfs:label        ?port_name.

     ?out_port      rdf:type         p1:Port;
                   rdfs:label        ?port_name.

     ?higher_up_program    rdf:type         p1:Program;
                           rdfs:label       ?higher_up_program_name;
                           p1:hasOutPort     ?out_port.

     ?lower_down_program  rdf:type         p1:Program;
                         rdfs:label       ?down_program_name;
                         p1:hasInPort    ?in_port. 

   }
  
   FILTER (?higher_up_program_name != "transform_images")
   
 
};
EOF
