# mii-msr-age-gender-separated-zensus-de-2022 - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-msr-age-gender-separated-zensus-de-2022**

## Example MeasureReport: mii-msr-age-gender-separated-zensus-de-2022

**status**: Complete

**type**: Summary

**measure**: [Summary Report Age Gender CQLversion: null0.1.0)](Measure-mii-msr-summary-report-age-gender-cql.md)

**date**: 2025-10-22 12:00:00+0000

**period**: 2022 --> 2022

> **group**

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 88212740 |

> **stratifier****code**:Recorded sex or gender
> **stratum****value**:0-4

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 3877937 |


> **stratum****value**:5-9

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 3880730 |


> **stratum****value**:10-14

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 3777504 |


> **stratum****value**:15-19

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 3802662 |


> **stratum****value**:20-24

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 4399638 |


> **stratum****value**:25-29

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 4758696 |


> **stratum****value**:30-34

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 5470694 |


> **stratum****value**:34-39

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 5384817 |


> **stratum****value**:40-44

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 5190461 |


> **stratum****value**:45-49

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 4810038 |


> **stratum****value**:50-54

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 6131189 |


> **stratum****value**:55-59

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 6795249 |


> **stratum****value**:60-64

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 6049720 |


> **stratum****value**:65-69

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 5010077 |


> **stratum****value**:70-74

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 4216705 |


> **stratum****value**:75-79

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 3122252 |


> **stratum****value**:80-84

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 3395607 |


> **stratum****value**:85-89

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 1804095 |


> **stratum****value**:90+

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 841469 |






## Resource Content

```json
{
  "resourceType" : "MeasureReport",
  "id" : "mii-msr-age-gender-separated-zensus-de-2022",
  "status" : "complete",
  "type" : "summary",
  "measure" : "https://medizininformatik-initiative.de/fhir/Measure/SummaryReportAgeGenderCQL|0.1.0",
  "date" : "2025-10-22T12:00:00+00:00",
  "period" : {
    "start" : "2022",
    "end" : "2022"
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
          "count" : 88212740
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
                  "count" : 3877937
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
                  "count" : 3880730
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
                  "count" : 3777504
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
                  "count" : 3802662
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
                  "count" : 4399638
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
                  "count" : 4758696
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
                  "count" : 5470694
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
                  "count" : 5384817
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
                  "count" : 5190461
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
                  "count" : 4810038
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
                  "count" : 6131189
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
                  "count" : 6795249
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
                  "count" : 6049720
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
                  "count" : 5010077
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
                  "count" : 4216705
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
                  "count" : 3122252
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
                  "count" : 3395607
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
                  "count" : 1804095
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
                  "count" : 841469
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
