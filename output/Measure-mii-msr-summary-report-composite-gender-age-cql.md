# Summary Report Composite Age Gender CQL - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Summary Report Composite Age Gender CQL**

## Measure: Summary Report Composite Age Gender CQL 

| | |
| :--- | :--- |
| *Official URL*:https://medizininformatik-initiative.de/fhir/Measure/SummaryReportCompositeAgeGenderCQL | *Version*:0.1.0 |
| Active as of 2025-09-30 | *Computable Name*:SummaryReportCompositeAgeGenderCQL |

 
Summary Report with gender and age decade stratification using CQL in a composite stratifier 

* Knowledge Artifact Metadata: Name (machine-readable)
  * ?: SummaryReportCompositeAgeGenderCQL
* Knowledge Artifact Metadata: Title (human-readable)
  * ?: Summary Report Composite Age Gender CQL
* Knowledge Artifact Metadata: Status
  * ?: Active
* Knowledge Artifact Metadata: Experimental
  * ?: false
* Knowledge Artifact Metadata: Description
  * ?: Summary Report with gender and age decade stratification using CQL in a composite stratifier
* Knowledge Artifact Metadata: Measure Steward
  * ?: Medizininformatik Initiative
* Knowledge Artifact Metadata: Steward Contact Details
  * ?: Medizininformatik Initiative:[https://www.medizininformatik-initiative.de/](https://www.medizininformatik-initiative.de/)
* Knowledge Artifact Metadata: Measure Metadata
* Knowledge Artifact Metadata: Version Number
  * ?: 0.1.0
* Knowledge Artifact Metadata: Measure Population Criteria
* Knowledge Artifact Metadata: Summary
  * ?: Composite stratification by gender and age decade
* Knowledge Artifact Metadata: Initial Population
  * ?: **ID**: initial-population**Description**: No description provided**Logic Definition**:[InInitialPopulation](#stratifieragegender-ininitialpopulation)
* Knowledge Artifact Metadata: Stratifier
  * ?: **ID**: strat-gender-age**Code**:gender-age-composite**Description**: Combined gender and age group stratification
* Knowledge Artifact Metadata: Measure Logic
* Knowledge Artifact Metadata: Primary Library
  * ?: [Patient Age and Gender Stratification Library](Bundle-mii-bdl-measure-library-transaction-bundle.md)
* Knowledge Artifact Metadata: Generated using version 0.4.6 of the sample-content-ig Liquid templates



## Resource Content

```json
{
  "resourceType" : "Measure",
  "id" : "mii-msr-summary-report-composite-gender-age-cql",
  "url" : "https://medizininformatik-initiative.de/fhir/Measure/SummaryReportCompositeAgeGenderCQL",
  "version" : "0.1.0",
  "name" : "SummaryReportCompositeAgeGenderCQL",
  "title" : "Summary Report Composite Age Gender CQL",
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
  "description" : "Summary Report with gender and age decade stratification using CQL in a composite stratifier",
  "library" : [
    "https://www.medizininformatik-initiative.de/fhir/Library/StratifierAgeGender"
  ],
  "group" : [
    {
      "description" : "Composite stratification by gender and age decade",
      "population" : [
        {
          "id" : "initial-population",
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
          "id" : "strat-gender-age",
          "code" : {
            "coding" : [
              {
                "system" : "https://www.medizininformatik-initiative.de/fhir/summary-reports/CodeSystem/mii-cs-summary-report-codes",
                "code" : "gender-age-composite"
              }
            ]
          },
          "description" : "Combined gender and age group stratification",
          "component" : [
            {
              "code" : {
                "coding" : [
                  {
                    "system" : "http://loinc.org",
                    "code" : "46251-5",
                    "display" : "Age group"
                  }
                ]
              },
              "description" : "Patient age five year group",
              "criteria" : {
                "language" : "text/cql-identifier",
                "expression" : "AgeFiveYearGroups"
              }
            },
            {
              "code" : {
                "coding" : [
                  {
                    "system" : "http://loinc.org",
                    "code" : "107454-1",
                    "display" : "Administrative gender"
                  }
                ]
              },
              "description" : "Patient gender",
              "criteria" : {
                "language" : "text/cql-identifier",
                "expression" : "Gender"
              }
            }
          ]
        }
      ]
    }
  ]
}

```
