Instance: mii-msr-summary-report-age-gender-cql
InstanceOf: Measure
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* version = "1.0"
* url = "https://medizininformatik-initiative.de/fhir/Measure/SummaryReportAgeGenderCQL"
* status = #active
* experimental = false
* publisher = "MII"
* name = "SummaryReportAgeGenderCQL"
* title = "Summary Report Age Gender CQL"
* description = "Summary Report with gender and 5-year age group stratification using CQL matching German census data structure"
* date = "2025-10-16"

// Reference to the CQL library for age calculations
* library = "https://www.medizininformatik-initiative.de/fhir/Library/StratifierAgeGender"

// Group definition
* group.description = "Patient stratification by gender and 5-year age groups"
* group.population.code = $measure-population#initial-population
* group.population.criteria.language = #text/cql-identifier
* group.population.criteria.expression = "InInitialPopulation"
* group.population.id = "initial-population-identifier"

// First stratifier: Gender
* group.stratifier[0].criteria.language = #text/cql-identifier
* group.stratifier[0].criteria.expression = "Gender"
* group.stratifier[0].code = $loinc#107454-1 "Administrative gender"
* group.stratifier[0].id = "stratifier-gender"

// Second stratifier: Age Group (5-year ranges matching census data)
* group.stratifier[1].criteria.language = #text/cql-identifier
* group.stratifier[1].criteria.expression = "AgeFiveYearGroups"
* group.stratifier[1].code = $loinc#46251-5 "Age group"
* group.stratifier[1].id = "stratifier-age-five-year-groups"