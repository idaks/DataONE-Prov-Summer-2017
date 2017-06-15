echo ""
echo "# mq6: What data is output by program block simulate_data_collection.collect_data_set?"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/mq6_property_path.rq    

echo ""
echo "# mq7: What program blocks provide input directly to simulate_data_collection.collect_data_set?"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/mq7_property_path.rq    

echo ""
echo "# mq8: What programs have input ports that receive data simulate_data_collection[cassette_id]"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/mq8_property_path.rq    

echo ""
echo "# mq9: How many ports read data simulate_data_collection[frame_number]?"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/mq9_property_path.rq    

echo ""
echo "# mq10: How many data are read by more than port in workflow simulate_data_collection?"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/mq10_property_path.rq    

echo
echo '# mq11: What program blocks are immediately downstream of calculate_strategy?'
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/mq11_property_path.rq                                                          \


echo
echo '# mq12: What program blocks are immediately upstream of transform_images?'
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/mq12_property_path.rq     

echo
echo '#  mq13: What program blocks are upstream of transform_images?'
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/mq13_property_path.rq     

echo
echo '# mq14: What program blocks are anywhere downstream of calculate_strategy?'
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/mq14_property_path.rq     

echo
echo '##  mq15: What data is immediately downstream of raw_image?'
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/mq15_property_path.rq     

echo
echo '#  mq16: What data is immediately upstream of raw_image?'
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/mq16_property_path.rq     

echo
echo '#  mq17: What data is downstream of accepted_sample?'
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/mq17_property_path.rq     

echo
echo '#  mq18: What data is upstream of raw_image?'
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/mq18_property_path.rq     

echo ""
echo "# mq19: What URI variables are associated with writes of data simulate_data_collection[corrected_image]"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/mq19_property_path.rq     

echo ""
echo "# mq20: What URI variables do data written to raw_image and corrected_image have in common?"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/mq20_property_path.rq   

echo ""
echo "# Extra 1:  What data is downstream 2 levels from "energies" ? "
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/extra_mq1.rq       

echo ""
echo "# Extra 2: (CommonUpstreamProgramName) - What program blocks are upstream and common between of collect_data_set and log_rejected_sample?"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/extra_mq2.rq     

echo ""
echo "# Extra 3: Print all programs and their descendant programs in the workflow"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/extra_mq3.rq     


echo ""
echo "# Extra 4: Print all parameter ports"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/extra_mq4.rq    

echo ""
echo "# Extra 5: Print all input ports"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/extra_mq5.rq    

echo ""
echo "# Extra 6: CROSS RDF TURTLE FILES - Print all resources belong to raw_image data (channel)"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --data simulate_data_collection_wf_recon.ttl                                                        \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/extra_mq6.rq

echo ""
echo "# Extra 7: CROSS RDF TURTLE FILES - Print all URI variables that associated with raw_image data via resources?"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --data simulate_data_collection_wf_recon.ttl                                                        \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/extra_mq7.rq

echo ""
echo "# Extra 8: CROSS RDF FILES - Print all URI variables value that associated with raw_image data via resources?"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --data simulate_data_collection_wf_recon.ttl                                                        \
    --query ~/DataONE-Prov-Summer-2017/examples/simulate_data_collection/SPARQL-queries/Jena-ARQ/queries/extra_mq8.rq