Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm
Alias: $measurereport-stratifier-value-example = http://hl7.org/fhir/ValueSet/measurereport-stratifier-value-example

Extension: ext_R5_MeasureReport_gr_st_st_value
Id: ext-R5-MeasureReport.gr.st.st.value
Title: "Cross-version Extension for R5.MeasureReport.group.stratifier.stratum.value[x] for use in FHIR R4"
Description: "This cross-version extension represents MeasureReport.group.stratifier.stratum.value[x] from http://hl7.org/fhir/StructureDefinition/MeasureReport|5.0.0 for use in FHIR R4."
Context: MeasureReport.group.stratifier.stratum.value
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #fhir
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[=].valueCode.extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-conformance-derivedFrom"
* ^extension[=].valueCode.extension.valueCanonical = "http://hl7.org/fhir/uv/xver/ImplementationGuide/hl7.fhir.uv.xver"
* ^url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.group.stratifier.stratum.value"
* ^version = "0.0.1-ballot"
* ^status = #draft
* ^experimental = false
* ^date = "2025-06-04T02:16:32.2417877+02:00"
* ^publisher = "HL7 International / FHIR Infrastructure"
* ^contact[0].name = "HL7 International / FHIR Infrastructure"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://www.hl7.org/Special/committees/fiwg"
* ^contact[+].name = "Gino Canessa"
* ^contact[=].telecom.system = #email
* ^contact[=].telecom.value = "mailto:gino.canessa@microsoft.com"
* ^jurisdiction = $m49.htm#001 "World"
* . 0..1
* . ^short = "The stratum value, e.g. male"
* . ^definition = "The value for this stratum, expressed as a CodeableConcept. When defining stratifiers on complex values, the value must be rendered such that the value for each stratum within the stratifier is unique."
* . ^comment = "`MeasureReport.group.stratifier.stratum.value` maps to R4 `MeasureReport.group.stratifier.stratum.value`. So is mapped as Equivalent."
* . ^isModifier = false
* url 1..1
* url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.group.stratifier.stratum.value" (exactly)
* value[x] only CodeableConcept or boolean or Quantity or Range or Reference
* value[x] from $measurereport-stratifier-value-example (example)
* value[x] ^short = "The stratum value, e.g. male"
* value[x] ^definition = "The value for this stratum, expressed as a CodeableConcept. When defining stratifiers on complex values, the value must be rendered such that the value for each stratum within the stratifier is unique."
* value[x] ^comment = "`MeasureReport.group.stratifier.stratum.value` maps to R4 `MeasureReport.group.stratifier.stratum.value`. So is mapped as Equivalent."
* value[x] ^base.path = "Extension.value[x]"
* value[x] ^base.min = 0
* value[x] ^base.max = "1"