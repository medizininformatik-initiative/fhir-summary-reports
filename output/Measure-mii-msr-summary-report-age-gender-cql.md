# Summary Report Age Gender CQL - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Summary Report Age Gender CQL**

## Measure: Summary Report Age Gender CQL 

| | |
| :--- | :--- |
| *Official URL*:https://medizininformatik-initiative.de/fhir/Measure/SummaryReportAgeGenderCQL | *Version*:0.1.0 |
| Active as of 2025-10-16 | *Computable Name*:SummaryReportAgeGenderCQL |

 
Summary Report with gender and 5-year age group stratification using CQL matching German census data structure 

* Knowledge Artifact Metadata: Name (machine-readable)
  * ?: SummaryReportAgeGenderCQL
* Knowledge Artifact Metadata: Title (human-readable)
  * ?: Summary Report Age Gender CQL
* Knowledge Artifact Metadata: Status
  * ?: Active
* Knowledge Artifact Metadata: Experimental
  * ?: false
* Knowledge Artifact Metadata: Description
  * ?: Summary Report with gender and 5-year age group stratification using CQL matching German census data structure
* Knowledge Artifact Metadata: Measure Steward
  * ?: Medizininformatik Initiative
* Knowledge Artifact Metadata: Steward Contact Details
  * ?: Medizininformatik Initiative:[https://www.medizininformatik-initiative.de/](https://www.medizininformatik-initiative.de/)
* Knowledge Artifact Metadata: Measure Metadata
* Knowledge Artifact Metadata: Version Number
  * ?: 0.1.0
* Knowledge Artifact Metadata: Measure Population Criteria
* Knowledge Artifact Metadata: Summary
  * ?: Patient stratification by gender and 5-year age groups
* Knowledge Artifact Metadata: Initial Population
  * ?: **ID**: initial-population-identifier**Description**: No description provided**Logic Definition**:[InInitialPopulation](#stratifieragegender-ininitialpopulation)
* Knowledge Artifact Metadata: Stratifier
  * ?: **ID**: stratifier-gender**Code**: Administrative gender
* Knowledge Artifact Metadata: Stratifier
  * ?: **ID**: stratifier-age-five-year-groups**Code**: Age group
* Knowledge Artifact Metadata: Measure Logic
* Knowledge Artifact Metadata: Primary Library
  * ?: [Patient Age and Gender Stratification Library](Bundle-mii-bdl-measure-library-transaction-bundle.md)
* Knowledge Artifact Metadata: Generated using version 0.4.6 of the sample-content-ig Liquid templates



## Resource Content

```json
{
  "resourceType" : "Measure",
  "id" : "mii-msr-summary-report-age-gender-cql",
  "meta" : {
    "profile" : [
      "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
    ]
  },
  "url" : "https://medizininformatik-initiative.de/fhir/Measure/SummaryReportAgeGenderCQL",
  "version" : "0.1.0",
  "name" : "SummaryReportAgeGenderCQL",
  "title" : "Summary Report Age Gender CQL",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-16",
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
  "description" : "Summary Report with gender and 5-year age group stratification using CQL matching German census data structure",
  "library" : [
    "https://www.medizininformatik-initiative.de/fhir/Library/StratifierAgeGender"
  ],
  "group" : [
    {
      "description" : "Patient stratification by gender and 5-year age groups",
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
            "language" : "text/cql-identifier",
            "expression" : "InInitialPopulation"
          }
        }
      ],
      "stratifier" : [
        {
          "id" : "stratifier-gender",
          "code" : {
            "coding" : [
              {
                "system" : "http://loinc.org",
                "code" : "107454-1",
                "display" : "Administrative gender"
              }
            ]
          },
          "criteria" : {
            "language" : "text/cql-identifier",
            "expression" : "Gender"
          }
        },
        {
          "id" : "stratifier-age-five-year-groups",
          "code" : {
            "coding" : [
              {
                "system" : "http://loinc.org",
                "code" : "46251-5",
                "display" : "Age group"
              }
            ]
          },
          "criteria" : {
            "language" : "text/cql-identifier",
            "expression" : "AgeFiveYearGroups"
          }
        }
      ]
    }
  ]
}

```
