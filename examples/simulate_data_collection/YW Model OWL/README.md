# YesWorkflow Data Model Vocabulary

## 1. YesWorkflow Conceptual Model Overview

The YesWorkflow conceptual model is illustrated by the UML diagram of Figure 1.

**Figure 1: YesWorkflow Conceptual Model UML Diagram**

![](https://github.com/idaks/DataONE-Prov-Summer-2017/blob/master/examples/simulate_data_collection/YW%20Model%20OWL/YesWorkflow_UML_Diagram.jpg)

The following namespaces and prefixes are used in YesWorkflow RDF Turtle facts and SPARQL queries. 

**Table 1: Prefix and Namespaces used in this specification**

| Prefix | Namespace IRI | Definition |
| ------ | ------------- | ---------- |
| yw     | http://yesworkflow.org/ns/yesworkflow | The YesWorkflow namespace |
| p1     | http://purl.dataone.org/provone/2015/01/15/ontology# | The ProvONE namespace |
| rdf    | http://www.w3.org/1999/02/22-rdf-syntax-ns# | The RDF namespace |
| rdfs   | http://www.w3.org/2000/01/rdf-schema# | The RDFS namespace |

The ProvONE constructs are summarized in Table 2 below.

**Table 2: YesWorkflow Constructs**
<table>
  <tr>
    <th>YW Provenance</th><th>Construct Type</th><th>Name</th><th>Specification</th>
  </tr>
  <tr>
    <td rowspan="12">Prospective</td><td rowspan="7">Class</td><td>Block</td><td>Section 2.1</td>
  </tr>
  <tr>
    <td>Workflow</td><td>Section 2.2</td>
  </tr>
  <tr>
    <td>Port</td><td>Section 2.3</td>
  </tr>
  <tr>
    <td>InPort</td><td>Section 2.4</td>
  </tr>
  <tr>
    <td>ParamPort</td><td>Section 2.5</td>
  </tr>
  <tr>
    <td>OutPort</td><td>Section 2.6</td>
  </tr>
  <tr>
    <td>DataNode</td><td>Section 2.7</td>
  </tr>
  <tr>
    <td rowspan="5">Association</td><td>hasSubBlock</td><td>Section 2.8</td>
  </tr>
  <tr>
    <td>hasInPort</td><td>Section 2.9</td>
  </tr>
  <tr>
    <td>hasOutPort</td><td>Section 2.10</td>
  </tr>
  <tr>
    <td>connectsTo</td><td>Section 2.11</td>
  </tr>
  <tr>
    <td>hasVariableSource</td><td>Section 2.12</td>
  </tr>
  <tr>
    <td rowspan="4">Retrospective</td><td rowspan="2">Class</td><td>Resource</td><td>Section 2.13</td>
  </tr>
  <tr>
    <td>URIVariable</td><td>Section 2.14</td>
  </tr>
  <tr>
    <td rowspan="2">Association</td><td>isGeneratedBy</td><td>Section 2.15</td>
  </tr>
  <tr>
    <td>hasURIVariable</td><td>Section 2.16</td>
  </tr>
</table>

## 2. YesWorkflow Model Specification
This section presents the specification of the various components of the YesWorkflow model outlined in the previous section.

### 2.1 Block class


## 3. YesWorkflow Data Model Mapping to ProvONE Data Model

**Table 3: YesWorkflow (yw) Data Model Mapping to ProvONE (p1) Data Model**

![](https://github.com/idaks/DataONE-Prov-Summer-2017/blob/master/examples/simulate_data_collection/YW%20Model%20OWL/ProvONEvsYesWorkflow_UML_Diagrams.png)

| Construct Type |  YesWorkflow Model | ProvONE Model |
| ----- | ------------- | ---------- |
| Class | yw:Block      | p1:Program |
| Class | yw:Port       | p1:Port |
| Class | yw:Workflow   | p1:Workflow |
| Class | yw:DataNode   | p1:Channel |
| Class | yw:Resource   | n/a |
| Class | yw:URIVariable| n/a |
| Association | yw:hasSubBlock  | p1:hasSubProgram |
| Association | yw:hasInPort    | p1:hasInPort |
| Association | yw:hasOutPort   | p1:hasOutPort |
| Association | yw:connectsTo   | p1:connectsTo |
| Association | yw:hasVariableSource | n/a |
| Association | yw:isGeneratedBy     | n/a |
| Association | yw:hasURIVariable    | n/a |
