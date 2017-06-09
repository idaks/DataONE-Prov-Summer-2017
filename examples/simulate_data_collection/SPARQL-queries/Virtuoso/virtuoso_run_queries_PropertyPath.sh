#!/bin/bash
/usr/local/Cellar/virtuoso/7.2.4.2/bin/isql 1111 dba dba << 'EOF'

print ("Query 6: What data is output by program block simulate_data_collection.collect_data_set?");

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX prov: <http://www.w3c.org/ns/prov#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?port_entity_name ?port_entity_description
WHERE
{  
  ?port          rdf:type            p1:Port ;
                 rdfs:label          ?port_name;
                 p1:hasDefaultParam  ?port_entity.

  ?program      rdf:type            p1:Program ;
                rdfs:label          ?program_name;
                p1:hasOutPort       ?port .

  ?port_entity   rdf:type        prov:Entity;
                 rdfs:label      ?port_entity_name;
                 rdfs:comment    ?port_entity_description.
                 
                

  FILTER regex(?program_name, "collect_data_set")
};

print ("Query 7: What program blocks provide input directly to simulate_data_collection.collect_data_set?");

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX prov: <http://www.w3c.org/ns/prov#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?up_program_name
WHERE 
 {    ?program       rdf:type             p1:Program ;
                     rdfs:label           "collect_data_set" .                                        
    
      ?program      (p1:hasInPort/p1:hasDefaultParam/^p1:hasDefaultParam/^p1:hasOutPort)   ?up_program .
      
      ?up_program    rdf:type             p1:Program ;
                     rdfs:label           ?up_program_name .
       
 };


print ("Query 8: What programs have input ports that receive data simulate_data_collection[cassette_id]");

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX prov: <http://www.w3c.org/ns/prov#>
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
             p1:hasDefaultParam  ?port_entity.

  ?port_entity   rdf:type        prov:Entity;
                 rdfs:label      ?port_entity_name;
                 rdfs:comment    ?port_entity_description.


  FILTER (?port_entity_name = "cassette_id")
   
};

print ("Query 9: How many ports read data simulate_data_collection[frame_number]?");

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX prov: <http://www.w3c.org/ns/prov#>
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
             p1:hasDefaultParam  ?port_entity.

  ?port_entity   rdf:type        prov:Entity;
                 rdfs:label      ?port_entity_name;
                 rdfs:comment    ?port_entity_description.

  FILTER (?port_entity_name = "frame_number")
   
};

print("Quey 10: How many data are read by more than port in workflow simulate_data_collection?");

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX prov: <http://www.w3c.org/ns/prov#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT ?port_entity_name (count(?port) as ?port_count)
WHERE
{  
  ?port      rdf:type         p1:Port;
             rdfs:label       ?port_name;
             p1:hasDefaultParam  ?port_entity.

  ?port_entity   rdf:type        prov:Entity;
                 rdfs:label      ?port_entity_name;
                 rdfs:comment    ?port_entity_description.   
}
GROUP BY ?port_entity_name
HAVING (count(?port) > 1);


print ("Query 11: What program blocks are immediately downstream of calculate_strategy?");

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX prov: <http://www.w3c.org/ns/prov#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?down_program_name
WHERE 
 {    ?program       rdf:type             p1:Program ;
                     rdfs:label           "calculate_strategy" .                                        
    
      ?program      (p1:hasOutPort/p1:hasDefaultParam/^p1:hasDefaultParam/^p1:hasInPort)   ?down_program .
      
      ?down_program    rdf:type             p1:Program ;
                       rdfs:label           ?down_program_name .
       
 }

print ("Query 12: What program blocks are immediately upstream of transform_images?");

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX prov: <http://www.w3c.org/ns/prov#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?up_program_name
WHERE 
 {    ?program       rdf:type             p1:Program ;
                     rdfs:label           "transform_images" .                                        
    
      ?program      (p1:hasInPort/p1:hasDefaultParam/^p1:hasDefaultParam/^p1:hasOutPort)   ?up_program .
      
      ?up_program    rdf:type             p1:Program ;
                     rdfs:label           ?up_program_name .
       
 };

print ("Query 13: (UpstreamProgramName) - What program blocks are upstream of transform_images?");

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX prov: <http://www.w3c.org/ns/prov#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?up_program_name
WHERE 
 {    ?program       rdf:type             p1:Program ;
                     rdfs:label           "transform_images" .                                        
    
      ?program      (p1:hasInPort/p1:hasDefaultParam/^p1:hasDefaultParam/^p1:hasOutPort)+   ?up_program .
      
      ?up_program    rdf:type             p1:Program ;
                     rdfs:label           ?up_program_name .
       
 };


print ("Query 14: What program blocks are anywhere downstream of calculate_strategy?");

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX prov: <http://www.w3c.org/ns/prov#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?down_program_name
WHERE 
 {    ?program       rdf:type             p1:Program ;
                     rdfs:label           "calculate_strategy" .                                        
    
      ?program      (p1:hasOutPort/p1:hasDefaultParam/^p1:hasDefaultParam/^p1:hasInPort)+   ?down_program .
      
      ?down_program    rdf:type             p1:Program ;
                     rdfs:label             ?down_program_name .
       
 };

print ("Query 15 (DownstreamDataName): What data is immediately downstream of raw_image?");

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX prov: <http://www.w3c.org/ns/prov#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?down_data_name
WHERE
{    
      ?entity        rdf:type             prov:Entity ;
                     rdfs:label           ?entity_name.  
    
      ?entity        (^p1:hasDefaultParam/^p1:hasInPort/p1:hasOutPort/p1:hasDefaultParam)   ?downentity .
      
      ?downentity    rdf:type             prov:Entity ;
                     rdfs:label           ?down_data_name .

  FILTER (?entity_name = "raw_image")
   
};


print ("Query 16 (UpstreamDataName): What data is immediately upstream of raw_image?");

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX prov: <http://www.w3c.org/ns/prov#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?up_data_name
WHERE
{    
      ?entity        rdf:type             prov:Entity ;
                     rdfs:label           ?entity_name.  
    
      ?entity        (^p1:hasDefaultParam/^p1:hasOutPort/p1:hasInPort/p1:hasDefaultParam)   ?upentity .
      
      ?upentity    rdf:type             prov:Entity ;
                     rdfs:label          ?up_data_name .

  FILTER (?entity_name = "raw_image")
   
};

print ("Query 17 (DownstreamDataName): What data is downstream of accepted_sample?");

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX prov: <http://www.w3c.org/ns/prov#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?down_data_name
WHERE
{    
      ?entity        rdf:type             prov:Entity ;
                    rdfs:label           ?entity_name.  
    
      ?entity        (^p1:hasDefaultParam/^p1:hasInPort/p1:hasOutPort/p1:hasDefaultParam)+   ?downentity .
      
      ?downentity    rdf:type             prov:Entity ;
                     rdfs:label           ?down_data_name .

  FILTER (?entity_name = "raw_image")
   
};


print ("Query 18 (UpstreamDataName): What data is upstream of raw_image?");

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX prov: <http://www.w3c.org/ns/prov#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?up_data_name
WHERE
{    
      ?entity        rdf:type             prov:Entity ;
                     rdfs:label           ?entity_name.  
    
      ?entity        (^p1:hasDefaultParam/^p1:hasOutPort/p1:hasInPort/p1:hasDefaultParam)+   ?upentity .
      
      ?upentity    rdf:type             prov:Entity ;
                     rdfs:label          ?up_data_name .

  FILTER (?entity_name = "raw_image")
   
};

print ("Query 19: What URI variables are associated with writes of data simulate_data_collection[corrected_image]");

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX prov: <http://www.w3c.org/ns/prov#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?associated_entity_name
WHERE
{    
      ?entity        rdf:type             prov:Entity ;
                     rdfs:label           ?entity_name;
                     prov:wasDerivedFrom  ?associated_entity.  
      
      ?associated_entity    rdf:type             prov:Entity ;
                            rdfs:label           ?associated_entity_name .

  FILTER (?entity_name = "corrected_image")
   
};

print ("Query 20: What URI variables do data written to raw_image and corrected_image have in common?");

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX prov: <http://www.w3c.org/ns/prov#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?raw_image_associated_entity_name
WHERE
{    
      ?corrected_image_entity        rdf:type             prov:Entity ;
                                     rdfs:label           "corrected_image";
                                     prov:wasDerivedFrom  ?correct_image_associated_entity.  
      
      ?correct_image_associated_entity    rdf:type             prov:Entity ;
                                          rdfs:label           ?correct_image_associated_entity_name .

      ?raw_image_entity        rdf:type             prov:Entity ;
                                     rdfs:label     "raw_image";
                                     prov:wasDerivedFrom  ?raw_image_associated_entity.  
      
      ?raw_image_associated_entity    rdf:type             prov:Entity ;
                                      rdfs:label           ?raw_image_associated_entity_name .

  FILTER (?raw_image_associated_entity_name = ?correct_image_associated_entity_name)
   
};

print ("Bonus 1:  What data is downstream 2 levels from "energies" ?");

SPARQL BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl:  <http://www.w3.org/2002/07/owl#>
PREFIX prov: <http://www.w3c.org/ns/prov#>
PREFIX p1:   <http://dataone.org/ns/provone#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

SELECT DISTINCT ?down_data_name
WHERE
{    
      ?entity        rdf:type             prov:Entity ;
                    rdfs:label           ?entity_name.  
    
      ?entity        (^p1:hasDefaultParam/^p1:hasInPort/p1:hasOutPort/p1:hasDefaultParam){2}   ?downentity .
      
      ?downentity    rdf:type             prov:Entity ;
                     rdfs:label           ?down_data_name .

  FILTER (?entity_name = "energies")
   
};


EOF
