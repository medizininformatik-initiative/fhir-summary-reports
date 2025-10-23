Instance: mii-msr-age-gender-separated-zensus-de-2011
InstanceOf: MeasureReport
Usage: #example
* status = #complete
* type = #summary
* measure = "https://medizininformatik-initiative.de/fhir/Measure/SummaryReportAgeGenderCQL|0.1.0"
* date = "2025-10-22T12:00:00+00:00"
* period.start = "2011"
* period.end = "2011"
* group.population.code = $measure-population#initial-population
* group.population.count = 85719686

* group.stratifier[0].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier[=].stratum[0].value.text = "male"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 41694020
* group.stratifier[=].stratum[+].value.text = "female"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 44025138

* group.stratifier[=].stratum[0].value.text = "0-4"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 3338895
* group.stratifier[=].stratum[+].value.text = "5-9"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 3525830
* group.stratifier[=].stratum[+].value.text = "10-14"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 3940566
* group.stratifier[=].stratum[+].value.text = "15-19"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 4013881
* group.stratifier[=].stratum[+].value.text = "20-24"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 4835639
* group.stratifier[=].stratum[+].value.text = "25-29"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 4872533
* group.stratifier[=].stratum[+].value.text = "30-34"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 4751909
* group.stratifier[=].stratum[+].value.text = "34-39"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 4742891
* group.stratifier[=].stratum[+].value.text = "40-44"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 6351192
* group.stratifier[=].stratum[+].value.text = "45-49"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 6999679
* group.stratifier[=].stratum[+].value.text = "50-54"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 6206294
* group.stratifier[=].stratum[+].value.text = "55-59"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 5419449
* group.stratifier[=].stratum[+].value.text = "60-64"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 4702815
* group.stratifier[=].stratum[+].value.text = "65-69"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 4173352
* group.stratifier[=].stratum[+].value.text = "70-74"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 4861239
* group.stratifier[=].stratum[+].value.text = "75-79"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 3270284
* group.stratifier[=].stratum[+].value.text = "80-84"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 2328083
* group.stratifier[=].stratum[+].value.text = "85-89"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 1335076
* group.stratifier[=].stratum[+].value.text = "90+"
* group.stratifier[=].stratum[=].population.code = $measure-population#initial-population
* group.stratifier[=].stratum[=].population.count = 550089



