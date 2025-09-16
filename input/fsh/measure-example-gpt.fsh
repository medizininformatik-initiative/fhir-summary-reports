Alias: MeasurePopulation = http://terminology.hl7.org/CodeSystem/measure-population
Alias: MeasureScoring = http://terminology.hl7.org/CodeSystem/measure-scoring
Alias: Gender = http://hl7.org/fhir/administrative-gender

Instance: CohortAgeGender
InstanceOf: Measure
Title: "Cohort Distribution by Age and Gender"
Usage: #definition
* url = "http://example.org/fhir/Measure/cohort-age-gender"
* status = #active
* scoring = MeasureScoring#cohort

* group[+].id = "main"
* group[=].population[+].code = MeasurePopulation#initial-population
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "CohortPatients"

// Composite stratifier
* group[=].stratifier[+].code.text = "Age x Gender"
* group[=].stratifier[=].component[+].code.text = "age-5y"
* group[=].stratifier[=].component[=].criteria.language = #text/cql-identifier
* group[=].stratifier[=].component[=].criteria.expression = "AgeBands5y"
* group[=].stratifier[=].component[+].code.text = "gender"
* group[=].stratifier[=].component[=].criteria.language = #text/cql-identifier
* group[=].stratifier[=].component[=].criteria.expression = "PatientGender"

Instance: CohortAgeGenderReport
InstanceOf: MeasureReport
Title: "Cohort Age x Gender Report"
Usage: #example
* measure = "http://example.org/fhir/Measure/cohort-age-gender"
* status = #complete
* type = #summary
* period.start = "2025-01-01"
* period.end = "2025-12-31"

* group[+].id = "main"
* group[=].stratifier[+].code.text = "Age × Gender"

// ---- Stratum: Age 5-9, Male ----
* group[=].stratifier[=].stratum[+].component[+].code.text = "age-5y"
* group[=].stratifier[=].stratum[=].component[=].value.text = "5-9"
* group[=].stratifier[=].stratum[=].component[+].code.text = "gender"
* group[=].stratifier[=].stratum[=].component[=].value = Gender#male
* group[=].stratifier[=].stratum[=].population[+].code = MeasurePopulation#initial-population
* group[=].stratifier[=].stratum[=].population[=].count = 12

// ---- Stratum: Age 5-9, Female ----
* group[=].stratifier[=].stratum[+].component[+].code.text = "age-5y"
* group[=].stratifier[=].stratum[=].component[=].value.text = "5-9"
* group[=].stratifier[=].stratum[=].component[+].code.text = "gender"
* group[=].stratifier[=].stratum[=].component[=].value = Gender#female
* group[=].stratifier[=].stratum[=].population[+].code = MeasurePopulation#initial-population
* group[=].stratifier[=].stratum[=].population[=].count = 13

// ---- Stratum: Age 10-14, Male ----
* group[=].stratifier[=].stratum[+].component[+].code.text = "age-5y"
* group[=].stratifier[=].stratum[=].component[=].value.text = "10-14"
* group[=].stratifier[=].stratum[=].component[+].code.text = "gender"
* group[=].stratifier[=].stratum[=].component[=].value = Gender#male
* group[=].stratifier[=].stratum[=].population[+].code = MeasurePopulation#initial-population
* group[=].stratifier[=].stratum[=].population[=].count = 15

// ---- Stratum: Age 10-14, Female ----
* group[=].stratifier[=].stratum[+].component[+].code.text = "age-5y"
* group[=].stratifier[=].stratum[=].component[=].value.text = "10-14"
* group[=].stratifier[=].stratum[=].component[+].code.text = "gender"
* group[=].stratifier[=].stratum[=].component[=].value = Gender#female
* group[=].stratifier[=].stratum[=].population[+].code = MeasurePopulation#initial-population
* group[=].stratifier[=].stratum[=].population[=].count = 18