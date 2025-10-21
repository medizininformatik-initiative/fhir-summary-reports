#  - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## MeasureReport: 

**io/blaze/fhir/StructureDefinition/eval-duration**: 0.012402542 s(Details: UCUM codes = 's')

**io/blaze/fhir/StructureDefinition/bloom-filter-ratio**: 0/0

**status**: Complete

**type**: Summary

**measure**: [Summary Report Age Gender CQLversion: null0.1.0)](Measure-mii-msr-summary-report-age-gender-cql.md)

**date**: 2025-10-17 12:10:34+0000

**period**: 1900 --> 2025

> **group**

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 11 |

> **stratifier****code**:Recorded sex or gender
> **stratum****value**:male

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 6 |


> **stratum****value**:female

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 4 |


> **stratum****value**:blaze.fhir.spec.type.ExtendedCode@5e4b9e7b

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 1 |



> **stratifier****code**:Age group
> **stratum****value**:45-49

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 2 |


> **stratum****value**:30-34

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 1 |


> **stratum****value**:65-69

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 1 |


> **stratum****value**:40-44

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 3 |


> **stratum****value**:55-59

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 2 |


> **stratum****value**:25-29

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 1 |


> **stratum****value**:60-64

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 1 |






## Resource Content

```json
{
  "resourceType" : "MeasureReport",
  "id" : "MeasureReport-age-gender-separate",
  "extension" : [
    {
      "url" : "https://samply.github.io/blaze/fhir/StructureDefinition/eval-duration",
      "valueQuantity" : {
        "value" : 0.012402542,
        "unit" : "s",
        "system" : "http://unitsofmeasure.org",
        "code" : "s"
      }
    },
    {
      "url" : "https://samply.github.io/blaze/fhir/StructureDefinition/bloom-filter-ratio",
      "valueRatio" : {
        "numerator" : {
          "value" : 0
        },
        "denominator" : {
          "value" : 0
        }
      }
    }
  ],
  "status" : "complete",
  "type" : "summary",
  "measure" : "https://medizininformatik-initiative.de/fhir/Measure/SummaryReportAgeGenderCQL|0.1.0",
  "date" : "2025-10-17T12:10:34.937959461Z",
  "period" : {
    "start" : "1900",
    "end" : "2025"
  },
  "group" : [
    {
      "population" : [
        {
          "code" : {
            "coding" : [
              {
                "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
                "code" : "initial-population"
              }
            ]
          },
          "count" : 11
        }
      ],
      "stratifier" : [
        {
          "code" : [
            {
              "coding" : [
                {
                  "system" : "http://loinc.org",
                  "code" : "99502-7",
                  "display" : "Recorded sex or gender"
                }
              ]
            }
          ],
          "stratum" : [
            {
              "value" : {
                "text" : "male"
              },
              "population" : [
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
                        "code" : "initial-population"
                      }
                    ]
                  },
                  "count" : 6
                }
              ]
            },
            {
              "value" : {
                "text" : "female"
              },
              "population" : [
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
                        "code" : "initial-population"
                      }
                    ]
                  },
                  "count" : 4
                }
              ]
            },
            {
              "value" : {
                "text" : "blaze.fhir.spec.type.ExtendedCode@5e4b9e7b"
              },
              "population" : [
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
                        "code" : "initial-population"
                      }
                    ]
                  },
                  "count" : 1
                }
              ]
            }
          ]
        },
        {
          "code" : [
            {
              "coding" : [
                {
                  "system" : "http://loinc.org",
                  "code" : "46251-5",
                  "display" : "Age group"
                }
              ]
            }
          ],
          "stratum" : [
            {
              "value" : {
                "text" : "45-49"
              },
              "population" : [
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
                        "code" : "initial-population"
                      }
                    ]
                  },
                  "count" : 2
                }
              ]
            },
            {
              "value" : {
                "text" : "30-34"
              },
              "population" : [
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
                        "code" : "initial-population"
                      }
                    ]
                  },
                  "count" : 1
                }
              ]
            },
            {
              "value" : {
                "text" : "65-69"
              },
              "population" : [
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
                        "code" : "initial-population"
                      }
                    ]
                  },
                  "count" : 1
                }
              ]
            },
            {
              "value" : {
                "text" : "40-44"
              },
              "population" : [
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
                        "code" : "initial-population"
                      }
                    ]
                  },
                  "count" : 3
                }
              ]
            },
            {
              "value" : {
                "text" : "55-59"
              },
              "population" : [
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
                        "code" : "initial-population"
                      }
                    ]
                  },
                  "count" : 2
                }
              ]
            },
            {
              "value" : {
                "text" : "25-29"
              },
              "population" : [
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
                        "code" : "initial-population"
                      }
                    ]
                  },
                  "count" : 1
                }
              ]
            },
            {
              "value" : {
                "text" : "60-64"
              },
              "population" : [
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
                        "code" : "initial-population"
                      }
                    ]
                  },
                  "count" : 1
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}

```
