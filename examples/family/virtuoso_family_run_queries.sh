#!/bin/bash

echo ""
echo "Query 1:  Who are descendants of William? - Included William"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/family/queries/query1.sparql

echo ""
echo Query 2:  Who are descendants of William? - Not included William"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/family/queries/query2.sparql

echo ""
echo "Query 3:  Who are children of William? - Included William"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/family/queries/query3.sparql

echo ""
echo "Query 4 (one-level depth):  Who are children of William? - Not included William"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/family/queries/query4.sparql

echo ""
echo "Query 5 (two-level depth):  Who are grand children of William? - Not included William"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/family/queries/query5.sparql

echo ""
echo "Query 6 (two & three levels depth):  Who are grand children and grand grand children of William? - Not included William"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/family/queries/query6.sparql

echo ""
echo "Query 7: Print distance between nodes"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/family/queries/query7.sparql


