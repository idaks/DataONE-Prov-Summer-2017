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
        
 Scenario 1: 

![](https://github.com/idaks/DataONE-Prov-Summer-2017/blob/master/examples/distance_between_nodes/Graph_1.png)

RDF format to construct the graph:

    @prefix : <http://example.org> .
    :orgA :hasSuborganization :orgB, :orgC, :orgD.
    :orgB :hasSuborganization :orgE, :orgF.
    :orgE :hasSuborganization :orgG.
    :orgG :hasSuborganization :orgH.
    
Result:
        


 Scenario 2: 

![](https://github.com/idaks/DataONE-Prov-Summer-2017/blob/master/examples/distance_between_nodes/Graph_2.png)

RDF format to construct the graph:

    @prefix : <http://example.org> .
    :orgA :hasSuborganization :orgB, :orgC, :orgD.
    :orgB :hasSuborganization :orgE, :orgF.
    :orgE :hasSuborganization :orgG.
    :orgG :hasSuborganization :orgH.
    :orgD :hasSuborganization :orgH.
    
Result:
 
