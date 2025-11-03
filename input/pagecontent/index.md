# FHIR Summary Reports

## Overview

This Implementation Guide provides a FHIR-based framework for generating basic population-level demographic summary statistics from patient data. It focuses on age distribution analysis and gender stratification using Clinical Quality Language (CQL) and FHIR Measure resources.

## Features

- **Population Demographics**: Calculate age distributions using 5-year age groups matching German census data structure
- **Multiple Stratification Approaches**: Support for both separate and composite demographic stratification
- **CQL-Based Calculations**: Age calculation logic
- **Census Integration**: Alignment with German Census 2011 and 2022 data structure for comparative analysis

## FHIR Artifacts

### Libraries

| Resource | Purpose | Description |
|----------|---------|-------------|
| [Stratifier Age Gender](Library-mii-lib-stratifier-age-gender.html) | CQL logic for demographic calculations | Contains age calculation functions, 5-year age grouping and gender stratification |

### Measures

| Resource | Approach | Purpose |
|----------|----------|---------|
| [Age Gender CQL](Measure-mii-msr-summary-report-age-gender-cql.html) | Separate Stratifiers | Independent age and gender demographic analysis |
| [Composite Gender Age CQL](Measure-mii-msr-summary-report-composite-gender-age-cql.html) | Composite Stratifiers | Cross-tabulated age×gender combinations for detailed demographic intersections |

### Example Reports

#### German Census Data (2011 vs 2022)

| Resource | Census Year | Format |
|----------|-------------|---------|
| [Zensus 2011 Report](MeasureReport-mii-msrpt-summary-report-age-gender-zensus-2011.html) | 2011 | Separate stratifiers |
| [Zensus 2022 Report](MeasureReport-mii-msrpt-summary-report-age-gender-zensus-2022.html) | 2022 | Separate stratifiers |
| [Zensus 2011 Composite](MeasureReport-mii-msrpt-summary-report-age-gender-composite-zensus-2011.html) | 2011 | Composite format |
| [Zensus 2022 Composite](MeasureReport-mii-msrpt-summary-report-age-gender-composite-zensus-2022.html) | 2022 | Composite format |

### Bundle Resources

| Resource | Purpose |
|----------|---------|
| [Measure Library Transaction Bundle](Bundle-mii-bdl-measure-library-transaction-bundle.html) | Complete artifact deployment bundle |

## Stratification Approaches

### Separate Stratifiers
- **Structure**: Multiple independent stratifiers (age and gender analyzed separately)
- **Use Case**: Basic demographic summaries
- **Output**: Individual dimension counts (e.g., "6 males, 4 females" + "3 aged 40-44, 2 aged 45-49")

### Composite Stratifiers  
- **Structure**: Single stratifier with component dimensions
- **Use Case**: Detailed demographic intersection analysis
- **Output**: Cross-tabulated combinations (e.g., "2 males aged 40-44, 1 female aged 40-44")

## Age Group Classifications

The implementation provides age classification scheme:

- **5-Year Groups**: 0-4, 5-9, 10-14, ..., 85-89, 90+ (matches German census structure)

## Technical Implementation

### CQL Functions
- `AgeInYears`, `AgeInMonths`, `AgeInDays` - Age calculations
- `AgeFiveYearGroups` - German census-aligned age grouping
- `Gender` - Gender stratification

### FHIR Resource Types
- **Measure**: Population measure definitions with CQL expressions
- **Library**: CQL logic packaging for reuse across measures  
- **MeasureReport**: Example outputs demonstrating expected results
