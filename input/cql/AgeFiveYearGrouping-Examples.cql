library AgeFiveYearGrouping version '1.0.0'

using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

context Patient

parameter "MeasurementPeriod" Interval<DateTime>

// Age calculation
define "AgeInYears":
  AgeInYearsAt(start of "MeasurementPeriod")

// Approach 1: Explicit case-when for each 5-year range (Most readable, matches census exactly)
define "AgeFiveYearGroups_Explicit":
  case
    when "AgeInYears" is null then null
    when "AgeInYears" >= 0 and "AgeInYears" < 5 then '0-4'
    when "AgeInYears" >= 5 and "AgeInYears" < 10 then '5-9'
    when "AgeInYears" >= 10 and "AgeInYears" < 15 then '10-14'
    when "AgeInYears" >= 15 and "AgeInYears" < 20 then '15-19'
    when "AgeInYears" >= 20 and "AgeInYears" < 25 then '20-24'
    when "AgeInYears" >= 25 and "AgeInYears" < 30 then '25-29'
    when "AgeInYears" >= 30 and "AgeInYears" < 35 then '30-34'
    when "AgeInYears" >= 35 and "AgeInYears" < 40 then '35-39'
    when "AgeInYears" >= 40 and "AgeInYears" < 45 then '40-44'
    when "AgeInYears" >= 45 and "AgeInYears" < 50 then '45-49'
    when "AgeInYears" >= 50 and "AgeInYears" < 55 then '50-54'
    when "AgeInYears" >= 55 and "AgeInYears" < 60 then '55-59'
    when "AgeInYears" >= 60 and "AgeInYears" < 65 then '60-64'
    when "AgeInYears" >= 65 and "AgeInYears" < 70 then '65-69'
    when "AgeInYears" >= 70 and "AgeInYears" < 75 then '70-74'
    when "AgeInYears" >= 75 and "AgeInYears" < 80 then '75-79'
    when "AgeInYears" >= 80 and "AgeInYears" < 85 then '80-84'
    when "AgeInYears" >= 85 and "AgeInYears" < 90 then '85-89'
    when "AgeInYears" >= 90 and "AgeInYears" < 95 then '90-94'
    when "AgeInYears" >= 95 then '95+'
    else 'Unknown'
  end

// Approach 2: Mathematical calculation (More compact, handles any age automatically)
define "AgeFiveYearGroups_Mathematical":
  case
    when "AgeInYears" is null then null
    when "AgeInYears" >= 95 then '95+'
    when "AgeInYears" >= 0 then 
      ToString(("AgeInYears" div 5) * 5) + '-' + ToString((("AgeInYears" div 5) * 5) + 4)
    else 'Unknown'
  end

// Approach 3: Using interval calculations (Most flexible for different ranges)
define function "GetAgeGroupRange"(age Integer, rangeSize Integer):
  case
    when age is null then null
    when age >= 95 then '95+'
    when age >= 0 then 
      ToString((age div rangeSize) * rangeSize) + '-' + ToString(((age div rangeSize) * rangeSize) + (rangeSize - 1))
    else 'Unknown'
  end

define "AgeFiveYearGroups_Function":
  "GetAgeGroupRange"("AgeInYears", 5)

// Approach 4: Census-compatible with exact matching to German data structure
define "AgeFiveYearGroups_CensusCompatible":
  case
    when "AgeInYears" is null then null
    when "AgeInYears" in Interval[0, 4] then '0-4'
    when "AgeInYears" in Interval[5, 9] then '5-9'
    when "AgeInYears" in Interval[10, 14] then '10-14'
    when "AgeInYears" in Interval[15, 19] then '15-19'
    when "AgeInYears" in Interval[20, 24] then '20-24'
    when "AgeInYears" in Interval[25, 29] then '25-29'
    when "AgeInYears" in Interval[30, 34] then '30-34'
    when "AgeInYears" in Interval[35, 39] then '35-39'
    when "AgeInYears" in Interval[40, 44] then '40-44'
    when "AgeInYears" in Interval[45, 49] then '45-49'
    when "AgeInYears" in Interval[50, 54] then '50-54'
    when "AgeInYears" in Interval[55, 59] then '55-59'
    when "AgeInYears" in Interval[60, 64] then '60-64'
    when "AgeInYears" in Interval[65, 69] then '65-69'
    when "AgeInYears" in Interval[70, 74] then '70-74'
    when "AgeInYears" in Interval[75, 79] then '75-79'
    when "AgeInYears" in Interval[80, 84] then '80-84'
    when "AgeInYears" in Interval[85, 89] then '85-89'
    when "AgeInYears" in Interval[90, 94] then '90-94'
    when "AgeInYears" >= 95 then '95+'
    else 'Unknown'
  end

// Approach 5: Alternative age ranges (for comparison)
define "AgeThreeYearGroups":
  case
    when "AgeInYears" is null then null
    when "AgeInYears" >= 90 then '90+'
    when "AgeInYears" >= 0 then 
      ToString(("AgeInYears" div 3) * 3) + '-' + ToString((("AgeInYears" div 3) * 3) + 2)
    else 'Unknown'
  end

define "AgeTenYearGroups":
  case
    when "AgeInYears" is null then null
    when "AgeInYears" >= 90 then '90+'
    when "AgeInYears" >= 0 then 
      ToString(("AgeInYears" div 10) * 10) + '-' + ToString((("AgeInYears" div 10) * 10) + 9)
    else 'Unknown'
  end

// Gender for stratification
define "Gender":
  Patient.gender

// Example combined stratifier for age-gender cross-tabulation
define "AgeGenderCombined":
  "AgeFiveYearGroups_CensusCompatible" + '|' + "Gender"