# List of SPARQL Queries

The following is a list of SPARQL queries that can be implemented based on YW RDF facts in both Jena-ARQ and Virtuoso.

<table>
  <tr>
    <th></th><th>Query Description</th><th>Query Type</th>
  </tr>
  <tr>
    <th rowspan="3">Extract Queries</th><td>eq01: What source files were YW annotations extracted from?</td><td></td>
  </tr>
  <tr>
    <td>eq02: What are the names of all program blocks?</td><td></td>
  </tr>
  <tr>
    <td>eq03: What out ports are qualified with URIs?</td><td></td>
  </tr>
  <tr>
    <th rowspan="35">Model Queries</th><td>mq01: Where is the definition of block simulate_data_collection.collect_data_set?</td><td></td>
  </tr>
  <tr>
    <td>mq02: What is the name and description of the top-level workflow?</td><td></td>
  </tr>
  <tr>
    <td>mq03:  What are the names of any top-level functions?</td><td></td>
  </tr>
  <tr>
    <td>mq04: What are the names of the programs comprising the top-level workflow?</td><td></td>
  </tr>
  <tr>
    <td>mq05: What are the names and descriptions of the inputs to the top-level workflow?</td><td></td>
  </tr>
  <tr>
    <td>mq06: What are the outputs data by program block simulate_data_collection.collect_data_set?</td><td></td>
  </tr>
  <tr>
    <td>mq07: What program blocks provide input directly to simulate_data_collection.collect_data_set?</td><td></td>
  </tr>
  <tr>
    <td>mq08: What program blocks have input ports that receive data simulate_data_collection[cassette_id]?</td><td></td>
  </tr>
  <tr>
    <td>mq09: How many ports read data simulate_data_collection[frame_number]?</td><td></td>
  </tr>
  <tr>
    <td>mq10: How many data are read by more than one port in workflow "simulate_data_collection"?</td><td></td>
  </tr>
  <tr>
    <td>mq11: What program blocks are immediately downstream of block "calculate_strategy"?</td><td></td>
  </tr>
  <tr>
    <td>mq12: What program blocks are immediately upstream of block "transform_images"?</td><td></td>
  </tr>
  <tr>
    <td>mq13: What program blocks are upstream of block "transform_images"?</td><td></td>
  </tr>
  <tr>
    <td>mq14: What program blocks are downstream of block "calculate_strategy"?</td><td></td>
  </tr>
  <tr>
    <td>mq15: What data is immediately downstream of data "raw_image"?</td><td></td>
  </tr>
  <tr>
    <td>mq16: What data is immediately upstream of data "raw_image"?</td><td></td>
  </tr>
  <tr>
    <td>mq17: What data is downstream of data "accepted_sample"?</td><td></td>
  </tr>
  <tr>
    <td>mq18: What data is upstream of data "raw_image"?</td><td></td>
  </tr>
  <tr>
    <td>mq19: What URI variables are associated with data simulate_data_collection[corrected_image]?</td><td></td>
  </tr>
  <tr>
    <td>mq20: What URI variables do data written to "raw_image" and "corrected_image" have in common?</td><td></td>
  </tr>
  <tr>
    <td>mq21: What data is downstream 2 levels from data "energies"?</td><td></td>
  </tr>
  <tr>
    <td>mq22: What data is upstream 2 levels from data "corrected_image"?</td><td></td>
  </tr>
  <tr>
    <td>mq23: What program blocks are upstream 3 levels from block "transform_images"?</td><td></td>
  </tr>
  <tr>
    <td>mq24: What program blocks are downstream 3 levels from block "load_screening_results"?</td><td></td>
  </tr>
  <tr>
    <td>mq25: What program blocks are common upstream blocks of block "collect_data_set" and "log_rejected_sample"?</td><td></td>
  </tr>
  <tr>
    <td>mq26: What program block is the closet upstream block (LCA) of block "collect_data_set" and "log_rejected_sample" in common?</td><td></td>
  </tr>
  <tr>
    <td>mq27: Print all program blocks and their descendant programs with downstream levels in the workflow.</td><td></td>
  </tr>
  <tr>
    <td>mq28: Print all ports as parameters.</td><td></td>
  </tr>
  <tr>
    <td>mq29: Print all ports as inputs.</td><td></td>
  </tr>
  <tr>
    <td>mq30: Print all data only used as param ports.</td><td></td>
  </tr>
  <tr>
    <td>mq31: Print all data only used as output ports and param ports.</td><td></td>
  </tr>
  <tr>
    <td>mq32: Print all data only used as output ports and input ports.</td><td></td>
  </tr>
  <tr>
    <td>mq33: What program blocks are in between of program "load_screening_results" and "transform_images"?</td><td></td>
  </tr>
  <tr>
    <td>mq34: What program blocks are in between of data "sample_name" and "total_intensity"?</td><td></td>
  </tr>
  <tr>
    <td>mq35: What data is in between of data "sample_name" and "total_intensity"?</td><td></td>
  </tr>
  <tr>
    <th rowspan="6">Recon Queries</th><td>rq01: What URI variable values are associated with resource "run/data/DRT322/DRT322_11000eV_028.img"?</td><td></td>
  </tr>
  <tr>
    <td>rq02: What samples did the run of the script collect images from?</td><td></td>
  </tr>
  <tr>
    <td>rq03: What energies were used during collection of images from sample "DRT322"?</td><td></td>
  </tr>
  <tr>
    <td>rq04: Where is the raw image from which corrected image "run/data/DRT322/DRT322_11000eV_028.img" is derived? -- NOT DONE YET --</td><td></td>
  </tr>
  <tr>
    <td>rq05: Are there any raw images for which there are no corresponding corrected images? -- NOT DONE YET --</td><td></td>
  </tr>
  <tr>
    <td>rq06: What cassette held the sample from which "run/data/DRT240/DRT240_10000eV_010.img" was derived? -- NOT DONE YET --</td><td></td>
  </tr>
  <tr>
    <th rowspan="8">Combined Queries</th><td>cq01: How many resources belong to "raw_image" data?</td><td></td>
  </tr>
  <tr>
    <td>cq02: What are the port name and its data name that "run/raw/q55/DRT240/e10000/image_003.raw" is generated by?</td><td></td>
  </tr>
  <tr>
    <td>cq03: What are the port name and its data name that "run/data/DRT240/DRT240_10000eV_003.img" is generated by?</td><td></td>
  </tr>
  <tr>
    <td>cq04: Print all URI variables names and values that are associated with "corrected_image" data.</td><td></td>
  </tr>
  <tr>
    <td>cq05: What are the program blocks between "run/rejected_samples.txt" and "cassette_q55_spreadsheet.csv"? List the program blocks in downstream order between the two files.</td><td></td>
  </tr>
  <tr>
    <td>cq06: What are the downstream resources from "raw_image" data?</td><td></td>
  </tr>
  <tr>
    <td>cq07: What are the downstream resources from file "calibration.img"? -- NOT DONE YET -- </td><td></td>
  </tr>
  <tr>
    <td>cq08: What ports with filePathTemplate are upstreams of "run/data/DRT240/DRT240_11000eV_003.img"? -- NOT DONE YET -- </td><td></td>
  </tr>
</table>
