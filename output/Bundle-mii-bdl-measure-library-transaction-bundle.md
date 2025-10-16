# mii-bdl-measure-library-transaction-bundle - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-bdl-measure-library-transaction-bundle**

## Example Bundle: mii-bdl-measure-library-transaction-bundle

Bundle mii-bdl-measure-library-transaction-bundle of type transaction

-------

Entry 1 - fullUrl = https://www.medizininformatik-initiative.de/Library/mii-lib-stratifier-age-gender

Resource Library:

> 

* * **Content:**text/cql: ````library "stratifier-age-gender" using FHIR version '4.0.0' include FHIRHelpers version '4.0.0' context Patient define InInitialPopulation: true define BirthYear: year from Patient.birthDate // Calculate the patient's age in years as of today define AgeInYears: AgeInYearsAt(Today()) // Calculate the patient's age in years at a specific date define function AgeInYearsAt(asOf DateTime): if Patient.birthDate is null then null else years between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Calculate the patient's age in months define AgeInMonths: AgeInMonthsAt(Today()) // Calculate the patient's age in months at a specific date define function AgeInMonthsAt(asOf DateTime): if Patient.birthDate is null then null else months between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Calculate the patient's age in days define AgeInDays: AgeInDaysAt(Today()) // Calculate the patient's age in days at a specific date define function AgeInDaysAt(asOf DateTime): if Patient.birthDate is null then null else days between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Alternative age calculation using date arithmetic define AgeInYearsSimple: if Patient.birthDate is null then null else year from Today() - year from FHIRHelpers.ToDate(Patient.birthDate) // Age stratification examples define AgeGroup: case when AgeInYears is null then null when AgeInYears < 18 then 'Pediatric' when AgeInYears >= 18 and AgeInYears < 65 then 'Adult' when AgeInYears >= 65 then 'Geriatric' else null end define AgeDecade: case when AgeInYears is null then null when AgeInYears < 10 then '0-9' when AgeInYears >= 10 and AgeInYears < 20 then '10-19' when AgeInYears >= 20 and AgeInYears < 30 then '20-29' when AgeInYears >= 30 and AgeInYears < 40 then '30-39' when AgeInYears >= 40 and AgeInYears < 50 then '40-49' when AgeInYears >= 50 and AgeInYears < 60 then '50-59' when AgeInYears >= 60 and AgeInYears < 70 then '60-69' when AgeInYears >= 70 and AgeInYears < 80 then '70-79' when AgeInYears >= 80 and AgeInYears < 90 then '80-89' when AgeInYears >= 90 then '90+' else null end // 5-year age groups matching German census data structure define AgeFiveYearGroups: case when AgeInYears is null then null when AgeInYears >= 0 and AgeInYears < 5 then '0-4' when AgeInYears >= 5 and AgeInYears < 10 then '5-9' when AgeInYears >= 10 and AgeInYears < 15 then '10-14' when AgeInYears >= 15 and AgeInYears < 20 then '15-19' when AgeInYears >= 20 and AgeInYears < 25 then '20-24' when AgeInYears >= 25 and AgeInYears < 30 then '25-29' when AgeInYears >= 30 and AgeInYears < 35 then '30-34' when AgeInYears >= 35 and AgeInYears < 40 then '35-39' when AgeInYears >= 40 and AgeInYears < 45 then '40-44' when AgeInYears >= 45 and AgeInYears < 50 then '45-49' when AgeInYears >= 50 and AgeInYears < 55 then '50-54' when AgeInYears >= 55 and AgeInYears < 60 then '55-59' when AgeInYears >= 60 and AgeInYears < 65 then '60-64' when AgeInYears >= 65 and AgeInYears < 70 then '65-69' when AgeInYears >= 70 and AgeInYears < 75 then '70-74' when AgeInYears >= 75 and AgeInYears < 80 then '75-79' when AgeInYears >= 80 and AgeInYears < 85 then '80-84' when AgeInYears >= 85 and AgeInYears < 90 then '85-89' when AgeInYears >= 90 and AgeInYears < 95 then '90-94' when AgeInYears >= 95 then '95+' else null end // Alternative shorter expression using mathematical approach define AgeFiveYearGroupsMath: case when AgeInYears is null then null when AgeInYears >= 95 then '95+' else ToString((AgeInYears div 5) * 5) + '-' + ToString(((AgeInYears div 5) * 5) + 4) end // Check if patient is an adult (18 or older) define IsAdult: AgeInYears >= 18 // Check if patient is a minor (under 18) define IsMinor: AgeInYears < 18 // Check if patient is elderly (65 or older) define IsElderly: AgeInYears >= 65 // Gender for stratification define Gender: Patient.gender````: **Id:**
  * ?: mii-lib-stratifier-age-gender
* * **Content:**text/cql: ````library "stratifier-age-gender" using FHIR version '4.0.0' include FHIRHelpers version '4.0.0' context Patient define InInitialPopulation: true define BirthYear: year from Patient.birthDate // Calculate the patient's age in years as of today define AgeInYears: AgeInYearsAt(Today()) // Calculate the patient's age in years at a specific date define function AgeInYearsAt(asOf DateTime): if Patient.birthDate is null then null else years between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Calculate the patient's age in months define AgeInMonths: AgeInMonthsAt(Today()) // Calculate the patient's age in months at a specific date define function AgeInMonthsAt(asOf DateTime): if Patient.birthDate is null then null else months between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Calculate the patient's age in days define AgeInDays: AgeInDaysAt(Today()) // Calculate the patient's age in days at a specific date define function AgeInDaysAt(asOf DateTime): if Patient.birthDate is null then null else days between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Alternative age calculation using date arithmetic define AgeInYearsSimple: if Patient.birthDate is null then null else year from Today() - year from FHIRHelpers.ToDate(Patient.birthDate) // Age stratification examples define AgeGroup: case when AgeInYears is null then null when AgeInYears < 18 then 'Pediatric' when AgeInYears >= 18 and AgeInYears < 65 then 'Adult' when AgeInYears >= 65 then 'Geriatric' else null end define AgeDecade: case when AgeInYears is null then null when AgeInYears < 10 then '0-9' when AgeInYears >= 10 and AgeInYears < 20 then '10-19' when AgeInYears >= 20 and AgeInYears < 30 then '20-29' when AgeInYears >= 30 and AgeInYears < 40 then '30-39' when AgeInYears >= 40 and AgeInYears < 50 then '40-49' when AgeInYears >= 50 and AgeInYears < 60 then '50-59' when AgeInYears >= 60 and AgeInYears < 70 then '60-69' when AgeInYears >= 70 and AgeInYears < 80 then '70-79' when AgeInYears >= 80 and AgeInYears < 90 then '80-89' when AgeInYears >= 90 then '90+' else null end // 5-year age groups matching German census data structure define AgeFiveYearGroups: case when AgeInYears is null then null when AgeInYears >= 0 and AgeInYears < 5 then '0-4' when AgeInYears >= 5 and AgeInYears < 10 then '5-9' when AgeInYears >= 10 and AgeInYears < 15 then '10-14' when AgeInYears >= 15 and AgeInYears < 20 then '15-19' when AgeInYears >= 20 and AgeInYears < 25 then '20-24' when AgeInYears >= 25 and AgeInYears < 30 then '25-29' when AgeInYears >= 30 and AgeInYears < 35 then '30-34' when AgeInYears >= 35 and AgeInYears < 40 then '35-39' when AgeInYears >= 40 and AgeInYears < 45 then '40-44' when AgeInYears >= 45 and AgeInYears < 50 then '45-49' when AgeInYears >= 50 and AgeInYears < 55 then '50-54' when AgeInYears >= 55 and AgeInYears < 60 then '55-59' when AgeInYears >= 60 and AgeInYears < 65 then '60-64' when AgeInYears >= 65 and AgeInYears < 70 then '65-69' when AgeInYears >= 70 and AgeInYears < 75 then '70-74' when AgeInYears >= 75 and AgeInYears < 80 then '75-79' when AgeInYears >= 80 and AgeInYears < 85 then '80-84' when AgeInYears >= 85 and AgeInYears < 90 then '85-89' when AgeInYears >= 90 and AgeInYears < 95 then '90-94' when AgeInYears >= 95 then '95+' else null end // Alternative shorter expression using mathematical approach define AgeFiveYearGroupsMath: case when AgeInYears is null then null when AgeInYears >= 95 then '95+' else ToString((AgeInYears div 5) * 5) + '-' + ToString(((AgeInYears div 5) * 5) + 4) end // Check if patient is an adult (18 or older) define IsAdult: AgeInYears >= 18 // Check if patient is a minor (under 18) define IsMinor: AgeInYears < 18 // Check if patient is elderly (65 or older) define IsElderly: AgeInYears >= 65 // Gender for stratification define Gender: Patient.gender````: **Version:**
  * ?: 1.0.0
* * **Content:**text/cql: ````library "stratifier-age-gender" using FHIR version '4.0.0' include FHIRHelpers version '4.0.0' context Patient define InInitialPopulation: true define BirthYear: year from Patient.birthDate // Calculate the patient's age in years as of today define AgeInYears: AgeInYearsAt(Today()) // Calculate the patient's age in years at a specific date define function AgeInYearsAt(asOf DateTime): if Patient.birthDate is null then null else years between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Calculate the patient's age in months define AgeInMonths: AgeInMonthsAt(Today()) // Calculate the patient's age in months at a specific date define function AgeInMonthsAt(asOf DateTime): if Patient.birthDate is null then null else months between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Calculate the patient's age in days define AgeInDays: AgeInDaysAt(Today()) // Calculate the patient's age in days at a specific date define function AgeInDaysAt(asOf DateTime): if Patient.birthDate is null then null else days between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Alternative age calculation using date arithmetic define AgeInYearsSimple: if Patient.birthDate is null then null else year from Today() - year from FHIRHelpers.ToDate(Patient.birthDate) // Age stratification examples define AgeGroup: case when AgeInYears is null then null when AgeInYears < 18 then 'Pediatric' when AgeInYears >= 18 and AgeInYears < 65 then 'Adult' when AgeInYears >= 65 then 'Geriatric' else null end define AgeDecade: case when AgeInYears is null then null when AgeInYears < 10 then '0-9' when AgeInYears >= 10 and AgeInYears < 20 then '10-19' when AgeInYears >= 20 and AgeInYears < 30 then '20-29' when AgeInYears >= 30 and AgeInYears < 40 then '30-39' when AgeInYears >= 40 and AgeInYears < 50 then '40-49' when AgeInYears >= 50 and AgeInYears < 60 then '50-59' when AgeInYears >= 60 and AgeInYears < 70 then '60-69' when AgeInYears >= 70 and AgeInYears < 80 then '70-79' when AgeInYears >= 80 and AgeInYears < 90 then '80-89' when AgeInYears >= 90 then '90+' else null end // 5-year age groups matching German census data structure define AgeFiveYearGroups: case when AgeInYears is null then null when AgeInYears >= 0 and AgeInYears < 5 then '0-4' when AgeInYears >= 5 and AgeInYears < 10 then '5-9' when AgeInYears >= 10 and AgeInYears < 15 then '10-14' when AgeInYears >= 15 and AgeInYears < 20 then '15-19' when AgeInYears >= 20 and AgeInYears < 25 then '20-24' when AgeInYears >= 25 and AgeInYears < 30 then '25-29' when AgeInYears >= 30 and AgeInYears < 35 then '30-34' when AgeInYears >= 35 and AgeInYears < 40 then '35-39' when AgeInYears >= 40 and AgeInYears < 45 then '40-44' when AgeInYears >= 45 and AgeInYears < 50 then '45-49' when AgeInYears >= 50 and AgeInYears < 55 then '50-54' when AgeInYears >= 55 and AgeInYears < 60 then '55-59' when AgeInYears >= 60 and AgeInYears < 65 then '60-64' when AgeInYears >= 65 and AgeInYears < 70 then '65-69' when AgeInYears >= 70 and AgeInYears < 75 then '70-74' when AgeInYears >= 75 and AgeInYears < 80 then '75-79' when AgeInYears >= 80 and AgeInYears < 85 then '80-84' when AgeInYears >= 85 and AgeInYears < 90 then '85-89' when AgeInYears >= 90 and AgeInYears < 95 then '90-94' when AgeInYears >= 95 then '95+' else null end // Alternative shorter expression using mathematical approach define AgeFiveYearGroupsMath: case when AgeInYears is null then null when AgeInYears >= 95 then '95+' else ToString((AgeInYears div 5) * 5) + '-' + ToString(((AgeInYears div 5) * 5) + 4) end // Check if patient is an adult (18 or older) define IsAdult: AgeInYears >= 18 // Check if patient is a minor (under 18) define IsMinor: AgeInYears < 18 // Check if patient is elderly (65 or older) define IsElderly: AgeInYears >= 65 // Gender for stratification define Gender: Patient.gender````: **Url:**
  * ?: [Patient Age and Gender Stratification Library](Library-mii-lib-stratifier-age-gender.md)
* * **Content:**text/cql: ````library "stratifier-age-gender" using FHIR version '4.0.0' include FHIRHelpers version '4.0.0' context Patient define InInitialPopulation: true define BirthYear: year from Patient.birthDate // Calculate the patient's age in years as of today define AgeInYears: AgeInYearsAt(Today()) // Calculate the patient's age in years at a specific date define function AgeInYearsAt(asOf DateTime): if Patient.birthDate is null then null else years between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Calculate the patient's age in months define AgeInMonths: AgeInMonthsAt(Today()) // Calculate the patient's age in months at a specific date define function AgeInMonthsAt(asOf DateTime): if Patient.birthDate is null then null else months between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Calculate the patient's age in days define AgeInDays: AgeInDaysAt(Today()) // Calculate the patient's age in days at a specific date define function AgeInDaysAt(asOf DateTime): if Patient.birthDate is null then null else days between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Alternative age calculation using date arithmetic define AgeInYearsSimple: if Patient.birthDate is null then null else year from Today() - year from FHIRHelpers.ToDate(Patient.birthDate) // Age stratification examples define AgeGroup: case when AgeInYears is null then null when AgeInYears < 18 then 'Pediatric' when AgeInYears >= 18 and AgeInYears < 65 then 'Adult' when AgeInYears >= 65 then 'Geriatric' else null end define AgeDecade: case when AgeInYears is null then null when AgeInYears < 10 then '0-9' when AgeInYears >= 10 and AgeInYears < 20 then '10-19' when AgeInYears >= 20 and AgeInYears < 30 then '20-29' when AgeInYears >= 30 and AgeInYears < 40 then '30-39' when AgeInYears >= 40 and AgeInYears < 50 then '40-49' when AgeInYears >= 50 and AgeInYears < 60 then '50-59' when AgeInYears >= 60 and AgeInYears < 70 then '60-69' when AgeInYears >= 70 and AgeInYears < 80 then '70-79' when AgeInYears >= 80 and AgeInYears < 90 then '80-89' when AgeInYears >= 90 then '90+' else null end // 5-year age groups matching German census data structure define AgeFiveYearGroups: case when AgeInYears is null then null when AgeInYears >= 0 and AgeInYears < 5 then '0-4' when AgeInYears >= 5 and AgeInYears < 10 then '5-9' when AgeInYears >= 10 and AgeInYears < 15 then '10-14' when AgeInYears >= 15 and AgeInYears < 20 then '15-19' when AgeInYears >= 20 and AgeInYears < 25 then '20-24' when AgeInYears >= 25 and AgeInYears < 30 then '25-29' when AgeInYears >= 30 and AgeInYears < 35 then '30-34' when AgeInYears >= 35 and AgeInYears < 40 then '35-39' when AgeInYears >= 40 and AgeInYears < 45 then '40-44' when AgeInYears >= 45 and AgeInYears < 50 then '45-49' when AgeInYears >= 50 and AgeInYears < 55 then '50-54' when AgeInYears >= 55 and AgeInYears < 60 then '55-59' when AgeInYears >= 60 and AgeInYears < 65 then '60-64' when AgeInYears >= 65 and AgeInYears < 70 then '65-69' when AgeInYears >= 70 and AgeInYears < 75 then '70-74' when AgeInYears >= 75 and AgeInYears < 80 then '75-79' when AgeInYears >= 80 and AgeInYears < 85 then '80-84' when AgeInYears >= 85 and AgeInYears < 90 then '85-89' when AgeInYears >= 90 and AgeInYears < 95 then '90-94' when AgeInYears >= 95 then '95+' else null end // Alternative shorter expression using mathematical approach define AgeFiveYearGroupsMath: case when AgeInYears is null then null when AgeInYears >= 95 then '95+' else ToString((AgeInYears div 5) * 5) + '-' + ToString(((AgeInYears div 5) * 5) + 4) end // Check if patient is an adult (18 or older) define IsAdult: AgeInYears >= 18 // Check if patient is a minor (under 18) define IsMinor: AgeInYears < 18 // Check if patient is elderly (65 or older) define IsElderly: AgeInYears >= 65 // Gender for stratification define Gender: Patient.gender````: **Date:**
  * ?: 2025-10-16
* * **Content:**text/cql: ````library "stratifier-age-gender" using FHIR version '4.0.0' include FHIRHelpers version '4.0.0' context Patient define InInitialPopulation: true define BirthYear: year from Patient.birthDate // Calculate the patient's age in years as of today define AgeInYears: AgeInYearsAt(Today()) // Calculate the patient's age in years at a specific date define function AgeInYearsAt(asOf DateTime): if Patient.birthDate is null then null else years between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Calculate the patient's age in months define AgeInMonths: AgeInMonthsAt(Today()) // Calculate the patient's age in months at a specific date define function AgeInMonthsAt(asOf DateTime): if Patient.birthDate is null then null else months between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Calculate the patient's age in days define AgeInDays: AgeInDaysAt(Today()) // Calculate the patient's age in days at a specific date define function AgeInDaysAt(asOf DateTime): if Patient.birthDate is null then null else days between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Alternative age calculation using date arithmetic define AgeInYearsSimple: if Patient.birthDate is null then null else year from Today() - year from FHIRHelpers.ToDate(Patient.birthDate) // Age stratification examples define AgeGroup: case when AgeInYears is null then null when AgeInYears < 18 then 'Pediatric' when AgeInYears >= 18 and AgeInYears < 65 then 'Adult' when AgeInYears >= 65 then 'Geriatric' else null end define AgeDecade: case when AgeInYears is null then null when AgeInYears < 10 then '0-9' when AgeInYears >= 10 and AgeInYears < 20 then '10-19' when AgeInYears >= 20 and AgeInYears < 30 then '20-29' when AgeInYears >= 30 and AgeInYears < 40 then '30-39' when AgeInYears >= 40 and AgeInYears < 50 then '40-49' when AgeInYears >= 50 and AgeInYears < 60 then '50-59' when AgeInYears >= 60 and AgeInYears < 70 then '60-69' when AgeInYears >= 70 and AgeInYears < 80 then '70-79' when AgeInYears >= 80 and AgeInYears < 90 then '80-89' when AgeInYears >= 90 then '90+' else null end // 5-year age groups matching German census data structure define AgeFiveYearGroups: case when AgeInYears is null then null when AgeInYears >= 0 and AgeInYears < 5 then '0-4' when AgeInYears >= 5 and AgeInYears < 10 then '5-9' when AgeInYears >= 10 and AgeInYears < 15 then '10-14' when AgeInYears >= 15 and AgeInYears < 20 then '15-19' when AgeInYears >= 20 and AgeInYears < 25 then '20-24' when AgeInYears >= 25 and AgeInYears < 30 then '25-29' when AgeInYears >= 30 and AgeInYears < 35 then '30-34' when AgeInYears >= 35 and AgeInYears < 40 then '35-39' when AgeInYears >= 40 and AgeInYears < 45 then '40-44' when AgeInYears >= 45 and AgeInYears < 50 then '45-49' when AgeInYears >= 50 and AgeInYears < 55 then '50-54' when AgeInYears >= 55 and AgeInYears < 60 then '55-59' when AgeInYears >= 60 and AgeInYears < 65 then '60-64' when AgeInYears >= 65 and AgeInYears < 70 then '65-69' when AgeInYears >= 70 and AgeInYears < 75 then '70-74' when AgeInYears >= 75 and AgeInYears < 80 then '75-79' when AgeInYears >= 80 and AgeInYears < 85 then '80-84' when AgeInYears >= 85 and AgeInYears < 90 then '85-89' when AgeInYears >= 90 and AgeInYears < 95 then '90-94' when AgeInYears >= 95 then '95+' else null end // Alternative shorter expression using mathematical approach define AgeFiveYearGroupsMath: case when AgeInYears is null then null when AgeInYears >= 95 then '95+' else ToString((AgeInYears div 5) * 5) + '-' + ToString(((AgeInYears div 5) * 5) + 4) end // Check if patient is an adult (18 or older) define IsAdult: AgeInYears >= 18 // Check if patient is a minor (under 18) define IsMinor: AgeInYears < 18 // Check if patient is elderly (65 or older) define IsElderly: AgeInYears >= 65 // Gender for stratification define Gender: Patient.gender````: **Publisher:**
  * ?: MII
* * **Content:**text/cql: ````library "stratifier-age-gender" using FHIR version '4.0.0' include FHIRHelpers version '4.0.0' context Patient define InInitialPopulation: true define BirthYear: year from Patient.birthDate // Calculate the patient's age in years as of today define AgeInYears: AgeInYearsAt(Today()) // Calculate the patient's age in years at a specific date define function AgeInYearsAt(asOf DateTime): if Patient.birthDate is null then null else years between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Calculate the patient's age in months define AgeInMonths: AgeInMonthsAt(Today()) // Calculate the patient's age in months at a specific date define function AgeInMonthsAt(asOf DateTime): if Patient.birthDate is null then null else months between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Calculate the patient's age in days define AgeInDays: AgeInDaysAt(Today()) // Calculate the patient's age in days at a specific date define function AgeInDaysAt(asOf DateTime): if Patient.birthDate is null then null else days between FHIRHelpers.ToDate(Patient.birthDate) and asOf // Alternative age calculation using date arithmetic define AgeInYearsSimple: if Patient.birthDate is null then null else year from Today() - year from FHIRHelpers.ToDate(Patient.birthDate) // Age stratification examples define AgeGroup: case when AgeInYears is null then null when AgeInYears < 18 then 'Pediatric' when AgeInYears >= 18 and AgeInYears < 65 then 'Adult' when AgeInYears >= 65 then 'Geriatric' else null end define AgeDecade: case when AgeInYears is null then null when AgeInYears < 10 then '0-9' when AgeInYears >= 10 and AgeInYears < 20 then '10-19' when AgeInYears >= 20 and AgeInYears < 30 then '20-29' when AgeInYears >= 30 and AgeInYears < 40 then '30-39' when AgeInYears >= 40 and AgeInYears < 50 then '40-49' when AgeInYears >= 50 and AgeInYears < 60 then '50-59' when AgeInYears >= 60 and AgeInYears < 70 then '60-69' when AgeInYears >= 70 and AgeInYears < 80 then '70-79' when AgeInYears >= 80 and AgeInYears < 90 then '80-89' when AgeInYears >= 90 then '90+' else null end // 5-year age groups matching German census data structure define AgeFiveYearGroups: case when AgeInYears is null then null when AgeInYears >= 0 and AgeInYears < 5 then '0-4' when AgeInYears >= 5 and AgeInYears < 10 then '5-9' when AgeInYears >= 10 and AgeInYears < 15 then '10-14' when AgeInYears >= 15 and AgeInYears < 20 then '15-19' when AgeInYears >= 20 and AgeInYears < 25 then '20-24' when AgeInYears >= 25 and AgeInYears < 30 then '25-29' when AgeInYears >= 30 and AgeInYears < 35 then '30-34' when AgeInYears >= 35 and AgeInYears < 40 then '35-39' when AgeInYears >= 40 and AgeInYears < 45 then '40-44' when AgeInYears >= 45 and AgeInYears < 50 then '45-49' when AgeInYears >= 50 and AgeInYears < 55 then '50-54' when AgeInYears >= 55 and AgeInYears < 60 then '55-59' when AgeInYears >= 60 and AgeInYears < 65 then '60-64' when AgeInYears >= 65 and AgeInYears < 70 then '65-69' when AgeInYears >= 70 and AgeInYears < 75 then '70-74' when AgeInYears >= 75 and AgeInYears < 80 then '75-79' when AgeInYears >= 80 and AgeInYears < 85 then '80-84' when AgeInYears >= 85 and AgeInYears < 90 then '85-89' when AgeInYears >= 90 and AgeInYears < 95 then '90-94' when AgeInYears >= 95 then '95+' else null end // Alternative shorter expression using mathematical approach define AgeFiveYearGroupsMath: case when AgeInYears is null then null when AgeInYears >= 95 then '95+' else ToString((AgeInYears div 5) * 5) + '-' + ToString(((AgeInYears div 5) * 5) + 4) end // Check if patient is an adult (18 or older) define IsAdult: AgeInYears >= 18 // Check if patient is a minor (under 18) define IsMinor: AgeInYears < 18 // Check if patient is elderly (65 or older) define IsElderly: AgeInYears >= 65 // Gender for stratification define Gender: Patient.gender````: **Description:**
  * ?: CQL library for calculating patient ages and gender-based stratifications


Request:

```
PUT Library/mii-lib-stratifier-age-gender

```

-------

Entry 2 - fullUrl = https://www.medizininformatik-initiative.de/Measure/mii-msr-summary-report-age-gender-cql

Resource Measure:

> 

* Knowledge Artifact Metadata: Name (machine-readable)
  * ?: SummaryReportAgeGenderCQL
* Knowledge Artifact Metadata: Title (human-readable)
  * ?: Summary Report Age Gender CQL
* Knowledge Artifact Metadata: Status
  * ?: Active
* Knowledge Artifact Metadata: Experimental
  * ?: false
* Knowledge Artifact Metadata: Description
  * ?: Summary Report with gender and 5-year age group stratification using CQL matching German census data structure
* Knowledge Artifact Metadata: Measure Steward
  * ?: MII
* Knowledge Artifact Metadata: Measure Metadata
* Knowledge Artifact Metadata: Version Number
  * ?: 1.0
* Knowledge Artifact Metadata: Measure Population Criteria
* Knowledge Artifact Metadata: Summary
  * ?: Patient stratification by gender and 5-year age groups
* Knowledge Artifact Metadata: Initial Population
  * ?: **ID**: initial-population-identifier**Description**: No description provided**Logic Definition**:[InInitialPopulation](#stratifieragegender-ininitialpopulation)
* Knowledge Artifact Metadata: Stratifier
  * ?: **ID**: stratifier-gender**Code**: Recorded sex or gender
* Knowledge Artifact Metadata: Stratifier
  * ?: **ID**: stratifier-age-five-year-groups**Code**: Age group
* Knowledge Artifact Metadata: Measure Logic
* Knowledge Artifact Metadata: Primary Library
  * ?: [Patient Age and Gender Stratification Library](Bundle-mii-bdl-measure-library-transaction-bundle.md)
* Knowledge Artifact Metadata: Generated using version 0.4.6 of the sample-content-ig Liquid templates


Request:

```
PUT Measure/mii-msr-summary-report-age-gender-cql

```

-------

Entry 3 - fullUrl = https://www.medizininformatik-initiative.de/Measure/mii-msr-summary-report-composite-gender-age-cql

Resource Measure:

> 

* Knowledge Artifact Metadata: Name (machine-readable)
  * ?: SummaryReportCompositeAgeGenderCQL
* Knowledge Artifact Metadata: Title (human-readable)
  * ?: Summary Report Composite Age Gender CQL
* Knowledge Artifact Metadata: Status
  * ?: Active
* Knowledge Artifact Metadata: Experimental
  * ?: false
* Knowledge Artifact Metadata: Description
  * ?: Summary Report with gender and age decade stratification using CQL in a composite stratifier
* Knowledge Artifact Metadata: Measure Steward
  * ?: MII
* Knowledge Artifact Metadata: Measure Metadata
* Knowledge Artifact Metadata: Version Number
  * ?: 1.0
* Knowledge Artifact Metadata: Measure Population Criteria
* Knowledge Artifact Metadata: Summary
  * ?: Composite stratification by gender and age decade
* Knowledge Artifact Metadata: Initial Population
  * ?: **ID**: initial-population**Description**: No description provided**Logic Definition**:[InInitialPopulation](#stratifieragegender-ininitialpopulation)
* Knowledge Artifact Metadata: Stratifier
  * ?: 
* Knowledge Artifact Metadata: Measure Logic
* Knowledge Artifact Metadata: Primary Library
  * ?: [Patient Age and Gender Stratification Library](Bundle-mii-bdl-measure-library-transaction-bundle.md)
* Knowledge Artifact Metadata: Generated using version 0.4.6 of the sample-content-ig Liquid templates


Request:

```
PUT Measure/mii-msr-summary-report-composite-gender-age-cql

```



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "mii-bdl-measure-library-transaction-bundle",
  "type" : "transaction",
  "timestamp" : "2025-09-30T17:24:00+02:00",
  "entry" : [
    {
      "fullUrl" : "https://www.medizininformatik-initiative.de/Library/mii-lib-stratifier-age-gender",
      "resource" : {
        "resourceType" : "Library",
        "id" : "mii-lib-stratifier-age-gender",
        "text" : {
          "status" : "extensions",
          "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Library_mii-lib-stratifier-age-gender\"> </a>\n<div>\n    <table class=\"grid dict\">\n        \n        \n        <tr>\n            <th scope=\"row\"><b>Title: </b></th>\n            <td style=\"padding-left: 4px;\">Patient Age and Gender Stratification Library</td>\n        </tr>\n        \n\n        \n        \n        <tr>\n            <th scope=\"row\"><b>Id: </b></th>\n            <td style=\"padding-left: 4px;\">mii-lib-stratifier-age-gender</td>\n        </tr>\n        \n\n        \n        \n        <tr>\n            <th scope=\"row\"><b>Version: </b></th>\n            <td style=\"padding-left: 4px;\">1.0.0</td>\n        </tr>\n        \n\n        \n        <tr>\n            <th scope=\"row\"><b>Url: </b></th>\n            <td style=\"padding-left: 4px;\"><a href=\"Library-mii-lib-stratifier-age-gender.html\">Patient Age and Gender Stratification Library</a></td>\n        </tr>\n        \n\n        \n\n        \n\n        \n\n        \n\n        \n        <tr>\n            <th scope=\"row\"><b>Type: </b></th>\n            <td style=\"padding-left: 4px;\">\n                \n                    \n                        \n                        <p style=\"margin-bottom: 5px;\">\n                            <b>system: </b> <span><a href=\"http://terminology.hl7.org/6.5.0/CodeSystem-library-type.html\">http://terminology.hl7.org/CodeSystem/library-type</a></span>\n                        </p>\n                        \n                        \n                        <p style=\"margin-bottom: 5px;\">\n                            <b>code: </b> <span>logic-library</span>\n                        </p>\n                        \n                        \n                    \n                \n                \n            </td>\n        </tr>\n        \n\n        \n\n        \n        <tr>\n            <th scope=\"row\"><b>Date: </b></th>\n            <td style=\"padding-left: 4px;\">2025-10-16</td>\n        </tr>\n        \n\n        \n        <tr>\n            <th scope=\"row\"><b>Publisher: </b></th>\n            <td style=\"padding-left: 4px;\">MII</td>\n        </tr>\n        \n\n        \n        <tr>\n            <th scope=\"row\"><b>Description: </b></th>\n            <td style=\"padding-left: 4px;\"><div><p>CQL library for calculating patient ages and gender-based stratifications</p>\n</div></td>\n        </tr>\n        \n\n        \n\n        \n\n        \n\n        \n\n        \n\n        \n\n        \n\n        \n\n        \n\n        \n\n        \n\n        \n        <tr>\n          <th scope=\"row\"><b>Parameters: </b></th>\n          <td style=\"padding-left: 4px;\">\n            <table class=\"grid-dict\">\n              <tr><th><b>Name</b></th><th><b>Type</b></th><th><b>Min</b></th><th><b>Max</b></th><th><b>In/Out</b></th></tr>\n              \n                <tr><th>Measurement Period</th><th>Period</th><th>0</th><th>1</th><th>In</th></tr>\n              \n            </table>\n          </td>\n        </tr>\n        \n\n        \n        <tr>\n          <th scope=\"row\"><b>Data Requirements:</b></th>\n          <td style=\"padding-left: 4px;\">\n            <table class=\"grid-dict\">\n              <tr><th><b>Type</b></th><th><b>Profile</b></th><th><b>MS</b></th><th><b>Code Filter</b></th></tr>\n              \n                <tr>\n                  <th>Patient</th>\n                  <th>http://hl7.org/fhir/StructureDefinition/Patient</th>\n                  <th/>\n                  <th>\n                    \n                  </th>\n                </tr>\n              \n            </table>\n          </td>\n        </tr>\n        \n\n        \n        \n        <tr>\n          <td colspan=\"2\">\n            <table>\n              <tr><th><a id=\"cql-content\"><b>Content: </b></a> text/cql</th></tr>\n              <tr><td><pre><code class=\"language-cql\">library &quot;stratifier-age-gender&quot;\nusing FHIR version '4.0.0'\ninclude FHIRHelpers version '4.0.0'\n\ncontext Patient\n\ndefine InInitialPopulation:\n  true\n\ndefine BirthYear:\n  year from Patient.birthDate\n\n// Calculate the patient's age in years as of today\ndefine AgeInYears:\n  AgeInYearsAt(Today())\n\n// Calculate the patient's age in years at a specific date\ndefine function AgeInYearsAt(asOf DateTime):\n  if Patient.birthDate is null then null\n  else years between FHIRHelpers.ToDate(Patient.birthDate) and asOf\n\n// Calculate the patient's age in months\ndefine AgeInMonths:\n  AgeInMonthsAt(Today())\n\n// Calculate the patient's age in months at a specific date  \ndefine function AgeInMonthsAt(asOf DateTime):\n  if Patient.birthDate is null then null\n  else months between FHIRHelpers.ToDate(Patient.birthDate) and asOf\n\n// Calculate the patient's age in days\ndefine AgeInDays:\n  AgeInDaysAt(Today())\n\n// Calculate the patient's age in days at a specific date\ndefine function AgeInDaysAt(asOf DateTime):\n  if Patient.birthDate is null then null\n  else days between FHIRHelpers.ToDate(Patient.birthDate) and asOf\n\n// Alternative age calculation using date arithmetic\ndefine AgeInYearsSimple:\n  if Patient.birthDate is null then null\n  else year from Today() - year from FHIRHelpers.ToDate(Patient.birthDate)\n\n// Age stratification examples\ndefine AgeGroup:\n  case\n    when AgeInYears is null then null\n    when AgeInYears &lt; 18 then 'Pediatric'\n    when AgeInYears &gt;= 18 and AgeInYears &lt; 65 then 'Adult'\n    when AgeInYears &gt;= 65 then 'Geriatric'\n    else null\n  end\n\ndefine AgeDecade:\n  case\n    when AgeInYears is null then null\n    when AgeInYears &lt; 10 then '0-9'\n    when AgeInYears &gt;= 10 and AgeInYears &lt; 20 then '10-19'\n    when AgeInYears &gt;= 20 and AgeInYears &lt; 30 then '20-29'\n    when AgeInYears &gt;= 30 and AgeInYears &lt; 40 then '30-39'\n    when AgeInYears &gt;= 40 and AgeInYears &lt; 50 then '40-49'\n    when AgeInYears &gt;= 50 and AgeInYears &lt; 60 then '50-59'\n    when AgeInYears &gt;= 60 and AgeInYears &lt; 70 then '60-69'\n    when AgeInYears &gt;= 70 and AgeInYears &lt; 80 then '70-79'\n    when AgeInYears &gt;= 80 and AgeInYears &lt; 90 then '80-89'\n    when AgeInYears &gt;= 90 then '90+'\n    else null\n  end\n\n// 5-year age groups matching German census data structure\ndefine AgeFiveYearGroups:\n  case\n    when AgeInYears is null then null\n    when AgeInYears &gt;= 0 and AgeInYears &lt; 5 then '0-4'\n    when AgeInYears &gt;= 5 and AgeInYears &lt; 10 then '5-9'\n    when AgeInYears &gt;= 10 and AgeInYears &lt; 15 then '10-14'\n    when AgeInYears &gt;= 15 and AgeInYears &lt; 20 then '15-19'\n    when AgeInYears &gt;= 20 and AgeInYears &lt; 25 then '20-24'\n    when AgeInYears &gt;= 25 and AgeInYears &lt; 30 then '25-29'\n    when AgeInYears &gt;= 30 and AgeInYears &lt; 35 then '30-34'\n    when AgeInYears &gt;= 35 and AgeInYears &lt; 40 then '35-39'\n    when AgeInYears &gt;= 40 and AgeInYears &lt; 45 then '40-44'\n    when AgeInYears &gt;= 45 and AgeInYears &lt; 50 then '45-49'\n    when AgeInYears &gt;= 50 and AgeInYears &lt; 55 then '50-54'\n    when AgeInYears &gt;= 55 and AgeInYears &lt; 60 then '55-59'\n    when AgeInYears &gt;= 60 and AgeInYears &lt; 65 then '60-64'\n    when AgeInYears &gt;= 65 and AgeInYears &lt; 70 then '65-69'\n    when AgeInYears &gt;= 70 and AgeInYears &lt; 75 then '70-74'\n    when AgeInYears &gt;= 75 and AgeInYears &lt; 80 then '75-79'\n    when AgeInYears &gt;= 80 and AgeInYears &lt; 85 then '80-84'\n    when AgeInYears &gt;= 85 and AgeInYears &lt; 90 then '85-89'\n    when AgeInYears &gt;= 90 and AgeInYears &lt; 95 then '90-94'\n    when AgeInYears &gt;= 95 then '95+'\n    else null\n  end\n\n// Alternative shorter expression using mathematical approach\ndefine AgeFiveYearGroupsMath:\n  case\n    when AgeInYears is null then null\n    when AgeInYears &gt;= 95 then '95+'\n    else ToString((AgeInYears div 5) * 5) + '-' + ToString(((AgeInYears div 5) * 5) + 4)\n  end\n\n// Check if patient is an adult (18 or older)\ndefine IsAdult:\n  AgeInYears &gt;= 18\n\n// Check if patient is a minor (under 18)\ndefine IsMinor:\n  AgeInYears &lt; 18\n\n// Check if patient is elderly (65 or older)\ndefine IsElderly:\n  AgeInYears &gt;= 65\n\n// Gender for stratification\ndefine Gender:\n  Patient.gender\n</code></pre></td></tr>\n            </table>\n          </td>\n        </tr>\n        \n        \n        \n    </table>\n</div>\n</div>"
        },
        "url" : "https://www.medizininformatik-initiative.de/fhir/Library/StratifierAgeGender",
        "version" : "1.0.0",
        "name" : "StratifierAgeGender",
        "title" : "Patient Age and Gender Stratification Library",
        "status" : "active",
        "experimental" : false,
        "type" : {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/library-type",
              "code" : "logic-library"
            }
          ]
        },
        "date" : "2025-10-16",
        "publisher" : "MII",
        "description" : "CQL library for calculating patient ages and gender-based stratifications",
        "parameter" : [
          {
            "name" : "Measurement Period",
            "use" : "in",
            "min" : 0,
            "max" : "1",
            "type" : "Period"
          }
        ],
        "dataRequirement" : [
          {
            "type" : "Patient",
            "profile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
          }
        ],
        "content" : [
          {
            "contentType" : "text/cql",
            "data" : "bGlicmFyeSAic3RyYXRpZmllci1hZ2UtZ2VuZGVyIgp1c2luZyBGSElSIHZlcnNpb24gJzQuMC4wJwppbmNsdWRlIEZISVJIZWxwZXJzIHZlcnNpb24gJzQuMC4wJwoKY29udGV4dCBQYXRpZW50CgpkZWZpbmUgSW5Jbml0aWFsUG9wdWxhdGlvbjoKICB0cnVlCgpkZWZpbmUgQmlydGhZZWFyOgogIHllYXIgZnJvbSBQYXRpZW50LmJpcnRoRGF0ZQoKLy8gQ2FsY3VsYXRlIHRoZSBwYXRpZW50J3MgYWdlIGluIHllYXJzIGFzIG9mIHRvZGF5CmRlZmluZSBBZ2VJblllYXJzOgogIEFnZUluWWVhcnNBdChUb2RheSgpKQoKLy8gQ2FsY3VsYXRlIHRoZSBwYXRpZW50J3MgYWdlIGluIHllYXJzIGF0IGEgc3BlY2lmaWMgZGF0ZQpkZWZpbmUgZnVuY3Rpb24gQWdlSW5ZZWFyc0F0KGFzT2YgRGF0ZVRpbWUpOgogIGlmIFBhdGllbnQuYmlydGhEYXRlIGlzIG51bGwgdGhlbiBudWxsCiAgZWxzZSB5ZWFycyBiZXR3ZWVuIEZISVJIZWxwZXJzLlRvRGF0ZShQYXRpZW50LmJpcnRoRGF0ZSkgYW5kIGFzT2YKCi8vIENhbGN1bGF0ZSB0aGUgcGF0aWVudCdzIGFnZSBpbiBtb250aHMKZGVmaW5lIEFnZUluTW9udGhzOgogIEFnZUluTW9udGhzQXQoVG9kYXkoKSkKCi8vIENhbGN1bGF0ZSB0aGUgcGF0aWVudCdzIGFnZSBpbiBtb250aHMgYXQgYSBzcGVjaWZpYyBkYXRlICAKZGVmaW5lIGZ1bmN0aW9uIEFnZUluTW9udGhzQXQoYXNPZiBEYXRlVGltZSk6CiAgaWYgUGF0aWVudC5iaXJ0aERhdGUgaXMgbnVsbCB0aGVuIG51bGwKICBlbHNlIG1vbnRocyBiZXR3ZWVuIEZISVJIZWxwZXJzLlRvRGF0ZShQYXRpZW50LmJpcnRoRGF0ZSkgYW5kIGFzT2YKCi8vIENhbGN1bGF0ZSB0aGUgcGF0aWVudCdzIGFnZSBpbiBkYXlzCmRlZmluZSBBZ2VJbkRheXM6CiAgQWdlSW5EYXlzQXQoVG9kYXkoKSkKCi8vIENhbGN1bGF0ZSB0aGUgcGF0aWVudCdzIGFnZSBpbiBkYXlzIGF0IGEgc3BlY2lmaWMgZGF0ZQpkZWZpbmUgZnVuY3Rpb24gQWdlSW5EYXlzQXQoYXNPZiBEYXRlVGltZSk6CiAgaWYgUGF0aWVudC5iaXJ0aERhdGUgaXMgbnVsbCB0aGVuIG51bGwKICBlbHNlIGRheXMgYmV0d2VlbiBGSElSSGVscGVycy5Ub0RhdGUoUGF0aWVudC5iaXJ0aERhdGUpIGFuZCBhc09mCgovLyBBbHRlcm5hdGl2ZSBhZ2UgY2FsY3VsYXRpb24gdXNpbmcgZGF0ZSBhcml0aG1ldGljCmRlZmluZSBBZ2VJblllYXJzU2ltcGxlOgogIGlmIFBhdGllbnQuYmlydGhEYXRlIGlzIG51bGwgdGhlbiBudWxsCiAgZWxzZSB5ZWFyIGZyb20gVG9kYXkoKSAtIHllYXIgZnJvbSBGSElSSGVscGVycy5Ub0RhdGUoUGF0aWVudC5iaXJ0aERhdGUpCgovLyBBZ2Ugc3RyYXRpZmljYXRpb24gZXhhbXBsZXMKZGVmaW5lIEFnZUdyb3VwOgogIGNhc2UKICAgIHdoZW4gQWdlSW5ZZWFycyBpcyBudWxsIHRoZW4gbnVsbAogICAgd2hlbiBBZ2VJblllYXJzIDwgMTggdGhlbiAnUGVkaWF0cmljJwogICAgd2hlbiBBZ2VJblllYXJzID49IDE4IGFuZCBBZ2VJblllYXJzIDwgNjUgdGhlbiAnQWR1bHQnCiAgICB3aGVuIEFnZUluWWVhcnMgPj0gNjUgdGhlbiAnR2VyaWF0cmljJwogICAgZWxzZSBudWxsCiAgZW5kCgpkZWZpbmUgQWdlRGVjYWRlOgogIGNhc2UKICAgIHdoZW4gQWdlSW5ZZWFycyBpcyBudWxsIHRoZW4gbnVsbAogICAgd2hlbiBBZ2VJblllYXJzIDwgMTAgdGhlbiAnMC05JwogICAgd2hlbiBBZ2VJblllYXJzID49IDEwIGFuZCBBZ2VJblllYXJzIDwgMjAgdGhlbiAnMTAtMTknCiAgICB3aGVuIEFnZUluWWVhcnMgPj0gMjAgYW5kIEFnZUluWWVhcnMgPCAzMCB0aGVuICcyMC0yOScKICAgIHdoZW4gQWdlSW5ZZWFycyA+PSAzMCBhbmQgQWdlSW5ZZWFycyA8IDQwIHRoZW4gJzMwLTM5JwogICAgd2hlbiBBZ2VJblllYXJzID49IDQwIGFuZCBBZ2VJblllYXJzIDwgNTAgdGhlbiAnNDAtNDknCiAgICB3aGVuIEFnZUluWWVhcnMgPj0gNTAgYW5kIEFnZUluWWVhcnMgPCA2MCB0aGVuICc1MC01OScKICAgIHdoZW4gQWdlSW5ZZWFycyA+PSA2MCBhbmQgQWdlSW5ZZWFycyA8IDcwIHRoZW4gJzYwLTY5JwogICAgd2hlbiBBZ2VJblllYXJzID49IDcwIGFuZCBBZ2VJblllYXJzIDwgODAgdGhlbiAnNzAtNzknCiAgICB3aGVuIEFnZUluWWVhcnMgPj0gODAgYW5kIEFnZUluWWVhcnMgPCA5MCB0aGVuICc4MC04OScKICAgIHdoZW4gQWdlSW5ZZWFycyA+PSA5MCB0aGVuICc5MCsnCiAgICBlbHNlIG51bGwKICBlbmQKCi8vIDUteWVhciBhZ2UgZ3JvdXBzIG1hdGNoaW5nIEdlcm1hbiBjZW5zdXMgZGF0YSBzdHJ1Y3R1cmUKZGVmaW5lIEFnZUZpdmVZZWFyR3JvdXBzOgogIGNhc2UKICAgIHdoZW4gQWdlSW5ZZWFycyBpcyBudWxsIHRoZW4gbnVsbAogICAgd2hlbiBBZ2VJblllYXJzID49IDAgYW5kIEFnZUluWWVhcnMgPCA1IHRoZW4gJzAtNCcKICAgIHdoZW4gQWdlSW5ZZWFycyA+PSA1IGFuZCBBZ2VJblllYXJzIDwgMTAgdGhlbiAnNS05JwogICAgd2hlbiBBZ2VJblllYXJzID49IDEwIGFuZCBBZ2VJblllYXJzIDwgMTUgdGhlbiAnMTAtMTQnCiAgICB3aGVuIEFnZUluWWVhcnMgPj0gMTUgYW5kIEFnZUluWWVhcnMgPCAyMCB0aGVuICcxNS0xOScKICAgIHdoZW4gQWdlSW5ZZWFycyA+PSAyMCBhbmQgQWdlSW5ZZWFycyA8IDI1IHRoZW4gJzIwLTI0JwogICAgd2hlbiBBZ2VJblllYXJzID49IDI1IGFuZCBBZ2VJblllYXJzIDwgMzAgdGhlbiAnMjUtMjknCiAgICB3aGVuIEFnZUluWWVhcnMgPj0gMzAgYW5kIEFnZUluWWVhcnMgPCAzNSB0aGVuICczMC0zNCcKICAgIHdoZW4gQWdlSW5ZZWFycyA+PSAzNSBhbmQgQWdlSW5ZZWFycyA8IDQwIHRoZW4gJzM1LTM5JwogICAgd2hlbiBBZ2VJblllYXJzID49IDQwIGFuZCBBZ2VJblllYXJzIDwgNDUgdGhlbiAnNDAtNDQnCiAgICB3aGVuIEFnZUluWWVhcnMgPj0gNDUgYW5kIEFnZUluWWVhcnMgPCA1MCB0aGVuICc0NS00OScKICAgIHdoZW4gQWdlSW5ZZWFycyA+PSA1MCBhbmQgQWdlSW5ZZWFycyA8IDU1IHRoZW4gJzUwLTU0JwogICAgd2hlbiBBZ2VJblllYXJzID49IDU1IGFuZCBBZ2VJblllYXJzIDwgNjAgdGhlbiAnNTUtNTknCiAgICB3aGVuIEFnZUluWWVhcnMgPj0gNjAgYW5kIEFnZUluWWVhcnMgPCA2NSB0aGVuICc2MC02NCcKICAgIHdoZW4gQWdlSW5ZZWFycyA+PSA2NSBhbmQgQWdlSW5ZZWFycyA8IDcwIHRoZW4gJzY1LTY5JwogICAgd2hlbiBBZ2VJblllYXJzID49IDcwIGFuZCBBZ2VJblllYXJzIDwgNzUgdGhlbiAnNzAtNzQnCiAgICB3aGVuIEFnZUluWWVhcnMgPj0gNzUgYW5kIEFnZUluWWVhcnMgPCA4MCB0aGVuICc3NS03OScKICAgIHdoZW4gQWdlSW5ZZWFycyA+PSA4MCBhbmQgQWdlSW5ZZWFycyA8IDg1IHRoZW4gJzgwLTg0JwogICAgd2hlbiBBZ2VJblllYXJzID49IDg1IGFuZCBBZ2VJblllYXJzIDwgOTAgdGhlbiAnODUtODknCiAgICB3aGVuIEFnZUluWWVhcnMgPj0gOTAgYW5kIEFnZUluWWVhcnMgPCA5NSB0aGVuICc5MC05NCcKICAgIHdoZW4gQWdlSW5ZZWFycyA+PSA5NSB0aGVuICc5NSsnCiAgICBlbHNlIG51bGwKICBlbmQKCi8vIEFsdGVybmF0aXZlIHNob3J0ZXIgZXhwcmVzc2lvbiB1c2luZyBtYXRoZW1hdGljYWwgYXBwcm9hY2gKZGVmaW5lIEFnZUZpdmVZZWFyR3JvdXBzTWF0aDoKICBjYXNlCiAgICB3aGVuIEFnZUluWWVhcnMgaXMgbnVsbCB0aGVuIG51bGwKICAgIHdoZW4gQWdlSW5ZZWFycyA+PSA5NSB0aGVuICc5NSsnCiAgICBlbHNlIFRvU3RyaW5nKChBZ2VJblllYXJzIGRpdiA1KSAqIDUpICsgJy0nICsgVG9TdHJpbmcoKChBZ2VJblllYXJzIGRpdiA1KSAqIDUpICsgNCkKICBlbmQKCi8vIENoZWNrIGlmIHBhdGllbnQgaXMgYW4gYWR1bHQgKDE4IG9yIG9sZGVyKQpkZWZpbmUgSXNBZHVsdDoKICBBZ2VJblllYXJzID49IDE4CgovLyBDaGVjayBpZiBwYXRpZW50IGlzIGEgbWlub3IgKHVuZGVyIDE4KQpkZWZpbmUgSXNNaW5vcjoKICBBZ2VJblllYXJzIDwgMTgKCi8vIENoZWNrIGlmIHBhdGllbnQgaXMgZWxkZXJseSAoNjUgb3Igb2xkZXIpCmRlZmluZSBJc0VsZGVybHk6CiAgQWdlSW5ZZWFycyA+PSA2NQoKLy8gR2VuZGVyIGZvciBzdHJhdGlmaWNhdGlvbgpkZWZpbmUgR2VuZGVyOgogIFBhdGllbnQuZ2VuZGVyCg=="
          }
        ]
      },
      "request" : {
        "method" : "PUT",
        "url" : "Library/mii-lib-stratifier-age-gender"
      }
    },
    {
      "fullUrl" : "https://www.medizininformatik-initiative.de/Measure/mii-msr-summary-report-age-gender-cql",
      "resource" : {
        "resourceType" : "Measure",
        "id" : "mii-msr-summary-report-age-gender-cql",
        "meta" : {
          "profile" : [
            "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
          ]
        },
        "text" : {
          "status" : "extensions",
          "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Measure_mii-msr-summary-report-age-gender-cql\"> </a>\n  <table class=\"narrative-table\">\n    <tbody>\n<tr>\n\n<th colspan=\"2\" scope=\"row\" class=\"row-header\">Knowledge Artifact Metadata</th>\n\n</tr>\n\n<tr>\n\n<th scope=\"row\" class=\"row-header\">Name (machine-readable)</th>\n\n<td class=\"content-container\">SummaryReportAgeGenderCQL</td>\n</tr>\n\n\n<tr>\n\n<th scope=\"row\" class=\"row-header\">Title (human-readable)</th>\n\n<td class=\"content-container\">Summary Report Age Gender CQL</td>\n</tr>\n\n\n\n<tr>\n\n<th scope=\"row\" class=\"row-header\">Status</th>\n\n<td class=\"content-container\">Active</td>\n</tr>\n\n\n<tr>\n\n<th scope=\"row\" class=\"row-header\">Experimental</th>\n\n<td class=\"content-container\">false</td>\n</tr>\n\n\n<tr>\n\n<th scope=\"row\" class=\"row-header\">Description</th>\n\n<td class=\"content-container\"><div><p>Summary Report with gender and 5-year age group stratification using CQL matching German census data structure</p>\n</div></td>\n</tr>\n\n\n\n\n\n\n\n\n\n\n\n\n<tr>\n\n<th scope=\"row\" class=\"row-header\">Measure Steward</th>\n\n<td class=\"content-container\">MII</td>\n</tr>\n\n\n\n\n\n\n\n\n\n\n\n\n<tr>\n\n<th colspan=\"2\" scope=\"row\" class=\"row-header\">Measure Metadata</th>\n\n</tr>\n\n\n\n\n\n\n<tr>\n\n<th scope=\"row\" class=\"row-header\">Version Number</th>\n\n<td class=\"content-container\">1.0</td>\n</tr>\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n  \n    <tr>\n\n<th colspan=\"2\" scope=\"row\" class=\"row-header\">Measure Population Criteria</th>\n\n</tr>\n  \n  \n    \n<tr>\n\n<th scope=\"row\" class=\"row-header\">Summary</th>\n\n<td class=\"content-container\">Patient stratification by gender and 5-year age groups</td>\n</tr>\n\n  \n  \n  \n    <tr>\n      \n        \n          \n            \n<th scope=\"row\" class=\"row-header\">Initial Population</th>\n\n          \n          \n          \n          \n          \n          \n          \n          \n          \n        \n      \n      <td class=\"content-container\">\n        \n        <em>ID</em>: initial-population-identifier\n        <br/>\n        \n        \n          <em>Description</em>: No description provided\n        \n        \n          \n            \n            <em>Logic Definition</em>: <a href=\"#stratifieragegender-ininitialpopulation\">InInitialPopulation</a> \n          \n        \n      </td>\n    </tr>\n  \n\n  \n<tr>\n  \n<th scope=\"row\" class=\"row-header\">Stratifier</th>\n\n  <td class=\"content-container\">\n    \n      <em>ID</em>: stratifier-gender\n      \n        <br/>\n      \n    \n    \n      \n        <em>Code</em>: Recorded sex or gender\n      \n      \n    \n    \n  </td>\n</tr>\n\n<tr>\n  \n<th scope=\"row\" class=\"row-header\">Stratifier</th>\n\n  <td class=\"content-container\">\n    \n      <em>ID</em>: stratifier-age-five-year-groups\n      \n        <br/>\n      \n    \n    \n      \n        <em>Code</em>: Age group\n      \n      \n    \n    \n  </td>\n</tr>\n\n  \n\n\n\n\n\n\n\n\n\n\n\n\n\n<tr>\n\n<th colspan=\"2\" scope=\"row\" class=\"row-header\">Measure Logic</th>\n\n</tr>\n\n<tr>\n\n<th scope=\"row\" class=\"row-header\">Primary Library</th>\n\n<td class=\"content-container\"><a href=\"Bundle-mii-bdl-measure-library-transaction-bundle.html\">Patient Age and Gender Stratification Library</a></td>\n</tr>\n\n\n\n\n<tr>\n  <th colspan=\"2\" scope=\"row\" class=\"row-header\">Generated using version 0.4.6 of the sample-content-ig Liquid templates</th>\n</tr>\n    </tbody>\n  </table>\n</div>"
        },
        "url" : "https://medizininformatik-initiative.de/fhir/Measure/SummaryReportAgeGenderCQL",
        "version" : "1.0",
        "name" : "SummaryReportAgeGenderCQL",
        "title" : "Summary Report Age Gender CQL",
        "status" : "active",
        "experimental" : false,
        "date" : "2025-10-16",
        "publisher" : "MII",
        "description" : "Summary Report with gender and 5-year age group stratification using CQL matching German census data structure",
        "library" : [
          "https://www.medizininformatik-initiative.de/fhir/Library/StratifierAgeGender"
        ],
        "group" : [
          {
            "description" : "Patient stratification by gender and 5-year age groups",
            "population" : [
              {
                "id" : "initial-population-identifier",
                "code" : {
                  "coding" : [
                    {
                      "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
                      "code" : "initial-population"
                    }
                  ]
                },
                "criteria" : {
                  "language" : "text/cql-identifier",
                  "expression" : "InInitialPopulation"
                }
              }
            ],
            "stratifier" : [
              {
                "id" : "stratifier-gender",
                "code" : {
                  "coding" : [
                    {
                      "system" : "http://loinc.org",
                      "code" : "99502-7",
                      "display" : "Recorded sex or gender"
                    }
                  ]
                },
                "criteria" : {
                  "language" : "text/cql-identifier",
                  "expression" : "Gender"
                }
              },
              {
                "id" : "stratifier-age-five-year-groups",
                "code" : {
                  "coding" : [
                    {
                      "system" : "http://loinc.org",
                      "code" : "46251-5",
                      "display" : "Age group"
                    }
                  ]
                },
                "criteria" : {
                  "language" : "text/cql-identifier",
                  "expression" : "AgeFiveYearGroups"
                }
              }
            ]
          }
        ]
      },
      "request" : {
        "method" : "PUT",
        "url" : "Measure/mii-msr-summary-report-age-gender-cql"
      }
    },
    {
      "fullUrl" : "https://www.medizininformatik-initiative.de/Measure/mii-msr-summary-report-composite-gender-age-cql",
      "resource" : {
        "resourceType" : "Measure",
        "id" : "mii-msr-summary-report-composite-gender-age-cql",
        "text" : {
          "status" : "extensions",
          "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Measure_mii-msr-summary-report-composite-gender-age-cql\"> </a>\n  <table class=\"narrative-table\">\n    <tbody>\n<tr>\n\n<th colspan=\"2\" scope=\"row\" class=\"row-header\">Knowledge Artifact Metadata</th>\n\n</tr>\n\n<tr>\n\n<th scope=\"row\" class=\"row-header\">Name (machine-readable)</th>\n\n<td class=\"content-container\">SummaryReportCompositeAgeGenderCQL</td>\n</tr>\n\n\n<tr>\n\n<th scope=\"row\" class=\"row-header\">Title (human-readable)</th>\n\n<td class=\"content-container\">Summary Report Composite Age Gender CQL</td>\n</tr>\n\n\n\n<tr>\n\n<th scope=\"row\" class=\"row-header\">Status</th>\n\n<td class=\"content-container\">Active</td>\n</tr>\n\n\n<tr>\n\n<th scope=\"row\" class=\"row-header\">Experimental</th>\n\n<td class=\"content-container\">false</td>\n</tr>\n\n\n<tr>\n\n<th scope=\"row\" class=\"row-header\">Description</th>\n\n<td class=\"content-container\"><div><p>Summary Report with gender and age decade stratification using CQL in a composite stratifier</p>\n</div></td>\n</tr>\n\n\n\n\n\n\n\n\n\n\n\n\n<tr>\n\n<th scope=\"row\" class=\"row-header\">Measure Steward</th>\n\n<td class=\"content-container\">MII</td>\n</tr>\n\n\n\n\n\n\n\n\n\n\n\n\n<tr>\n\n<th colspan=\"2\" scope=\"row\" class=\"row-header\">Measure Metadata</th>\n\n</tr>\n\n\n\n\n\n\n<tr>\n\n<th scope=\"row\" class=\"row-header\">Version Number</th>\n\n<td class=\"content-container\">1.0</td>\n</tr>\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n  \n    <tr>\n\n<th colspan=\"2\" scope=\"row\" class=\"row-header\">Measure Population Criteria</th>\n\n</tr>\n  \n  \n    \n<tr>\n\n<th scope=\"row\" class=\"row-header\">Summary</th>\n\n<td class=\"content-container\">Composite stratification by gender and age decade</td>\n</tr>\n\n  \n  \n  \n    <tr>\n      \n        \n          \n            \n<th scope=\"row\" class=\"row-header\">Initial Population</th>\n\n          \n          \n          \n          \n          \n          \n          \n          \n          \n        \n      \n      <td class=\"content-container\">\n        \n        <em>ID</em>: initial-population\n        <br/>\n        \n        \n          <em>Description</em>: No description provided\n        \n        \n          \n            \n            <em>Logic Definition</em>: <a href=\"#stratifieragegender-ininitialpopulation\">InInitialPopulation</a> \n          \n        \n      </td>\n    </tr>\n  \n\n  \n<tr>\n  \n<th scope=\"row\" class=\"row-header\">Stratifier</th>\n\n  <td class=\"content-container\">\n    \n    \n    \n  </td>\n</tr>\n\n  \n\n\n\n\n\n\n\n\n\n\n\n\n\n<tr>\n\n<th colspan=\"2\" scope=\"row\" class=\"row-header\">Measure Logic</th>\n\n</tr>\n\n<tr>\n\n<th scope=\"row\" class=\"row-header\">Primary Library</th>\n\n<td class=\"content-container\"><a href=\"Bundle-mii-bdl-measure-library-transaction-bundle.html\">Patient Age and Gender Stratification Library</a></td>\n</tr>\n\n\n\n\n<tr>\n  <th colspan=\"2\" scope=\"row\" class=\"row-header\">Generated using version 0.4.6 of the sample-content-ig Liquid templates</th>\n</tr>\n    </tbody>\n  </table>\n</div>"
        },
        "url" : "https://medizininformatik-initiative.de/fhir/Measure/SummaryReportCompositeAgeGenderCQL",
        "version" : "1.0",
        "name" : "SummaryReportCompositeAgeGenderCQL",
        "title" : "Summary Report Composite Age Gender CQL",
        "status" : "active",
        "experimental" : false,
        "date" : "2025-09-30",
        "publisher" : "MII",
        "description" : "Summary Report with gender and age decade stratification using CQL in a composite stratifier",
        "library" : [
          "https://www.medizininformatik-initiative.de/fhir/Library/StratifierAgeGender"
        ],
        "group" : [
          {
            "description" : "Composite stratification by gender and age decade",
            "population" : [
              {
                "id" : "initial-population",
                "code" : {
                  "coding" : [
                    {
                      "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
                      "code" : "initial-population"
                    }
                  ]
                },
                "criteria" : {
                  "language" : "text/cql-identifier",
                  "expression" : "InInitialPopulation"
                }
              }
            ],
            "stratifier" : [
              {
                "component" : [
                  {
                    "code" : {
                      "coding" : [
                        {
                          "system" : "http://loinc.org",
                          "code" : "46251-5",
                          "display" : "Age group"
                        }
                      ]
                    },
                    "description" : "Patient age five year group",
                    "criteria" : {
                      "language" : "text/cql-identifier",
                      "expression" : "AgeFiveYearGroups"
                    }
                  },
                  {
                    "code" : {
                      "coding" : [
                        {
                          "system" : "http://loinc.org",
                          "code" : "99502-7",
                          "display" : "Recorded sex or gender"
                        }
                      ]
                    },
                    "description" : "Patient gender",
                    "criteria" : {
                      "language" : "text/cql-identifier",
                      "expression" : "Gender"
                    }
                  }
                ]
              }
            ]
          }
        ]
      },
      "request" : {
        "method" : "PUT",
        "url" : "Measure/mii-msr-summary-report-composite-gender-age-cql"
      }
    }
  ]
}

```
