Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm

Extension: ext_R5_MeasureReport_gr_po_linkId
Id: ext-R5-MeasureReport.gr.po.linkId
Title: "Cross-version Extension for R5.MeasureReport.group.population.linkId for use in FHIR R4"
Description: "This cross-version extension represents MeasureReport.group.population.linkId from http://hl7.org/fhir/StructureDefinition/MeasureReport|5.0.0 for use in FHIR R4."
Context: MeasureReport.group.population
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #fhir
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[=].valueCode.extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-conformance-derivedFrom"
* ^extension[=].valueCode.extension.valueCanonical = "http://hl7.org/fhir/uv/xver/ImplementationGuide/hl7.fhir.uv.xver"
* ^url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.group.population.linkId"
* ^version = "0.0.1-ballot"
* ^status = #draft
* ^experimental = false
* ^date = "2025-06-04T02:16:32.2368558+02:00"
* ^publisher = "HL7 International / FHIR Infrastructure"
* ^contact[0].name = "HL7 International / FHIR Infrastructure"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://www.hl7.org/Special/committees/fiwg"
* ^contact[+].name = "Gino Canessa"
* ^contact[=].telecom.system = #email
* ^contact[=].telecom.value = "mailto:gino.canessa@microsoft.com"
* ^jurisdiction = $m49.htm#001 "World"
* . 0..1
* . ^short = "Pointer to specific population from Measure"
* . ^definition = "The population from the Measure that corresponds to this population in the MeasureReport resource."
* . ^isModifier = false
* url 1..1
* url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.group.population.linkId" (exactly)
* value[x] only string
* value[x] ^short = "Pointer to specific population from Measure"
* value[x] ^definition = "The population from the Measure that corresponds to this population in the MeasureReport resource."
* value[x] ^base.path = "Extension.value[x]"
* value[x] ^base.min = 0
* value[x] ^base.max = "1"