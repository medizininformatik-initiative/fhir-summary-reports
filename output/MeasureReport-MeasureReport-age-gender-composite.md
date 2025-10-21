#  - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## MeasureReport: 

**io/blaze/fhir/StructureDefinition/eval-duration**: 0.004558625 s(Details: UCUM codes = 's')

**io/blaze/fhir/StructureDefinition/bloom-filter-ratio**: 0/0

**status**: Complete

**type**: Summary

**measure**: [Summary Report Composite Age Gender CQLversion: null0.1.0)](Measure-mii-msr-summary-report-composite-gender-age-cql.md)

**date**: 2025-10-17 12:10:35+0000

**period**: 1900 --> 2025

> **group**

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 11 |

> **stratifier**
> **stratum**
> **component****code**:Age group**value**:55-59

> **component****code**:Recorded sex or gender**value**:female

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 1 |


> **stratum**
> **component****code**:Age group**value**:25-29

> **component****code**:Recorded sex or gender**value**:blaze.fhir.spec.type.ExtendedCode@5e4b9e7b

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 1 |


> **stratum**
> **component****code**:Age group**value**:40-44

> **component****code**:Recorded sex or gender**value**:male

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 1 |


> **stratum**
> **component****code**:Age group**value**:30-34

> **component****code**:Recorded sex or gender**value**:female

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 1 |


> **stratum**
> **component****code**:Age group**value**:65-69

> **component****code**:Recorded sex or gender**value**:male

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 1 |


> **stratum**
> **component****code**:Age group**value**:40-44

> **component****code**:Recorded sex or gender**value**:female

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 2 |


> **stratum**
> **component****code**:Age group**value**:45-49

> **component****code**:Recorded sex or gender**value**:male

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 2 |


> **stratum**
> **component****code**:Age group**value**:60-64

> **component****code**:Recorded sex or gender**value**:male

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 1 |


> **stratum**
> **component****code**:Age group**value**:55-59

> **component****code**:Recorded sex or gender**value**:male

### Populations

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Count** |
| * | Initial Population | 1 |






## Resource Content

```json
{
  "resourceType" : "MeasureReport",
  "id" : "MeasureReport-age-gender-composite",
  "extension" : [
    {
      "url" : "https://samply.github.io/blaze/fhir/StructureDefinition/eval-duration",
      "valueQuantity" : {
        "value" : 0.004558625,
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
  "measure" : "https://medizininformatik-initiative.de/fhir/Measure/SummaryReportCompositeAgeGenderCQL|0.1.0",
  "date" : "2025-10-17T12:10:35.420758753Z",
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
          "stratum" : [
            {
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
                  "value" : {
                    "text" : "55-59"
                  }
                },
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://loinc.org",
                        "code" : "99502-7",
                        "display" : "Recorded sex or gender"
                      }
                    ]
                  },
                  "value" : {
                    "text" : "female"
                  }
                }
              ],
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
                  "value" : {
                    "text" : "25-29"
                  }
                },
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://loinc.org",
                        "code" : "99502-7",
                        "display" : "Recorded sex or gender"
                      }
                    ]
                  },
                  "value" : {
                    "text" : "blaze.fhir.spec.type.ExtendedCode@5e4b9e7b"
                  }
                }
              ],
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
                  "value" : {
                    "text" : "40-44"
                  }
                },
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://loinc.org",
                        "code" : "99502-7",
                        "display" : "Recorded sex or gender"
                      }
                    ]
                  },
                  "value" : {
                    "text" : "male"
                  }
                }
              ],
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
                  "value" : {
                    "text" : "30-34"
                  }
                },
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://loinc.org",
                        "code" : "99502-7",
                        "display" : "Recorded sex or gender"
                      }
                    ]
                  },
                  "value" : {
                    "text" : "female"
                  }
                }
              ],
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
                  "value" : {
                    "text" : "65-69"
                  }
                },
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://loinc.org",
                        "code" : "99502-7",
                        "display" : "Recorded sex or gender"
                      }
                    ]
                  },
                  "value" : {
                    "text" : "male"
                  }
                }
              ],
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
                  "value" : {
                    "text" : "40-44"
                  }
                },
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://loinc.org",
                        "code" : "99502-7",
                        "display" : "Recorded sex or gender"
                      }
                    ]
                  },
                  "value" : {
                    "text" : "female"
                  }
                }
              ],
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
                  "value" : {
                    "text" : "45-49"
                  }
                },
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://loinc.org",
                        "code" : "99502-7",
                        "display" : "Recorded sex or gender"
                      }
                    ]
                  },
                  "value" : {
                    "text" : "male"
                  }
                }
              ],
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
                  "value" : {
                    "text" : "60-64"
                  }
                },
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://loinc.org",
                        "code" : "99502-7",
                        "display" : "Recorded sex or gender"
                      }
                    ]
                  },
                  "value" : {
                    "text" : "male"
                  }
                }
              ],
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
                  "value" : {
                    "text" : "55-59"
                  }
                },
                {
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://loinc.org",
                        "code" : "99502-7",
                        "display" : "Recorded sex or gender"
                      }
                    ]
                  },
                  "value" : {
                    "text" : "male"
                  }
                }
              ],
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
