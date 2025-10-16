#!/bin/bash

# Test script for 5-year age grouping validation
# This script tests different age values to ensure correct grouping

echo "🧪 Testing 5-Year Age Grouping Expressions"
echo "=========================================="

# Test cases with expected results
declare -A test_cases=(
    [0]="0-4"
    [2]="0-4"
    [4]="0-4"
    [5]="5-9"
    [7]="5-9"
    [9]="5-9"
    [10]="10-14"
    [14]="10-14"
    [15]="15-19"
    [19]="15-19"
    [25]="25-29"
    [30]="30-34"
    [45]="45-49"
    [67]="65-69"
    [84]="80-84"
    [90]="90-94"
    [95]="95+"
    [100]="95+"
)

echo "Testing mathematical approach: (age div 5) * 5 to ((age div 5) * 5) + 4"
echo "--------------------------------------------------------------------"

# Function to calculate 5-year group mathematically
calculate_age_group() {
    local age=$1
    if [ $age -ge 95 ]; then
        echo "95+"
    else
        local lower=$(( (age / 5) * 5 ))
        local upper=$(( lower + 4 ))
        echo "${lower}-${upper}"
    fi
}

# Test the mathematical approach
echo "Age → Expected | Calculated | Status"
echo "--------------------------------"
for age in "${!test_cases[@]}"; do
    expected="${test_cases[$age]}"
    calculated=$(calculate_age_group $age)
    
    if [ "$expected" = "$calculated" ]; then
        status="✅ PASS"
    else
        status="❌ FAIL"
    fi
    
    printf "%3d → %-8s | %-10s | %s\n" $age "$expected" "$calculated" "$status"
done

echo ""
echo "📊 Census Data Age Ranges vs CQL Expression Mapping"
echo "===================================================="
echo "CSV Range | CQL Expression | CQL Output"
echo "----------|----------------|------------"
echo "0-5       | age in [0,4]   | 0-4"
echo "5-10      | age in [5,9]   | 5-9" 
echo "10-15     | age in [10,14] | 10-14"
echo "15-20     | age in [15,19] | 15-19"
echo "20-25     | age in [20,24] | 20-24"
echo "...       | ...            | ..."
echo "90-95     | age in [90,94] | 90-94"
echo "95+       | age >= 95      | 95+"

echo ""
echo "🎯 Recommended CQL Expression for 5-Year Age Groups:"
echo "===================================================="
cat << 'EOF'
define "AgeFiveYearGroups":
  case
    when AgeInYears is null then null
    when AgeInYears >= 95 then '95+'
    when AgeInYears >= 0 then 
      ToString((AgeInYears div 5) * 5) + '-' + ToString(((AgeInYears div 5) * 5) + 4)
    else 'Unknown'
  end

// Alternative explicit approach (more readable, exact census matching):
define "AgeFiveYearGroupsExplicit":
  case
    when AgeInYears is null then null
    when AgeInYears in Interval[0, 4] then '0-4'
    when AgeInYears in Interval[5, 9] then '5-9'
    when AgeInYears in Interval[10, 14] then '10-14'
    when AgeInYears in Interval[15, 19] then '15-19'
    when AgeInYears in Interval[20, 24] then '20-24'
    when AgeInYears in Interval[25, 29] then '25-29'
    when AgeInYears in Interval[30, 34] then '30-34'
    when AgeInYears in Interval[35, 39] then '35-39'
    when AgeInYears in Interval[40, 44] then '40-44'
    when AgeInYears in Interval[45, 49] then '45-49'
    when AgeInYears in Interval[50, 54] then '50-54'
    when AgeInYears in Interval[55, 59] then '55-59'
    when AgeInYears in Interval[60, 64] then '60-64'
    when AgeInYears in Interval[65, 69] then '65-69'
    when AgeInYears in Interval[70, 74] then '70-74'
    when AgeInYears in Interval[75, 79] then '75-79'
    when AgeInYears in Interval[80, 84] then '80-84'
    when AgeInYears in Interval[85, 89] then '85-89'
    when AgeInYears in Interval[90, 94] then '90-94'
    when AgeInYears >= 95 then '95+'
    else 'Unknown'
  end
EOF

echo ""
echo "✨ Benefits of 5-Year Age Groups:"
echo "• Direct compatibility with German census data"
echo "• More granular analysis than 10-year groups"
echo "• Standard epidemiological age stratification"
echo "• Enables precise population comparison and SMR calculations"