/*
 * Stratifer uses FHIRPath and works with the FHIR Data Evaluator
 */

Instance: mii-msr-summary-report-fhir-data-evaluator
InstanceOf: Measure
Usage: #example
//* meta.profile = "http://fhir-data-evaluator/StructureDefinition/FhirDataEvaluatorBasicMeasure"
* version = "1.0"
* url = "https://medizininformatik-initiative.de/fhir/Measure/SummaryReport"
* status = #active
* experimental = false
* publisher = "MII"
* name = "SummaryReport"
* title = "Summary Report"
* description = "Summary Report that uses FHIRPath and works with the FHIR Data Evaluator"
* date = "2025-09-30"
* group.description = "Simple Stratifier concept"
* group.population.code = $measure-population#initial-population
* group.population.criteria.language = #text/x-fhir-query
* group.population.criteria.expression = "Patient?"
* group.population.id = "initial-population-identifier"
* group.stratifier.criteria.language = #text/fhirpath
* group.stratifier.criteria.expression = "Patient.gender"
* group.stratifier.code = $loinc#107454-1 "Administrative gender"
* group.stratifier.id = "strat-1"

