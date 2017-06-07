#!/bin/bash
/usr/local/Cellar/virtuoso/7.2.4.2/bin/isql 1111 dba dba << 'EOF'

print ("Query 1:  Who are descendants of William? - Included William"); 

SPARQL prefix dc: <http://purl.org/dc/elements/1.1/>
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix c: <http://learningsparql.com/ns/parenthoods#>
prefix : <http://learningsparql.com/ns/person#>
SELECT ?s
WHERE {
 ?s c:child*/dc:name "William" . }
ORDER BY ?s;

print ("Query 2:  Who are descendants of William? - Not included William"); 

SPARQL prefix dc: <http://purl.org/dc/elements/1.1/>
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix c: <http://learningsparql.com/ns/parenthoods#>
prefix : <http://learningsparql.com/ns/person#>
SELECT ?s
WHERE {
 ?s c:child+/dc:name "William" . }
ORDER BY ?s;

print ("Query 3:  Who are children of William? - Included William"); 

SPARQL prefix dc: <http://purl.org/dc/elements/1.1/>
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix c: <http://learningsparql.com/ns/parenthoods#>
prefix : <http://learningsparql.com/ns/person#>
SELECT ?s
WHERE {
 ?s c:child?/dc:name "William" . }
ORDER BY ?s;

print ("Query 4 (one-level depth):  Who are children of William? - Not included William"); 

SPARQL prefix dc: <http://purl.org/dc/elements/1.1/>
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix c: <http://learningsparql.com/ns/parenthoods#>
prefix : <http://learningsparql.com/ns/person#>
SELECT ?s
WHERE {
 ?s c:child/dc:name "William" . }
ORDER BY ?s;

print ("Query 5 (two-level depth):  Who are grand children of William? - Not included William");

SPARQL prefix dc: <http://purl.org/dc/elements/1.1/>
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix c: <http://learningsparql.com/ns/parenthoods#>
prefix : <http://learningsparql.com/ns/person#>
SELECT ?s
WHERE {
 ?s c:child{2}/dc:name "William" . }
ORDER BY ?s;

print ("Query 7 (two & three levels depth):  Who are grand children and grand grand children of William? - Not included William");

SPARQL prefix dc: <http://purl.org/dc/elements/1.1/>
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix c: <http://learningsparql.com/ns/parenthoods#>
prefix : <http://learningsparql.com/ns/person#>
SELECT ?s
WHERE {
 ?s c:child{2,3}/dc:name "William" . }
ORDER BY ?s;

print ("Query 7: Print distance between nodes");

SPARQL prefix dc: <http://purl.org/dc/elements/1.1/>
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix c: <http://learningsparql.com/ns/parenthoods#>
prefix : <http://learningsparql.com/ns/person#>
SELECT SAMPLE(?t) ?super ?sub (count(?mid) as ?distance)
WHERE {
        { SELECT distinct ?super
          WHERE { ?x c:child ?super }
        }
       ?mid c:child* ?super.
       ?sub c:child+ ?mid.
      }
GROUP BY ?super ?sub
ORDER BY ?super ?sub;
EOF
