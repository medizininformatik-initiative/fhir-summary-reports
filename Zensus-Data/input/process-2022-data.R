df <- read.csv("1000A-3022_de.csv", sep = ";", dec = ",", check.names = FALSE, skip=3)

output <- data.frame("Alter von" = character(), "Alter Bis" = character(), "Gesamt" = character(), "Maennlich" = character(), "Weiblich" = character())


for(land in 0:15){
  for (n in 1:19) {
    output[n, 1] <- (n-1)*5
    output[n, 2] <- n*5
    output[n, 3] <- df[n*27+5, land*2+4]
    output[n, 4] <- df[n*27+6, land*2+4]
    output[n, 5] <- df[n*27+7, land*2+4]
  }

  filename <- paste0("2022-", colnames(df)[land*2+4], ".csv")
  write.table(output, filename, row.names = FALSE, sep = ";")
}