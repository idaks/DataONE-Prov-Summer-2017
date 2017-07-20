# YesWorkflow Data Model Vocabulary

## 1. YesWorkflow Conceptual Model Overview

The YesWorkflow conceptual model is illustrated by the UML diagram of Figure 1.

**Figure 1: YesWorkflow Conceptual Model UML Diagram**

![](https://github.com/idaks/DataONE-Prov-Summer-2017/blob/master/examples/simulate_data_collection/YW%20Model%20OWL/YesWorkflowUML.jpg)

### 1.1 Prefix and Namespace

The following namespaces and prefixes are used in YesWorkflow RDF Turtle facts and SPARQL queries. 

**Table 1: Prefix and Namespaces used in this specification**

| Prefix | Namespace IRI | Definition |
| ------ | ------------- | ---------- |
| yw     | http://yesworkflow.org/ns/yesworkflow | The YesWorkflow namespace |
| p1     | http://purl.dataone.org/provone/2015/01/15/ontology# | The ProvONE namespace |
| rdf    | http://www.w3.org/1999/02/22-rdf-syntax-ns# | The RDF namespace |
| rdfs   | http://www.w3.org/2000/01/rdf-schema# | The RDFS namespace |
| owl    | http://www.w3.org/2002/07/owl# | The OWL Full namespace |

### 1.2 YesWorkflow Model Constructs

The YesWorkflow constructs are summarized in Table 2 below.

**Table 2: YesWorkflow Constructs**
<table>
  <tr>
    <th>YW Provenance</th><th>Construct Type</th><th>Name</th><th>Specification</th>
  </tr>
  <tr>
    <td rowspan="13">Prospective</td><td rowspan="7">Class</td><td>Block</td><td><a href="#2.1">Section 2.1</a></td>
  </tr>
  <tr>
    <td>Workflow</td><td><a href="#2.2">Section 2.2</a></td>
  </tr>
  <tr>
    <td>Port</td><td><a href="#2.3">Section 2.3</a></td>
  </tr>
  <tr>
    <td>InPort</td><td><a href="#2.4">Section 2.4</a></td>
  </tr>
  <tr>
    <td>ParamPort</td><td><a href="#2.5">Section 2.5</a></td>
  </tr>
  <tr>
    <td>OutPort</td><td><a href="#2.6">Section 2.6</a></td>
  </tr>
  <tr>
    <td>Data</td><td><a href="#2.7">Section 2.7</a></td>
  </tr>
  <tr>
    <td rowspan="6">Association</td><td>hasSubBlock</td><td><a href="#2.8">Section 2.8</a></td>
  </tr>
  <tr>
    <td>hasInPort</td><td><a href="#2.9">Section 2.9</a></td>
  </tr>
  <tr>
    <td>hasOutPort</td><td><a href="#2.10">Section 2.10</a></td>
  </tr>
  <tr>
    <td>receives</td><td><a href="#2.11">Section 2.11</a></td>
  </tr>
  <tr>
    <td>sends</td><td><a href="#2.12">Section 2.12</a></td>
  </tr>
  <tr>
    <td>hasVariableSource</td><td><a href="#2.13">Section 2.13</a></td>
  </tr>
  <tr>
    <td rowspan="5">Retrospective</td><td rowspan="2">Class</td><td>Resource</td><td><a href="#2.14">Section 2.14</a></td>
  </tr>
  <tr>
    <td>URIVariable</td><td><a href="#2.15">Section 2.15</a></td>
  </tr>
  <tr>
    <td rowspan="3">Association</td><td>wasReadFrom</td><td><a href="#2.16">Section 2.16</a></td>
  </tr>
  <tr>
    <td>wasWrittenTo</td><td><a href="#2.17">Section 2.17</a></td>
  </tr>
  <tr>
    <td>hasURIVariable</td><td><a href="#2.18">Section 2.18</a></td>
  </tr>
</table>

## 2. YesWorkflow Model Specification

This section presents the specification of the various components of the YesWorkflow model outlined in the previous section.

<h3 id="2.1">2.1 Block class</h3>

A Block represents a computational task that consumes and produces data through its input and output ports, respectively. It can be atomic or composite, the latter case represented by a possibly nested Block.

**is in domain of**
* yw:hasSubBlock, yw:hasInPort, yw:hasOutPort

**is in range of**
* yw:hasSubBlock

**Example:**

The following RDF Turtle fragment specifies a Block.

```
BASE         <http://yesworkflow.org/0000000000/>
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX p1:   <http://purl.dataone.org/provone/2015/01/15/ontology#>
PREFIX yw:   <http://yesworkflow.org/ns/yesworkflow>

yw:Block        rdf:type           rdfs:Class .

<simulate_data_collection/load_screening_results>
    rdf:type            yw:Block ;
    rdfs:label          "load_screening_results" ;        # The name of the program block
    rdfs:comment        "Load sample information from spreadsheet." ;       # The description of the program block
    yw:hasInPort        <simulate_data_collection/load_screening_results#cassette_id_port> ,
                        <simulate_data_collection/load_screening_results#sample_spreadsheet_port>  ;
    yw:hasOutPort       <simulate_data_collection/load_screening_results#sample_name_port> ,
                        <simulate_data_collection/load_screening_results#sample_quality_port> .
    yw:hasSubBlock      <...> .         # (Optional) The sub-blocks of current block
```

<h3 id="2.2">2.2 Workflow class</h3>

A Workflow is a distinguished Block, representing an enire computational experiment for a source script. It has super-class Block.

**has super-class**
* yw:Block

**has self-attribute**
* yw:sourceScript

**is in domain of**
* yw:hasSubBlock, yw:hasInPort, yw:hasOutPort

**Example:**

The following RDF Turtle fragment specifies a Workflow.

```
yw:Workflow     rdf:type           rdfs:Class ;
	        rdfs:subClassOf    yw:Block .

<simulate_data_collection>
    rdf:type            yw:Workflow ;
    rdfs:label          "simulate_data_collection" ;        # The name of the workflow
    rdfs:comment        "Workflow for collecting diffraction data from high quality crystals in a cassette." ;   # The description of the workflow
    yw:sourceScript     "simulate_data_collection.py" ;       # The source script that the workflow is annotated for.
    yw:hasInPort        <simulate_data_collection#cassette_id_port> ,
                        <...> , <...> ;
    yw:hasOutPort       <simulate_data_collection#corrected_image_port> ,
                        <...> , <...> ;
    yw:hasSubBlock      <simulate_data_collection/initialize_run> ,
                        <...> , <...> .
```

<h3 id="2.3">2.3 Port class</h3>

A Port enables a Block to send or receive data items (as class Data). There are two main types of ports used as inputs and outputs. For input ports, they include both ports as input data and ports as input parameters. Therefore, Port is the super-class of class InPort and OutPort, and InPort is the super-class of ParamPort.

**has self-attribute**
* yw:filePathTemplate

**is in domain of**
* yw:receives, yw:sends, yw:hasVariableSource

**is in range of**
* yw:hasInPort, yw:hasOutPort

**Example:**

The following RDF Turtle fragment specifies a Port.

```
yw:Port         rdf:type           rdfs:Class .
yw:InPort       rdf:type           rdfs:Class ;
	        rdfs:subClassOf    yw:Port .
yw:OutPort      rdf:type           rdfs:Class ;
	        rdfs:subClassOf    yw:Port .
yw:ParamPort    rdf:type           rdfs:Class ;
	        rdfs:subClassOf    yw:InPort .

<simulate_data_collection/load_screening_results#sample_spreadsheet_port>
    rdf:type                    yw:InPort ;                       # InPort is a sub-class of Port
    rdfs:label                  "sample_spreadsheet_file" ;        # The port name (not the alias)
    yw:receives                 <simulate_data_collection#sample_spreadsheet_data> ;   # The Data that the in-port receives
    yw:filePathTemplate         "file:cassette_{cassette_id}_spreadsheet.csv" ;    # (Optional) The URI file path template of the port
    yw:hasVariableSource        <simulate_data_collection#cassette_id_data> .    # (Optional) The referred Data in the URI file path template

<simulate_data_collection/log_rejected_sample#rejection_log_port>
    rdf:type                    yw:OutPort ;    	          # OutPort is a sub-class of Port
    rdfs:label                  "rejection_log" ;
    yw:sends                    <simulate_data_collection#rejection_log_data> ;    # The Data that the out-port sends
    yw:filePathTemplate         "file:run/rejected_samples.txt" .             # (Optional)

<simulate_data_collection/log_average_image_intensity#cassette_id_port>
    rdf:type                    yw:ParamPort ;                    # ParamPort is a sub-class of InPort
    rdfs:label                  "cassette_id" ;
    yw:receives                 <simulate_data_collection#cassette_id_data> .
```

<h3 id="2.4">2.4 InPort class</h3>

An InPort is a sub-class of Port. It means the port is used as an input data or parameter port of its Block or Workflow.

**has self-attribute**
* yw:filePathTemplate

**is in domain of**
* yw:receives, yw:hasVariableSource

**is in range of**
* yw:hasInPort

**Example:**

The same as Port.

<h3 id="2.5">2.5 ParamPort class</h3>

A ParamPort is a sub-class of InPort. It means the port is used as an input parameter port of its Block or Workflow.

**has self-attribute**
* yw:filePathTemplate

**is in domain of**
* yw:receives, yw:hasVariableSource

**is in range of**
* yw:hasInPort

**Example:**

The same as Port.

<h3 id="2.6">2.6 OutPort class</h3>

An OutPort is a sub-class of Port. It means the port is used as an output port of its Block or Workflow.

**has self-attribute**
* yw:filePathTemplate

**is in domain of**
* yw:sends, yw:hasVariableSource

**is in range of**
* yw:hasOutPort

**Example:**

The same as Port.

<h3 id="2.7">2.7 Data class</h3>

A Data is a data item that multiple ports from different blocks or workflows receive or send. The ports which connect to the same Data share the same actual data. In other words, ports with the same alias name connect to the same Data.

**is in domain of**
* yw:wasReadFrom, yw:wasWrittenTo

**is in range of**
* yw:receives, yw:sends, yw:hasVariableSource

**Example:**

The following RDF Turtle fragment specifies a Data.

```
yw:Data        rdf:type           rdfs:Class .

<simulate_data_collection#raw_image_data>
    rdf:type                    yw:Data ;
    rdfs:label                  "raw_image" ;       # The alias name of ports connected to the same Data
    rdfs:comment                "Path of file storing the raw diffraction image." .  # The description of the Data
    
##### Relation between Data and Resource #####

<simulate_data_collection#sample_spreadsheet_data>
    yw:wasReadFrom          <simulate_data_collection#sample_spreadsheet_resource/001> .

<simulate_data_collection#run_log_data>
    yw:wasWrittenTo         <simulate_data_collection#run_log_resource/001> .
    
```

<h3 id="2.8">2.8 hasSubBlock object property</h3>

The association *hasSubBlock* specifies the recursive composition of Blocks, a parent Block includes a child Block as part of its specification.

**has domain**
* yw:Block, yw:Workflow

**has range**
* yw:Block

**Example:**

It is shown in class Block and Workflow.

<h3 id="2.9">2.9 hasInPort object property</h3>

The association *hasInPort* specifies the InPorts (including ParamPorts) of a particular Block or Workflow that are used as input data or parameter ports.

**has domain**
* yw:Block, yw:Workflow

**has range**
* yw:InPort, yw:ParamPort

**Example:**

It is shown in class Block and Workflow.

<h3 id="2.10">2.10 hasOutPort object property</h3>

The association *hasOutPort* specifies the OutPorts of a particular Block or Workflow that are used as output ports.

**has domain**
* yw:Block, yw:Workflow

**has range**
* yw:OutPort

**Example:**

It is shown in class Block and Workflow.

<h3 id="2.11">2.11 receives object property</h3>

The association *receives* specifies that an InPort receives a Data. Ports with the same alias names connect to the same Data.

**has domain**
* yw:InPort, yw:ParamPort

**has range**
* yw:Data

**Example:**

It is shown in class Port.

<h3 id="2.12">2.12 sends object property</h3>

The association *sends* specifies that an OutPort sends a Data. Ports with the same alias names connect to the same Data.

**has domain**
* yw:OutPort

**has range**
* yw:Data

**Example:**

It is shown in class Port.

<h3 id="2.13">2.13 hasVariableSource object property</h3>

The association *hasVariableSource* specifies that a Port with filePathTemplate can have its corresponding URI variable names inside the string of filePathTemplate. The URI variable names are Data names indeed.

**has domain**
* yw:InPort, yw:ParamPort, yw:OutPort

**has range**
* yw:Data

**Example:**

It is shown in class Port.

<h3 id="2.14">2.14 Resource class</h3>

A Resource is an actual file (with its path) generated after running the source script. The Resource is named according to the filePathTemplate of its connected port. Resource files are associated with retrospective provenance.

**has self-attribute**
* yw:actualFilePath

**is in domain of**
* yw:hasURIVariable

**is in range of**
* yw:wasReadFrom, yw:wasWrittenTo

**Example:**

The following RDF Turtle fragment specifies a Resource.

```
yw:Resource     rdf:type           rdfs:Class .

<simulate_data_collection#sample_spreadsheet_resource/001>
    rdf:type                yw:Resource ;
    yw:actualFilePath       "cassette_q55_spreadsheet.csv" ;         # The actual file name (with its path) of the resource
    yw:hasURIVariable       <simulate_data_collection#sample_spreadsheet_resource/001/v1> , <...> .      # The referred URI variables in the resource file name (with its path)
```

<h3 id="2.15">2.15 URIVariable class</h3>

An URIVariable is a variable referred in the resource file name (with its path). URIVariables have variable names between "{" and "}" in corresponding port's filePathTemplate. URIVariables have variable values in the actualFilePath string.

**has self-attribute**
* yw:variableName, yw:variableValue

**is in range of**
* yw:hasURIVariable

**Example:**

The following RDF Turtle fragment specifies an URIVariable.

```
yw:URIVariable  rdf:type           rdfs:Class .

    <simulate_data_collection#sample_spreadsheet_resource/001/v1>
        rdf:type               yw:URIVariable ;
        yw:variableName        "cassette_id" ;        # The name of the URIVariable
        yw:variableValue       "q55" .                # The value of the URIVariable
```

<h3 id="2.16">2.16 wasReadFrom object property</h3>

The association *wasReadFrom* specifies that a Data was read from a Resource file. The Data is received by an InPort with a URI file path template. The association *wasReadFrom* is a bridge property between prospective model and retrospective model.

**has domain**
* yw:Data

**has range**
* yw:Resource

**Example:**

It is shown in class Data.

<h3 id="2.17">2.17 wasWrittenTo object property</h3>

The association *wasWrittenTo* specifies that a Data was written to a Resource file. The Data is sent by an OutPort with a URI file path template. The association *wasWrittenTo* is a bridge property between prospective model and retrospective model.

**has domain**
* yw:Data

**has range**
* yw:Resource

**Example:**

It is shown in class Data.

<h3 id="2.18">2.18 hasURIVariable object property</h3>

The association *hasURIVariable* specifies that a Resource may have some URI variables in its actual file path. The URI variables are corresponding to the Port's filePathTemplate that the Resource is generated by.

**has domain**
* yw:Resource

**has range**
* yw:URIVariable

**Example:**

It is shown in class Resource.

## 3. YesWorkflow Data Model Mapping to ProvONE Data Model

The comparison between YesWorkflow Model and ProvONE Model is shown in the following figure.

**Figure 2: ProvONE Model and YesWorkflow Model UML Diagrams**

![](https://github.com/idaks/DataONE-Prov-Summer-2017/blob/master/examples/simulate_data_collection/YW%20Model%20OWL/ProvONEvsYesWorkflowUML.png)

The built-in OWL property *owl:sameAs* is used for connecting equivalent classes and associations when mapping from YesWorkflow Model to ProvONE Model. Only some concepts are the same between YesWorkflow (yw) and ProvONE (p1) namespaces. The following is the code in the RDF Turtle file.

```
##### Class Equality #####

yw:Block        rdf:type             rdfs:Class ;
                owl:sameAs           p1:Program .

yw:Workflow     rdf:type             rdfs:Class ;
	        rdfs:subClassOf      yw:Block ;
                owl:sameAs           p1:Workflow .

yw:InPort       rdf:type             rdfs:Class ;
	        rdfs:subClassOf      yw:Port .

yw:OutPort      rdf:type             rdfs:Class ;
	        rdfs:subClassOf      yw:Port .

yw:ParamPort    rdf:type             rdfs:Class ;
	        rdfs:subClassOf      yw:InPort .

yw:Port         rdf:type             rdfs:Class ;
                owl:sameAs           p1:Port .

yw:Data         rdf:type             rdfs:Class .

yw:Resource     rdf:type             rdfs:Class .

yw:URIVariable  rdf:type             rdfs:Class .


##### Property Equality #####

yw:hasSubBlock      owl:sameAs                p1:hasSubProgram .

yw:hasInPort        owl:sameAs                p1:hasInPort .

yw:hasOutPort       owl:sameAs                p1:hasOutPort .
```

The following table describes the mapping rules from YesWorkflow (yw) to ProvONE (p1) namespace.

**Table 3: YesWorkflow (yw) Data Model Mapping to ProvONE (p1) Data Model**

<table>
  <tr>
    <th>YW Provenance</th><th>Construct Type</th><th>YesWorkflow Namespace</th><th>ProvONE Namespace</th>
  </tr>
  <tr>
    <td rowspan="13">Prospective</td><td rowspan="7">Class</td><td>yw:Block</td><td>p1:Program</td>
  </tr>
  <tr>
    <td>yw:Workflow</td><td>p1:Workflow</td>
  </tr>
  <tr>
    <td>yw:Port</td><td>p1:Port</td>
  </tr>
  <tr>
    <td>yw:InPort</td><td>n/a</td>
  </tr>
  <tr>
    <td>yw:ParamPort</td><td>n/a</td>
  </tr>
  <tr>
    <td>yw:OutPort</td><td>n/a</td>
  </tr>
  <tr>
    <td>yw:Data</td><td>n/a</td>
  </tr>
  <tr>
    <td rowspan="6">Association</td><td>yw:hasSubBlock</td><td>p1:hasSubProgram</td>
  </tr>
  <tr>
    <td>yw:hasInPort</td><td>p1:hasInPort</td>
  </tr>
  <tr>
    <td>yw:hasOutPort</td><td>p1:hasOutPort</td>
  </tr>
  <tr>
    <td>yw:receives</td><td>n/a</td>
  </tr>
  <tr>
    <td>yw:sends</td><td>n/a</td>
  </tr>
  <tr>
    <td>yw:hasVariableSource</td><td>n/a</td>
  </tr>
  <tr>
    <td rowspan="5">Retrospective</td><td rowspan="2">Class</td><td>yw:Resource</td><td>n/a</td>
  </tr>
  <tr>
    <td>yw:URIVariable</td><td>n/a</td>
  </tr>
  <tr>
    <td rowspan="3">Association</td><td>yw:wasReadFrom</td><td>n/a</td>
  </tr>
  <tr>
    <td>yw:wasWrittenTo</td><td>n/a</td>
  </tr>
  <tr>
    <td>yw:hasURIVariable</td><td>n/a</td>
  </tr>
</table>
