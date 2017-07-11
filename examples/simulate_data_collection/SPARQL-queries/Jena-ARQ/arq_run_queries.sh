#!/bin/bash
echo ""
echo "Extract Query 1: What source files were YW annotations extracted from?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/extracted_query1.rq    

echo ""
echo "Extract Query 2: What are the names of all program blocks?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/extracted_query2.rq

echo ""
echo "Extract Query 3: What out ports are qualified with URIs?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/extracted_query3.rq

echo ""
echo "Extract Query 4: What ports are qualified with URIs?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/extracted_query4.rq

echo ""
echo "Query 1: Where is the definition of block simulate_data_collection.collect_data_set?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query1.rq

echo ""
echo "Query 2: What is the name and description of the top-level workflow?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query2.rq

echo ""
echo "Query 3: What are the names of any top-level functions?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query3.rq

echo ""
echo "Query 4: What are the names of the programs comprising the top-level workflow?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query4.rq

echo ""
echo "Query 5: What are the names and descriptions of the inputs to the top-level workflow?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query5.rq

echo ""
echo "Query 6: What data is output by program block simulate_data_collection.collect_data_set?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query6.rq

echo ""
echo "Query 7: What program blocks provide input directly to simulate_data_collection.collect_data_set?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query7.rq

echo ""
echo "Query 8: What programs have input ports that receive data simulate_data_collection[cassette_id]"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query8.rq

echo ""
echo "Query 9: How many ports read data simulate_data_collection[frame_number]?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query9.rq

echo ""
echo "Query 10: How many data are read by more than port in workflow simulate_data_collection?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query10.rq

echo ""
echo "Query 11: What program blocks are immediately downstream of calculate_strategy?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query11.rq

echo ""
echo "Query 12: What program blocks are immediately upstream of transform_images?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query12.rq
echo ""
echo "Query 13: (UpstreamProgramName) - What program blocks are upstream of transform_images?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query13.rq

echo ""
echo "Query 14: What program blocks are anywhere downstream of calculate_strategy?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query14.rq

echo ""
echo "Query 15 (DownstreamDataName): What data is immediately downstream of raw_image?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query15.rq

echo ""
echo "Query 16 (UpstreamDataName): What data is immediately upstream of raw_image?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query16.rq

echo ""
echo "Query 17 (DownstreamDataName): What data is downstream of accepted_sample?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query17.rq

echo ""
echo "Query 18 (UpstreamDataName): What data is upstream of raw_image?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query18.rq

echo ""
echo "Query 19: What URI variables are associated with writes of data simulate_data_collection[corrected_image]"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query19.rq

echo ""
echo "Query 20: What URI variables do data written to raw_image and corrected_image have in common?"
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query20.rq

echo ""
echo "Query 21: What data is downstream 2 levels from data energies?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query21.rq

echo ""
echo "Query 22: What data is upstream 2 levels from data corrected_image?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query22.rq

echo ""
echo "Query 23: What program blocks are upstream 3 levels from block transform_images?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query23.rq

echo ""
echo "Query 24: What program blocks are downstream 3 levels from block load_screening_results?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query24.rq

echo ""
echo "Query 25: What program blocks are common upstream blocks of block collect_data_set and log_rejected_sample?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query25.rq

echo ""
echo "Query 26: What program block is the closet upstream block (LCA) of block collect_data_set and log_rejected_sample in common?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query26.rq

echo ""
echo "Query 27: Print all program blocks and their descendant programs with downstream levels in the workflow."
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query27.rq

echo ""
echo "Query 28: Print the names of all ports used as parameters."
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query28.rq

echo ""
echo "Query 29: Print the names of all input ports (including both input data and input parameters)."
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query29.rq

echo ""
echo "Query 30: Print all data only connected by param ports."
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query30.rq

echo ""
echo "Query 31: Print all data only connected by output ports and param ports."
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query31.rq

echo ""
echo "Query 32: Print all data only connected by output ports and input data ports without param ports."
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query32.rq

echo ""
echo "Query 33: What program blocks are in between of program load_screening_results and transform_images?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query33.rq

echo ""
echo "Query 34: What program blocks are in between of data sample_name and total_intensity?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query34.rq

echo ""
echo "Query 35:What data is in between of data sample_name and total_intensity?"
echo ""
arq --data simulate_data_collection_wf_model_v8.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/query35.rq
