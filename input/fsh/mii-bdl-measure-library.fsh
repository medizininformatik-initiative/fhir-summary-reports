RuleSet: AddTransactionEntry(resourceType, resource)
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/{resourceType}/{resource}"
* entry[=].resource = {resource}
* entry[=].request.method = #PUT
* entry[=].request.url = "{resourceType}/{resource}"

Instance: mii-bdl-measure-library-transaction-bundle
InstanceOf: Bundle
* type = #transaction
* timestamp = "2025-09-30T17:24:00+02:00"
* insert AddTransactionEntry(Library, mii-lib-stratifier-age-gender)
* insert AddTransactionEntry(Measure, mii-msr-summary-report-age-gender-cql)
* insert AddTransactionEntry(Measure, mii-msr-summary-report-composite-gender-age-cql)