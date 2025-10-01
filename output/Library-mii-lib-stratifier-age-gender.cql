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
