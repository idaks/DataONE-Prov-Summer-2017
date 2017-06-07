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

print ("Query 3:  Who are children of William? - Not included William"); 

SPARQL prefix dc: <http://purl.org/dc/elements/1.1/>
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix c: <http://learningsparql.com/ns/parenthoods#>
prefix : <http://learningsparql.com/ns/person#>
SELECT ?s
WHERE {
 ?s c:child/dc:name "William" . }
ORDER BY ?s;
EOF