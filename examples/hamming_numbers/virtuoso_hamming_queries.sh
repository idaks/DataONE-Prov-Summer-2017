#!/bin/bash

echo ""
echo "Query 1:  Recursive hamming numbers - what are the ancestors/hamming numbers of 30?"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/hamming_numbers/queries/hamming_query1.sparql

echo ""
echo "Query 2: Up stream common ancestors - what are the common hamming numbers - ancestors of "8" and "20" ? "
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/hamming_numbers/queries/hamming_query2.sparql

echo ""
echo "Query 3: Closest Common Ancestor - what is the closest common ancestor - hamming number of "4" and "10"? "
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/hamming_numbers/queries/hamming_query3.sparql
