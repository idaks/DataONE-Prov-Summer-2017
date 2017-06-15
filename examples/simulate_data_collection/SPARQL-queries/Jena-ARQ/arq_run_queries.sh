echo ""
echo "# mq6: What data is output by program block simulate_data_collection.collect_data_set?"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query mq6_property_path.rq    

echo ""
echo "# mq7: What program blocks provide input directly to simulate_data_collection.collect_data_set?"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query mq7_property_path.rq    

echo ""
echo "# mq8: What programs have input ports that receive data simulate_data_collection[cassette_id]"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query mq8_property_path.rq    

echo ""
echo "# mq9: How many ports read data simulate_data_collection[frame_number]?"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query mq9_property_path.rq    

echo ""
echo "# mq10: How many data are read by more than port in workflow simulate_data_collection?"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query mq10_property_path.rq    

echo
echo '# mq11: What program blocks are immediately downstream of calculate_strategy?'
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query mq11_property_path.rq                                                          \


echo
echo '# mq12: What program blocks are immediately upstream of transform_images?'
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query mq12_property_path.rq     

echo
echo '#  mq13: What program blocks are upstream of transform_images?'
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query mq13_property_path.rq     

echo
echo '# mq14: What program blocks are anywhere downstream of calculate_strategy?'
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query mq14_property_path.rq     

echo
echo '##  mq15: What data is immediately downstream of raw_image?'
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query mq15_property_path.rq     

echo
echo '#  mq16: What data is immediately upstream of raw_image?'
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query mq16_property_path.rq     

echo
echo '#  mq17: What data is downstream of accepted_sample?'
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query mq17_property_path.rq     

echo
echo '#  mq18: What data is upstream of raw_image?'
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query mq18_property_path.rq     

echo ""
echo "# mq19: What URI variables are associated with writes of data simulate_data_collection[corrected_image]"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query mq19_property_path.rq     

echo ""
echo "# mq20: What URI variables do data written to raw_image and corrected_image have in common?"
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query mq20_property_path.rq   

echo ""
echo "# Extra query 1: "
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query extra_mq1.rq       

echo ""
echo "# Extra query 2: "
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query extra_mq2.rq     

echo ""
echo "# Extra query 3: "
echo ""
arq --data simulate_data_collection_wf_model_v4.ttl                                                     \
    --query extra_mq3.rq     