#!/bin/bash
/usr/local/Cellar/virtuoso/7.2.4.2/bin/isql 1111 dba dba errors=stdout << 'EOF'

echo "Query 6: What data is output by program block simulate_data_collection.collect_data_set?";

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?channel_name ?channel_description
WHERE
{  
  ?port          rdf:type            p1:Port ;
                 rdfs:label          ?port_name;
                 p1:connectsTo       ?channel.

  ?program       rdf:type            p1:Program ;
                 rdfs:label          ?program_name;
                 p1:hasOutPort       ?port .

  ?channel       rdf:type         p1:Channel;
                 rdfs:label      ?channel_name;
                 rdfs:comment    ?channel_description.
                 
                
  FILTER regex(?program_name, "collect_data_set")
} ORDER BY ?channel_name;

echo "Query 7: What program blocks provide input directly to simulate_data_collection.collect_data_set?";

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?up_program_name
WHERE 
 {    ?program       rdf:type             p1:Program ;
                     rdfs:label           "collect_data_set" .                                        
    
      ?program      (p1:hasInPort/p1:connectsTo/^p1:connectsTo/^p1:hasOutPort)   ?up_program .
      
      ?up_program    rdf:type             p1:Program ;
                     rdfs:label           ?up_program_name .
       
 } ORDER BY ?up_program_name;


echo "Query 8: What programs have input ports that receive data simulate_data_collection[cassette_id]";

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?program_name
WHERE
{  

  ?program   rdf:type        p1:Program;
             rdfs:label      ?program_name;
             p1:hasInPort    ?port.

  ?port      rdf:type         p1:Port;
             rdfs:label       ?port_name;
             p1:connectsTo    ?channel.

  ?channel   rdf:type         p1:Channel;
             rdfs:label      ?channel_name;
             rdfs:comment    ?channel_description.


  FILTER (?channel_name = "cassette_id")
   
} ORDER BY ?program_name;

echo "Query 9: How many ports read data simulate_data_collection[frame_number]?";

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT count(DISTINCT ?port) as ?count
WHERE
{  
  ?program   rdf:type        p1:Program;
             rdfs:label      ?program_name;
             p1:hasInPort    ?port.

  ?port      rdf:type         p1:Port;
             rdfs:label       ?port_name;
             p1:connectsTo    ?channel.

  ?channel   rdf:type        p1:Channel;
             rdfs:label      ?channel_name;
             rdfs:comment    ?channel_description.

  FILTER (?channel_name = "frame_number")
   
};

echo "Query 10: How many data are read by more than port in workflow simulate_data_collection?";

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT ?channel_name (count(?port) as ?port_count)
WHERE
{  
  ?port      rdf:type         p1:Port;
             rdfs:label       ?port_name;
             p1:connectsTo    ?channel.

  ?channel   rdf:type        p1:Channel;
             rdfs:label      ?channel_name;
             rdfs:comment    ?channel_description.   
}
GROUP BY ?channel_name
HAVING (count(?port) > 1);


echo "Query 11: What program blocks are immediately downstream of calculate_strategy?";

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?down_program_name   #Get the direct downstream program name
WHERE 
 {    #get the program with name "calculate_strategy" and put into ?program variable
      ?program       rdf:type             p1:Program ;           
                     rdfs:label           "calculate_strategy" .    
                     
      #get all of the programs immediately connect to ?program (via ?hasOutPort, hasInPort, hasDefaultParam relationsips) 
      #put these programs into ?down_program variable
      ?program      (p1:hasOutPort/p1:connectsTo/^p1:connectsTo/^p1:hasInPort)   ?down_program .
      
      #get names of the down programs
      ?down_program    rdf:type             p1:Program ;
                       rdfs:label           ?down_program_name .
       
 } ORDER BY ?down_program_name;

echo "Query 12: What program blocks are immediately upstream of transform_images?";

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?up_program_name
WHERE 
 {    ?program       rdf:type             p1:Program ;
                     rdfs:label           "transform_images" .                                        
    
      ?program      (p1:hasInPort/p1:connectsTo/^p1:connectsTo/^p1:hasOutPort)   ?up_program .
      
      ?up_program    rdf:type             p1:Program ;
                     rdfs:label           ?up_program_name .
       
 } ORDER BY ?up_program_name ;

echo "Query 13: (UpstreamProgramName) - What program blocks are upstream of transform_images?";

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?up_program_name
WHERE 
 {    #get the program with name "transform_images" and put into ?program variable
      ?program       rdf:type             p1:Program ;
                     rdfs:label           "transform_images" .   
                     
      #get all of the programs immediately connect to ?program (via ?hasOutPort, hasInPort, hasDefaultParam relationsips) 
      #put these programs into ?down_program variable 
      #the "+" sign is to run recursive queries.
      ?program      (p1:hasInPort/p1:connectsTo/^p1:connectsTo/^p1:hasOutPort)+   ?up_program .
      
      ?up_program    rdf:type             p1:Program ;
                     rdfs:label           ?up_program_name .
       
 } ORDER BY ?up_program_name;


echo "Query 14: What program blocks are anywhere downstream of calculate_strategy?";

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?down_program_name
WHERE 
 {    ?program       rdf:type             p1:Program ;
                     rdfs:label           "calculate_strategy" .                                        
    
      ?program       (p1:hasOutPort/p1:connectsTo/^p1:connectsTo/^p1:hasInPort)+   ?down_program .
      
      ?down_program    rdf:type             p1:Program ;
                       rdfs:label             ?down_program_name .
       
 } ORDER BY ?down_program_name;

echo "Query 15 (DownstreamDataName): What data is immediately downstream of raw_image?";

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?down_channel_name
WHERE
{    
      ?channel        rdf:type             p1:Channel ;
                      rdfs:label           ?channel_name.  
    
      ?channel        (^p1:connectsTo/^p1:hasInPort/p1:hasOutPort/p1:connectsTo)   ?down_channel .
      
      ?down_channel    rdf:type            p1:Channel ;
                       rdfs:label           ?down_channel_name .

  FILTER (?channel_name = "raw_image")
   
} ORDER BY ?down_program_name;


echo "Query 16 (UpstreamDataName): What data is immediately upstream of raw_image?";

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?up_channel_name
WHERE
{    
      ?channel        rdf:type             p1:Channel ;
                      rdfs:label           ?channel_name.   
    
      ?channel        (^p1:connectsTo/^p1:hasOutPort/p1:hasInPort/p1:connectsTo)   ?up_channel .
      
      ?up_channel    rdf:type            p1:Channel ;
                       rdfs:label        ?up_channel_name .

  FILTER (?channel_name = "raw_image")
   
} ORDER BY ?up_channel_name;

echo "Query 17 (DownstreamDataName): What data is downstream of accepted_sample?";

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX prov: <http://www.w3c.org/ns/prov#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?down_channel_name
WHERE
{    
      ?channel       rdf:type            p1:Channel ;
                    rdfs:label           ?channel_name.  
    
      ?channel        (^p1:connectsTo/^p1:hasInPort/p1:hasOutPort/p1:connectsTo)+   ?down_channel .
      
      ?down_channel    rdf:type           p1:Channel;
                       rdfs:label           ?down_channel_name .

  FILTER (?channel_name = "raw_image")
   
} ORDER BY ?down_channel_name;


echo "Query 18 (UpstreamDataName): What data is upstream of raw_image?";

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?up_channel_name
WHERE
{    
      ?channel        rdf:type             p1:Channel ;
                      rdfs:label           ?channel_name.   
    
      ?channel        (^p1:connectsTo/^p1:hasOutPort/p1:hasInPort/p1:connectsTo)+   ?up_channel .
      
      ?up_channel    rdf:type            p1:Channel ;
                       rdfs:label        ?up_channel_name .

  FILTER (?channel_name = "raw_image")
   
} ORDER BY ?up_channel_name;

echo "Query 19: What URI variables are associated with writes of data simulate_data_collection[corrected_image]";

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?associated_channel_name
WHERE
{    
      ?channel       rdf:type             p1:Channel ;
                     rdfs:label           ?channel_name;
                     yw:isAssociatedWith  ?associated_channel.  
      
      ?associated_channel    rdf:type            p1:Channel;
                             rdfs:label           ?associated_channel_name .

  FILTER (?channel_name = "corrected_image")
   
} ORDER BY ?associated_channel_name ;

echo "Query 20: What URI variables do data written to raw_image and corrected_image have in common?";

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?raw_image_associated_channel_name
WHERE
{    
      ?corrected_image_channel        rdf:type             p1:Channel ;
                                      rdfs:label           "corrected_image";
                                      yw:isAssociatedWith  ?correct_image_associated_channel.  
      
      ?correct_image_associated_channel    rdf:type             p1:Channel ;
                                          rdfs:label           ?correct_image_associated_channel_name .

      ?raw_image_channel             rdf:type        p1:Channel ;
                                     rdfs:label     "raw_image";
                                     yw:isAssociatedWith  ?raw_image_associated_channel.  
      
      ?raw_image_associated_channel    rdf:type             p1:Channel ;
                                      rdfs:label            ?raw_image_associated_channel_name .

  FILTER (?raw_image_associated_channel_name = ?correct_image_associated_channel_name)
   
} ORDER BY ?raw_image_associated_channel_name;

echo "Extra 1:  What data is downstream 2 levels from "energies" ?";

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?down_channel_name
WHERE
{    
      ?channel        rdf:type           p1:Channel ;
                      rdfs:label         ?channel_name.  
    
      ?channel        (^p1:connectsTo/^p1:hasInPort/p1:hasOutPort/p1:connectsTo){2}   ?down_channel .
      
      ?down_channel    rdf:type             p1:Channel ;
                       rdfs:label           ?down_channel_name .

  FILTER (?channel_name = "energies")
   
} ORDER BY ?down_channel_name ;

echo "Extra 2: (CommonUpstreamProgramName) - What program blocks are upstream and common between of collect_data_set and log_rejected_sample?";

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?up_second_program_name
WHERE 
 {    ?first_program       rdf:type             p1:Program ;
                           rdfs:label           ?first_program_name .                                        
    
      ?first_program      (p1:hasInPort/p1:connectsTo/^p1:connectsTo/^p1:hasOutPort)+   ?up_first_program .
      
      ?up_first_program    rdf:type             p1:Program ;
                           rdfs:label           ?up_first_program_name .

      ?second_program       rdf:type             p1:Program ;
                           rdfs:label            ?second_program_name .                                        
    
      ?second_program      (p1:hasInPort/p1:connectsTo/^p1:connectsTo/^p1:hasOutPort)+   ?up_second_program .
      
      ?up_second_program    rdf:type             p1:Program ;
                           rdfs:label           ?up_second_program_name .
      
      FILTER (?first_program_name = "collect_data_set").
      FILTER (?second_program_name = "log_rejected_sample").
      FILTER (?up_second_program_name = ?up_first_program_name )
       
 } ORDER BY ?up_second_program_name;

EOF