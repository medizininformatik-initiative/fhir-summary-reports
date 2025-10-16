library "stratifier-age-gender"
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

context Patient

define InInitialPopulation:
  true

define BirthYear:
  year from Patient.birthDate

// Calculate the patient's age in years as of today
define AgeInYears:
  AgeInYearsAt(Today())

// Calculate the patient's age in years at a specific date
define function AgeInYearsAt(asOf DateTime):
  if Patient.birthDate is null then null
  else years between FHIRHelpers.ToDate(Patient.birthDate) and asOf

// Calculate the patient's age in months
define AgeInMonths:
  AgeInMonthsAt(Today())

// Calculate the patient's age in months at a specific date  
define function AgeInMonthsAt(asOf DateTime):
  if Patient.birthDate is null then null
  else months between FHIRHelpers.ToDate(Patient.birthDate) and asOf

// Calculate the patient's age in days
define AgeInDays:
  AgeInDaysAt(Today())

// Calculate the patient's age in days at a specific date
define function AgeInDaysAt(asOf DateTime):
  if Patient.birthDate is null then null
  else days between FHIRHelpers.ToDate(Patient.birthDate) and asOf

// Alternative age calculation using date arithmetic
define AgeInYearsSimple:
  if Patient.birthDate is null then null
  else year from Today() - year from FHIRHelpers.ToDate(Patient.birthDate)

// Age stratification examples
define AgeGroup:
  case
    when AgeInYears is null then null
    when AgeInYears < 18 then 'Pediatric'
    when AgeInYears >= 18 and AgeInYears < 65 then 'Adult'
    when AgeInYears >= 65 then 'Geriatric'
    else null
  end

define AgeDecade:
  case
    when AgeInYears is null then null
    when AgeInYears < 10 then '0-9'
    when AgeInYears >= 10 and AgeInYears < 20 then '10-19'
    when AgeInYears >= 20 and AgeInYears < 30 then '20-29'
    when AgeInYears >= 30 and AgeInYears < 40 then '30-39'
    when AgeInYears >= 40 and AgeInYears < 50 then '40-49'
    when AgeInYears >= 50 and AgeInYears < 60 then '50-59'
    when AgeInYears >= 60 and AgeInYears < 70 then '60-69'
    when AgeInYears >= 70 and AgeInYears < 80 then '70-79'
    when AgeInYears >= 80 and AgeInYears < 90 then '80-89'
    when AgeInYears >= 90 then '90+'
    else null
  end

// 5-year age groups matching German census data structure
define AgeFiveYearGroups:
  case
    when AgeInYears is null then null
    when AgeInYears >= 0 and AgeInYears < 5 then '0-4'
    when AgeInYears >= 5 and AgeInYears < 10 then '5-9'
    when AgeInYears >= 10 and AgeInYears < 15 then '10-14'
    when AgeInYears >= 15 and AgeInYears < 20 then '15-19'
    when AgeInYears >= 20 and AgeInYears < 25 then '20-24'
    when AgeInYears >= 25 and AgeInYears < 30 then '25-29'
    when AgeInYears >= 30 and AgeInYears < 35 then '30-34'
    when AgeInYears >= 35 and AgeInYears < 40 then '35-39'
    when AgeInYears >= 40 and AgeInYears < 45 then '40-44'
    when AgeInYears >= 45 and AgeInYears < 50 then '45-49'
    when AgeInYears >= 50 and AgeInYears < 55 then '50-54'
    when AgeInYears >= 55 and AgeInYears < 60 then '55-59'
    when AgeInYears >= 60 and AgeInYears < 65 then '60-64'
    when AgeInYears >= 65 and AgeInYears < 70 then '65-69'
    when AgeInYears >= 70 and AgeInYears < 75 then '70-74'
    when AgeInYears >= 75 and AgeInYears < 80 then '75-79'
    when AgeInYears >= 80 and AgeInYears < 85 then '80-84'
    when AgeInYears >= 85 and AgeInYears < 90 then '85-89'
    when AgeInYears >= 90 and AgeInYears < 95 then '90-94'
    when AgeInYears >= 95 then '95+'
    else null
  end

// Alternative shorter expression using mathematical approach
define AgeFiveYearGroupsMath:
  case
    when AgeInYears is null then null
    when AgeInYears >= 95 then '95+'
    else ToString((AgeInYears div 5) * 5) + '-' + ToString(((AgeInYears div 5) * 5) + 4)
  end

// Check if patient is an adult (18 or older)
define IsAdult:
  AgeInYears >= 18

// Check if patient is a minor (under 18)
define IsMinor:
  AgeInYears < 18

// Check if patient is elderly (65 or older)
define IsElderly:
  AgeInYears >= 65

// Gender for stratification
define Gender:
  Patient.gender
