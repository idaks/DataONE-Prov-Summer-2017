#!/bin/bash

echo ""
echo "Query 6: What data is output by program block simulate_data_collection.collect_data_set?"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/query6.sparql

echo ""
echo "Query 7: What program blocks provide input directly to simulate_data_collection.collect_data_set?"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/query7.sparql

echo ""
echo "Query 8: What programs have input ports that receive data simulate_data_collection[cassette_id]"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/query8.sparql

echo ""
echo "Query 9: How many ports read data simulate_data_collection[frame_number]?"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/query9.sparql

echo ""
echo "Query 10: How many data are read by more than port in workflow simulate_data_collection?"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/query10.sparql

echo ""
echo "Query 11: What program blocks are immediately downstream of calculate_strategy?"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/query11.sparql

echo ""
echo "Query 12: What program blocks are immediately upstream of transform_images?"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/query12.sparql

echo ""
echo "Query 13: (UpstreamProgramName) - What program blocks are upstream of transform_images?"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/query13.sparql

echo ""
echo "Query 14: What program blocks are anywhere downstream of calculate_strategy?"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/query14.sparql

echo ""
echo "Query 15 (DownstreamDataName): What data is immediately downstream of raw_image?"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/query15.sparql

echo ""
echo "Query 16 (UpstreamDataName): What data is immediately upstream of raw_image?"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/query16.sparql

echo ""
echo "Query 17 (DownstreamDataName): What data is downstream of accepted_sample?"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/query17.sparql

echo ""
echo "Query 18 (UpstreamDataName): What data is upstream of raw_image?"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/query18.sparql

echo ""
echo "Query 19: What URI variables are associated with writes of data simulate_data_collection[corrected_image]"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/query19.sparql

echo ""
echo "Query 20: What URI variables do data written to raw_image and corrected_image have in common?"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/query20.sparql

echo ""
echo "Extra 1:  What data is downstream 2 levels from "energies" ?"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/extra_query1.sparql

echo ""
echo "Extra 2: (CommonUpstreamProgramName) - What program blocks are upstream and common between of collect_data_set and log_rejected_sample?"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/extra_query2.sparql

echo ""
echo "Extra 3: Print all programs and their descendant programs in the workflow"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/extra_query3.sparql

echo ""
echo "Extra 4: Print all parameter ports"
echo ""
isql 1111 dba dba errors=stdout ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Virtuoso/queries/extra_query4.sparql
