# Summary Report - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Summary Report**

## Measure: Summary Report 

| | |
| :--- | :--- |
| *Official URL*:https://medizininformatik-initiative.de/fhir/Measure/SummaryReport | *Version*:0.1.0 |
| Active as of 2025-09-30 | *Computable Name*:SummaryReport |

 
Summary Report that uses FHIRPath and works with the FHIR Data Evaluator 

* Knowledge Artifact Metadata: Name (machine-readable)
  * ?: SummaryReport
* Knowledge Artifact Metadata: Title (human-readable)
  * ?: Summary Report
* Knowledge Artifact Metadata: Status
  * ?: Active
* Knowledge Artifact Metadata: Experimental
  * ?: false
* Knowledge Artifact Metadata: Description
  * ?: Summary Report that uses FHIRPath and works with the FHIR Data Evaluator
* Knowledge Artifact Metadata: Measure Steward
  * ?: Medizininformatik Initiative
* Knowledge Artifact Metadata: Steward Contact Details
  * ?: Medizininformatik Initiative:[https://www.medizininformatik-initiative.de/](https://www.medizininformatik-initiative.de/)
* Knowledge Artifact Metadata: Measure Metadata
* Knowledge Artifact Metadata: Version Number
  * ?: 0.1.0
* Knowledge Artifact Metadata: Measure Population Criteria
* Knowledge Artifact Metadata: Summary
  * ?: Simple Stratifier concept
* Knowledge Artifact Metadata: Initial Population
  * ?: **ID**: initial-population-identifier**Description**: No description provided
* Knowledge Artifact Metadata: Stratifier
  * ?: **ID**: strat-1**Code**: Recorded sex or gender
* Knowledge Artifact Metadata: Generated using version 0.4.6 of the sample-content-ig Liquid templates



## Resource Content

```json
{
  "resourceType" : "Measure",
  "id" : "mii-msr-summary-report-fhir-data-evaluator",
  "url" : "https://medizininformatik-initiative.de/fhir/Measure/SummaryReport",
  "version" : "0.1.0",
  "name" : "SummaryReport",
  "title" : "Summary Report",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-09-30",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [
    {
      "name" : "Medizininformatik Initiative",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.medizininformatik-initiative.de/"
        }
      ]
    }
  ],
  "description" : "Summary Report that uses FHIRPath and works with the FHIR Data Evaluator",
  "group" : [
    {
      "description" : "Simple Stratifier concept",
      "population" : [
        {
          "id" : "initial-population-identifier",
          "code" : {
            "coding" : [
              {
                "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
                "code" : "initial-population"
              }
            ]
          },
          "criteria" : {
            "language" : "text/x-fhir-query",
            "expression" : "Patient?"
          }
        }
      ],
      "stratifier" : [
        {
          "id" : "strat-1",
          "code" : {
            "coding" : [
              {
                "system" : "http://loinc.org",
                "code" : "99502-7",
                "display" : "Recorded sex or gender"
              }
            ]
          },
          "criteria" : {
            "language" : "text/fhirpath",
            "expression" : "Patient.gender"
          }
        }
      ]
    }
  ]
}

```
