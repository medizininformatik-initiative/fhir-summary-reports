Profile: SummaryReportMeasure
Parent: MeasureReport
Description: "Summary report profile of the Measure resource."
* status = #active
* measure = ""

* group.stratifier.stratum.value.extension contains ext_R5_MeasureReport_gr_st_st_value named stratum-value 0..1
* group.stratifier.stratum.component.value.extension contains ext_R5_MeasureReport_gr_st_st_co_value named stratum-component-value 0..1
* group ^slicing.discriminator.type = #pattern
* group ^slicing.discriminator.path = "code"
* group ^slicing.rules = #open
* group contains
  categorialVerteilung 0..* and
  diskreteVerteilung 0..*

* group[categorialVerteilung].code = $summary-report-codes#categorialVerteilung
* group[categorialVerteilung].stratifier.stratum.value.extension[stratum-value].value[x] only CodeableConcept
//* group[categorialVerteilung].stratifier.stratum.component.value.extension[stratum-component-value].value[x] only Quantity
//* group[categorialVerteilung].stratifier.stratum.value[x] only CodeableConcept
//* group[categorialVerteilung].stratifier.stratum.component.value[x] only Quantity

//* group[nominalVerteilung].stratifier.code = $summary-report-group-codes#nominalVerteilung
//* group[nominalVerteilung].stratifier.stratum.value[x] only Range
//* group[nominalVerteilung].stratifier.stratum.component.value[x] only Quantity

// * group[Geschlechterverteilung].stratifier.code = $summary-report-codes#geschlechterverteilung
// * group[Geschlechterverteilung].stratifier.stratum.value[x] only Range
// * group[Geschlechterverteilung].stratifier.stratum.component.value[x] only Quantity

* group[diskreteVerteilung].code = $summary-report-codes#diskreteVerteilung
* group[diskreteVerteilung].stratifier.stratum.value.extension[stratum-value].value[x] only Range

// * group[Laborwertverteilung].stratifier.code = $summary-report-codes#laborwertverteilung
// * group[Laborwertverteilung].stratifier.stratum.value[x] only Range
// * group[Laborwertverteilung].stratifier.stratum.component.value[x] only Quantity
// * group.stratifier[Laborwertverteilung].stratum.component.code only CodeableConcept // Angabe LOINC Code

//* group[Verteilung].population[initial-population] only countQuantity

CodeSystem: SummaryReportGroupCodes
Id: summary-report-group-codes
Title: "Summary Report Group Codes"
Description: "Codes used in summary report groups"
* #nominalVerteilung
* #categorialVerteilung
* #outlier

// CodeSystem: Code
// Id: summary-report-population-codes
// Title: "Summary Report Codes"
// Description: "Codes used in summary reports populations"
// * #geschlechterverteilung
// * #altersverteilung
// * #laborwertverteilung

Alias: $summary-report-category = https://www.medizininformatik-initiative.de/fhir/summary-reports/CodeSystem/summary-report-category
Alias: $summary-report-group-codes = https://www.medizininformatik-initiative.de/fhir/summary-reports/CodeSystem/summary-report-group-codes

// Examples for MeasureReport
// https://github.com/medizininformatik-initiative/fhir-data-evaluator/tree/main/Documentation/example-measure-reports
Instance: summary-report-measure-example
InstanceOf: SummaryReportMeasure
Usage: #example
* status = #active
* type = #summary
* period.start = "2025-01-01"
* period.end = "2025-12-31"
// Example gender distribution
//* group[categorialVerteilung].code = $summary-report-group-codes#categorialVerteilung
* group[categorialVerteilung].population[+].code = #initial-population
* group[categorialVerteilung].population[=].count = 100
* group[categorialVerteilung].stratifier[+].code[+] = #gender
* group[categorialVerteilung].stratifier[=].stratum[+].value = http://hl7.org/fhir/administrative-gender#male

// initial-population notwendig als Referenz auf die Ebene der Population? oder measure-population zur Beschreibung des Counts?
//* group[categorialVerteilung].stratifier[=].stratum[=].population[+].code = #initial-population
* group[categorialVerteilung].stratifier[=].stratum[=].population[+].count = 49
* group[categorialVerteilung].stratifier[=].stratum[+].value = http://hl7.org/fhir/administrative-gender#female

//* group[categorialVerteilung].stratifier[=].stratum[=].population[+].code = #initial-population
* group[categorialVerteilung].stratifier[=].stratum[=].population[+].count = 49
* group[categorialVerteilung].stratifier[=].stratum[+].value = http://hl7.org/fhir/administrative-gender#other

//* group[categorialVerteilung].stratifier[=].stratum[=].population[+].code = #initial-population
* group[categorialVerteilung].stratifier[=].stratum[=].population[+].count = 1
* group[categorialVerteilung].stratifier[=].stratum[+].value = http://hl7.org/fhir/administrative-gender#unknown

//* group[categorialVerteilung].stratifier[=].stratum[=].population[+].code = #initial-population
* group[categorialVerteilung].stratifier[=].stratum[=].population[+].count = 1

// Example age distribution
* group[diskreteVerteilung].code = $summary-report-codes#diskreteVerteilung
* group[diskreteVerteilung].population[+].code = #initial-population
* group[diskreteVerteilung].population[=].count = 100
* group[diskreteVerteilung].stratifier[+].code[+] = $summary-report-codes#altersverteilung
* group[diskreteVerteilung].stratifier[=].stratum[+].value.extension[stratum-value].valueRange.low.value = 5
* group[diskreteVerteilung].stratifier[=].stratum[=].value.extension[stratum-value].valueRange.low.unit = "years"
* group[diskreteVerteilung].stratifier[=].stratum[=].value.extension[stratum-value].valueRange.low.code = #a
* group[diskreteVerteilung].stratifier[=].stratum[=].value.extension[stratum-value].valueRange.low.system = "http://unitsofmeasure.org"
* group[diskreteVerteilung].stratifier[=].stratum[=].value.extension[stratum-value].valueRange.high.value = 18
* group[diskreteVerteilung].stratifier[=].stratum[=].value.extension[stratum-value].valueRange.high.unit = "years"
* group[diskreteVerteilung].stratifier[=].stratum[=].value.extension[stratum-value].valueRange.high.code = #a
* group[diskreteVerteilung].stratifier[=].stratum[=].value.extension[stratum-value].valueRange.high.system = "http://unitsofmeasure.org"
//* group[diskreteVerteilung].stratifier[=].stratum[=].population[+].code = #initial-population
* group[diskreteVerteilung].stratifier[=].stratum[=].population[+].count = 7

// ValueSet and CodeSystem for stratifier codes from Core. Maybe only R5+ 
// https://hl7.org/fhir/R5/valueset-measure-stratifier-example.html

