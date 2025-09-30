Instance: mii-msr-summary-report-age-gender-cql
InstanceOf: Measure
Usage: #example
//* meta.profile = "http://fhir-data-evaluator/StructureDefinition/FhirDataEvaluatorBasicMeasure"
* version = "1.0"
* url = "https://medizininformatik-initiative.de/fhir/Measure/SummaryReportAgeGenderCQL"
* status = #active
* experimental = false
* publisher = "MII"
* name = "SummaryReportAgeGenderCQL"
* title = "Summary Report Age Gender CQL"
* description = "Summary Report with gender and age decade stratification using CQL"
* date = "2025-09-30"

// Reference to the CQL library for age calculations
* library = "https://www.medizininformatik-initiative.de/fhir/Library/StratifierAgeGender"

// Group definition
* group.description = "Patient stratification by gender and age decade"
* group.population.code = $measure-population#initial-population
* group.population.criteria.language = #text/cql-identifier
* group.population.criteria.expression = "InInitialPopulation"
* group.population.id = "initial-population-identifier"

// First stratifier: Gender
* group.stratifier[0].criteria.language = #text/cql-identifier
* group.stratifier[0].criteria.expression = "Gender"
* group.stratifier[0].code = $system#gender
* group.stratifier[0].id = "strat-gender"

// Second stratifier: Age Decade
* group.stratifier[1].criteria.language = #text/cql-identifier
* group.stratifier[1].criteria.expression = "AgeDecade"
* group.stratifier[1].code = $system#age-decade
* group.stratifier[1].id = "strat-age-decade"