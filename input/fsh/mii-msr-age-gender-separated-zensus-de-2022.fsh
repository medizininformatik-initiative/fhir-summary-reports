Instance: mii-msr-age-gender-separated-zensus-de-2022
InstanceOf: MeasureReport
Usage: #example
* status = #complete
* type = #summary
* measure = "https://medizininformatik-initiative.de/fhir/Measure/SummaryReportAgeGenderCQL|0.1.0"
* date = "2025-10-22T12:00:00+00:00"
* period.start = "2022"
* period.end = "2022"
* group.population.code = $measure-population#initial-population
* group.population.count = 88212740

* group.stratifier[0].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier[=].stratum[0].value.text = "male"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 42755931
* group.stratifier[=].stratum[+].value.text = "female"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 45456433

* group.stratifier[=].stratum[0].value.text = "0-4"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 3877937
* group.stratifier[=].stratum[+].value.text = "5-9"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 3880730
* group.stratifier[=].stratum[+].value.text = "10-14"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 3777504
* group.stratifier[=].stratum[+].value.text = "15-19"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 3802662
* group.stratifier[=].stratum[+].value.text = "20-24"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 4399638
* group.stratifier[=].stratum[+].value.text = "25-29"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 4758696
* group.stratifier[=].stratum[+].value.text = "30-34"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 5470694
* group.stratifier[=].stratum[+].value.text = "34-39"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 5384817
* group.stratifier[=].stratum[+].value.text = "40-44"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 5190461
* group.stratifier[=].stratum[+].value.text = "45-49"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 4810038
* group.stratifier[=].stratum[+].value.text = "50-54"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 6131189
* group.stratifier[=].stratum[+].value.text = "55-59"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 6795249
* group.stratifier[=].stratum[+].value.text = "60-64"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 6049720
* group.stratifier[=].stratum[+].value.text = "65-69"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 5010077
* group.stratifier[=].stratum[+].value.text = "70-74"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 4216705
* group.stratifier[=].stratum[+].value.text = "75-79"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 3122252
* group.stratifier[=].stratum[+].value.text = "80-84"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 3395607
* group.stratifier[=].stratum[+].value.text = "85-89"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 1804095
* group.stratifier[=].stratum[+].value.text = "90+"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 841469



