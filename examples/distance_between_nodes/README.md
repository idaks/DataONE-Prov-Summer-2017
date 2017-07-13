This is an experiment to understand how SPARQL query can capture information about distance between nodes in a graph.

SPARQL query used to get distance between nodes:
        
       PREFIX : <http://example.org> 
       SELECT ?super ?sub (count(?mid) as ?distance) 
        { 
          ?super :hasSuborganization* ?mid .
          ?mid :hasSuborganization+ ?sub .
        }
        GROUP BY ?super ?sub 
        ORDER BY ?super ?sub
        
*Scenario 1: As-is in this thread https://stackoverflow.com/questions/5198889/calculate-length-of-path-between-nodes*
 
*RDF format:*
 
          @prefix : <http://example.org> .
          :orgA :hasSuborganization :orgB, :orgC, :orgD.
          :orgB :hasSuborganization :orgE, :orgF.
          :orgE :hasSuborganization :orgG.
          :orgG :hasSuborganization :orgH.
    
*Graph:*

![](https://github.com/idaks/DataONE-Prov-Summer-2017/blob/master/examples/distance_between_nodes/Graph1.png)
    
##Result: Distance between A and H is: 4, and the in-between nodes are: A, B, E, G.

![](https://github.com/idaks/DataONE-Prov-Summer-2017/blob/master/examples/distance_between_nodes/Graph1_Result.png)
        
#Scenario 2: Adding edge between D and H 
 
##RDF format:

           @prefix : <http://example.org> .
           :orgA :hasSuborganization :orgB, :orgC, :orgD.
           :orgB :hasSuborganization :orgE, :orgF.
           :orgE :hasSuborganization :orgG.
           :orgG :hasSuborganization :orgH.
           :orgD :hasSuborganization :orgH.

##Graph:

![](https://github.com/idaks/DataONE-Prov-Summer-2017/blob/master/examples/distance_between_nodes/Graph2.png)

##Result: Distance between A and H is: 5, and the in-between nodes are: A, B, D, E, G.

![](https://github.com/idaks/DataONE-Prov-Summer-2017/blob/master/examples/distance_between_nodes/Graph2_Result.png)

#Scenario 3: Creating a loop by adding an additional edge from H to B
 
##RDF format: 

           @prefix : <http://example.org> .
           :orgA :hasSuborganization :orgB, :orgC, :orgD.
           :orgB :hasSuborganization :orgE, :orgF.
           :orgE :hasSuborganization :orgG.
           :orgG :hasSuborganization :orgH.
           :orgD :hasSuborganization :orgH.
           :orgH :hasSuborganization :orgB.

##Graph:

![](https://github.com/idaks/DataONE-Prov-Summer-2017/blob/master/examples/distance_between_nodes/Graph3.png)

##Result: Distance between A and H is: 6, and the in-between nodes are: A, B, D, E, G, H.

![](https://github.com/idaks/DataONE-Prov-Summer-2017/blob/master/examples/distance_between_nodes/Graph3_Result.png)
 
