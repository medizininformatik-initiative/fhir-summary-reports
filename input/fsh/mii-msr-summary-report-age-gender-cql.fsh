Instance: mii-msr-summary-report-age-gender-cql
InstanceOf: Measure
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* version = "0.1.0"
* url = "https://medizininformatik-initiative.de/fhir/Measure/SummaryReportAgeGenderCQL"
* status = #active
* experimental = false
* publisher = "MII"
* name = "SummaryReportAgeGenderCQL"
* title = "Summary Report Age Gender CQL"
* description = "Summary Report with gender and 5-year age group stratification using CQL matching German census data structure"
* date = "2025-10-16"

// Scoring type for proportion measure (numerator/denominator)
* scoring = $measure-scoring#proportion
* type = $measure-type#process
* improvementNotation = $measure-improvement-notation#decrease

// Reference to the CQL library for age calculations
* library = "https://www.medizininformatik-initiative.de/fhir/Library/StratifierAgeGender"

// Single group with all populations defined correctly
* group.description = "Patient stratification by gender and 5-year age groups with proportion scoring"

// Initial population
* group.population[0].code = $measure-population#initial-population
* group.population[0].criteria.language = #text/cql-identifier
* group.population[0].criteria.expression = "InInitialPopulation"
* group.population[0].id = "initial-population-identifier"

// Numerator population (patients without age)
* group.population[1].code = $measure-population#numerator
* group.population[1].criteria.language = #text/cql-identifier
* group.population[1].criteria.expression = "Numerator"
* group.population[1].id = "numerator-identifier"

// Denominator population (all patients)
* group.population[2].code = $measure-population#denominator
* group.population[2].criteria.language = #text/cql-identifier
* group.population[2].criteria.expression = "Denominator"
* group.population[2].id = "denominator-identifier"

// First stratifier: Gender
* group.stratifier[0].criteria.language = #text/cql-identifier
* group.stratifier[0].criteria.expression = "Gender"
* group.stratifier[0].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier[0].id = "stratifier-gender"

// Second stratifier: Age Group (5-year ranges matching census data)
* group.stratifier[1].criteria.language = #text/cql-identifier
* group.stratifier[1].criteria.expression = "AgeFiveYearGroups"
* group.stratifier[1].code = $loinc#46251-5 "Age group"
* group.stratifier[1].id = "stratifier-age-five-year-groups"