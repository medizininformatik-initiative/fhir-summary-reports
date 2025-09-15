// Profile: SummaryReportObservation
// Parent: Observation
// Description: "Summary report profile of the Observation resource."
// * status = #final
// * code = $summary-report-codes#summary-report
// * component ^slicing.discriminator.type = #pattern
// * component ^slicing.discriminator.path = "code"
// * component ^slicing.rules = #open
// * component contains
//   Geschlechterverteilung 0..1 and
//   Altersverteilung 0..1
// * component[Geschlechterverteilung].code = $summary-report-codes#geschlechterverteilung
// * component[Geschlechterverteilung].value[x] only Quantity or CodeableConcept
// // value[x] ist 0..1, also kann nur Wert genau eines Datentyps sein
// * component[Altersverteilung].code = $summary-report-codes#altersverteilung
// * component[Altersverteilung].value[x] only Range


// Instance: summary-report-observation-example
// InstanceOf: SummaryReportObservation
// Description: "An example of a summary report observation"
// * status = #final
// * code = $summary-report-codes#summary-report
// * component[Geschlechterverteilung].code = $summary-report-codes#geschlechterverteilung
// * component[Geschlechterverteilung].valueCodeableConcept = #male
// * component[Geschlechterverteilung].valueQuantity.value = 50

// CodeSystem: SummaryReportCodes
// Id: summary-report-codes
// Title: "Summary Report Codes"
// Description: "Codes used in summary reports"
// * #summary-report
// * #geschlechterverteilung
// * #altersverteilung

// Alias: $summary-report-codes = https://www.medizininformatik-initiative.de/fhir/summary-reports/CodeSystem/summary-report-codes