# 5-Year Age Grouping for Census Data Compatibility

## Summary of Implementation

I've updated your CQL library to implement **5-year age groups** that directly match the structure of your German census data instead of 10-year decades.

### Key Changes Made:

1. **Updated CQL Library** (`stratifier-age-gender.cql`)
2. **Updated FSH Measure** (`mii-msr-summary-report-age-gender-cql.fsh`)
3. **Updated Reference Population Library** (`ReferencePopulation-Germany2022.cql`)

## 🎯 Recommended Expression for 5-Year Age Groups

### Option 1: Mathematical Approach (Compact)
```cql
define "AgeFiveYearGroups":
  case
    when AgeInYears is null then null
    when AgeInYears >= 95 then '95+'
    when AgeInYears >= 0 then 
      ToString((AgeInYears div 5) * 5) + '-' + ToString(((AgeInYears div 5) * 5) + 4)
    else 'Unknown'
  end
```

**How it works:**
- `(AgeInYears div 5) * 5` calculates the lower bound
- `((AgeInYears div 5) * 5) + 4` calculates the upper bound
- Example: Age 27 → (27 div 5) * 5 = 25, 25 + 4 = 29 → "25-29"

### Option 2: Explicit Approach (Most Readable)
```cql
define "AgeFiveYearGroupsExplicit":
  case
    when AgeInYears is null then null
    when AgeInYears in Interval[0, 4] then '0-4'
    when AgeInYears in Interval[5, 9] then '5-9'
    when AgeInYears in Interval[10, 14] then '10-14'
    when AgeInYears in Interval[15, 19] then '15-19'
    // ... continue for all ranges
    when AgeInYears in Interval[90, 94] then '90-94'
    when AgeInYears >= 95 then '95+'
    else 'Unknown'
  end
```

## 📊 Census Data Mapping

| CSV Age Range | CQL Output | Ages Included |
|---------------|------------|---------------|
| 0-5           | 0-4        | 0, 1, 2, 3, 4 |
| 5-10          | 5-9        | 5, 6, 7, 8, 9 |
| 10-15         | 10-14      | 10, 11, 12, 13, 14 |
| 15-20         | 15-19      | 15, 16, 17, 18, 19 |
| 20-25         | 20-24      | 20, 21, 22, 23, 24 |
| ...           | ...        | ... |
| 90-95         | 90-94      | 90, 91, 92, 93, 94 |
| 95+           | 95+        | 95, 96, 97, ... |

## 🔍 Why This Expression is Optimal

### Benefits of Mathematical Approach:
1. **Compact**: Single formula handles all age ranges
2. **Maintainable**: No need to list every range explicitly
3. **Extensible**: Automatically handles any age value
4. **Efficient**: Minimal CQL code

### Benefits of Explicit Approach:
1. **Readable**: Clear mapping for each age range
2. **Precise**: Exact control over each group
3. **Debuggable**: Easy to verify logic
4. **Census-Compatible**: Direct 1:1 mapping with your data

## 🚀 Integration with Your Census Data

The 5-year grouping now enables:

1. **Direct Comparison**: Your patient data stratified in same ranges as census
2. **SMR Calculations**: Standardized Morbidity Ratios for each 5-year group
3. **Population Analysis**: Compare observed vs expected counts
4. **Epidemiological Studies**: Standard age stratification for research

## 📈 Example MeasureReport Output

With 5-year grouping, your MeasureReport will now show:
```json
{
  "stratifier": {
    "stratum": [
      { "value": { "text": "0-4" }, "population": { "count": 2 } },
      { "value": { "text": "5-9" }, "population": { "count": 1 } },
      { "value": { "text": "45-49" }, "population": { "count": 3 } },
      { "value": { "text": "50-54" }, "population": { "count": 4 } }
    ]
  }
}
```

This directly matches your census data structure for accurate population comparison and statistical analysis.