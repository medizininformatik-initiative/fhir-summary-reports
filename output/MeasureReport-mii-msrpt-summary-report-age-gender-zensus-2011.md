# MeasureReport Age Gender Zensus 2011 - FHIR Summary Reports v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MeasureReport Age Gender Zensus 2011**

## Example MeasureReport: MeasureReport Age Gender Zensus 2011

**status**: Complete

**type**: Summary

**measure**: [Measure Summary Report Age Gender CQLversion: null0.1.0)](Measure-mii-msr-summary-report-age-gender-cql.md)

**date**: 2025-10-22 12:00:00+0000

**period**: 2011 --> 2011

> **group**

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 85719686 |

> **stratifier****code**:Recorded sex or gender
> **stratum****value**:male

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 41694020 |


> **stratum****value**:female

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 44025138 |



> **stratifier****code**:Age group
> **stratum****value**:0-4

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 3338895 |


> **stratum****value**:5-9

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 3525830 |


> **stratum****value**:10-14

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 3940566 |


> **stratum****value**:15-19

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 4013881 |


> **stratum****value**:20-24

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 4835639 |


> **stratum****value**:25-29

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 4872533 |


> **stratum****value**:30-34

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 4751909 |


> **stratum****value**:34-39

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 4742891 |


> **stratum****value**:40-44

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 6351192 |


> **stratum****value**:45-49

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 6999679 |


> **stratum****value**:50-54

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 6206294 |


> **stratum****value**:55-59

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 5419449 |


> **stratum****value**:60-64

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 4702815 |


> **stratum****value**:65-69

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 4173352 |


> **stratum****value**:70-74

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 4861239 |


> **stratum****value**:75-79

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 3270284 |


> **stratum****value**:80-84

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 2328083 |


> **stratum****value**:85-89

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 1335076 |


> **stratum****value**:90+

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 550089 |






## Resource Content

```json
{
  "resourceType" : "MeasureReport",
  "id" : "mii-msrpt-summary-report-age-gender-zensus-2011",
  "status" : "complete",
  "type" : "summary",
  "measure" : "https://medizininformatik-initiative.de/fhir/Measure/SummaryReportAgeGenderCQL|0.1.0",
  "date" : "2025-10-22T12:00:00+00:00",
  "period" : {
    "start" : "2011",
    "end" : "2011"
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
          "count" : 85719686
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
                  "count" : 41694020
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
                  "count" : 44025138
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
                "text" : "0-4"
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
                  "count" : 3338895
                }
              ]
            },
            {
              "value" : {
                "text" : "5-9"
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
                  "count" : 3525830
                }
              ]
            },
            {
              "value" : {
                "text" : "10-14"
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
                  "count" : 3940566
                }
              ]
            },
            {
              "value" : {
                "text" : "15-19"
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
                  "count" : 4013881
                }
              ]
            },
            {
              "value" : {
                "text" : "20-24"
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
                  "count" : 4835639
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
                  "count" : 4872533
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
                  "count" : 4751909
                }
              ]
            },
            {
              "value" : {
                "text" : "34-39"
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
                  "count" : 4742891
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
                  "count" : 6351192
                }
              ]
            },
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
                  "count" : 6999679
                }
              ]
            },
            {
              "value" : {
                "text" : "50-54"
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
                  "count" : 6206294
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
                  "count" : 5419449
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
                  "count" : 4702815
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
                  "count" : 4173352
                }
              ]
            },
            {
              "value" : {
                "text" : "70-74"
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
                  "count" : 4861239
                }
              ]
            },
            {
              "value" : {
                "text" : "75-79"
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
                  "count" : 3270284
                }
              ]
            },
            {
              "value" : {
                "text" : "80-84"
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
                  "count" : 2328083
                }
              ]
            },
            {
              "value" : {
                "text" : "85-89"
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
                  "count" : 1335076
                }
              ]
            },
            {
              "value" : {
                "text" : "90+"
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
                  "count" : 550089
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
