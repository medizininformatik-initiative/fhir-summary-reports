// Advanced measure with composite stratification
Instance: mii-msr-summary-report-composite-gender-age-cql
InstanceOf: Measure
Usage: #example
* version = "1.0"
* url = "https://medizininformatik-initiative.de/fhir/Measure/SummaryReportCompositeAgeGenderCQL"
* status = #active
* experimental = false
* publisher = "MII"
* name = "SummaryReportCompositeAgeGenderCQL"
* title = "Summary Report Composite Age Gender CQL"
* description = "Summary Report with gender and age decade stratification using CQL in a composite stratifier"
* date = "2025-09-30"

// Reference to the CQL library
* library = "https://www.medizininformatik-initiative.de/fhir/Library/StratifierAgeGender"

// Group definition
* group.description = "Composite stratification by gender and age decade"
* group.population.code = $measure-population#initial-population
* group.population.criteria.language = #text/cql-identifier
* group.population.criteria.expression = "InInitialPopulation"
* group.population.id = "initial-population"

// Composite stratifier combining gender and age decade
// * group.stratifier[0].code = $summary-report-codes#gender-age-composite
// * group.stratifier[0].id = "strat-gender-age"
// * group.stratifier[0].description = "Combined gender and age group stratification"

// Age group component  
* group.stratifier[0].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier[0].component[0].criteria.language = #text/cql-identifier
* group.stratifier[0].component[0].criteria.expression = "AgeFiveYearGroups"
* group.stratifier[0].component[0].description = "Patient age five year group"

// Gender component
* group.stratifier[0].component[1].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier[0].component[1].criteria.language = #text/cql-identifier
* group.stratifier[0].component[1].criteria.expression = "Gender"
* group.stratifier[0].component[1].description = "Patient gender"