["stratifier", "value", "count"],
(.group[0].stratifier[0].stratum[]? | ["gender", .value.text, .population[0].count]),
(.group[0].stratifier[1].stratum[]? | ["age_decade", .value.text, .population[0].count])
| @csv