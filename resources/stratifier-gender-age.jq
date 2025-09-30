["gender", "age_decade", "count"],
(.group[0].stratifier[0].stratum[] as $gender_strata |
 .group[0].stratifier[1].stratum[] as $age_strata |
 [$gender_strata.value.text, $age_strata.value.text, ($gender_strata.population[0].count + $age_strata.population[0].count)])
| @csv