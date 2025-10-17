

Instance: mii-msrpt-summary-report-zensus-2022
InstanceOf: MeasureReport
Usage: #example
* status = #complete
* type = #summary
* measure = "https://medizininformatik-initiative.de/fhir/Measure/SummaryReportCompositeAgeGenderCQL"
* date = "2025-10-16"
* period.start = "2022"
* period.end = "2022"
* group.population.code = $measure-population#initial-population
* group.population.count = 82719518
// Age group 0-4, Male
* group.stratifier.stratum[0].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "0-4"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 1987683
// Age group 0-4, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "0-4"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 1890251
// Age group 5-9, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "5-9"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 1988215
// Age group 5-9, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "5-9"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 1892512
// Age group 10-14, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "10-14"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 1937288
// Age group 10-14, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "10-14"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 1840217
// Age group 15-19, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "15-19"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 1952159
// Age group 15-19, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "15-19"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 1850504
// Age group 20-24, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "20-24"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 2279369
// Age group 20-24, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "20-24"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 2120264
// Age group 25-29, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "25-29"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 2462150
// Age group 25-29, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "25-29"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 2296544
// Age group 30-34, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "30-34"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 2799966
// Age group 30-34, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "30-34"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 2670725
// Age group 35-39, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "35-39"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 2724799
// Age group 35-39, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "35-39"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 2660018
// Age group 40-44, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "40-44"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 2600204
// Age group 40-44, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "40-44"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 2590255
// Age group 45-49, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "45-49"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 2407595
// Age group 45-49, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "45-49"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 2402447
// Age group 50-54, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "50-54"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 3078434
// Age group 50-54, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "50-54"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 3052753
// Age group 55-59, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "55-59"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 3403909
// Age group 55-59, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "55-59"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 3391338
// Age group 60-64, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "60-64"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 2973862
// Age group 60-64, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "60-64"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 3075856
// Age group 65-69, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "65-69"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 2403223
// Age group 65-69, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "65-69"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 2606851
// Age group 70-74, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "70-74"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 1965144
// Age group 70-74, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "70-74"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 2251558
// Age group 75-79, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "75-79"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 1397042
// Age group 75-79, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "75-79"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 1725208
// Age group 80-84, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "80-84"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 1410180
// Age group 80-84, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "80-84"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 1985426
// Age group 85-89, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "85-89"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 666342
// Age group 85-89, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "85-89"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 1137755
// Age group 90-94, Male
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "90-94"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "male"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 236467
// Age group 90-94, Female
* group.stratifier.stratum[+].component[0].code = $loinc#46251-5 "Age group"
* group.stratifier.stratum[=].component[=].value.text = "90-94"
* group.stratifier.stratum[=].component[+].code = $loinc#99502-7 "Recorded sex or gender"
* group.stratifier.stratum[=].component[=].value.text = "female"
* group.stratifier.stratum[=].population.code = $measure-population#initial-population
* group.stratifier.stratum[=].population.count = 605005