df <- read.csv("1000X-3011_de.csv", sep = ";", dec = ",", check.names = FALSE, skip=6)

output <- data.frame("Alter von" = character(), "Alter Bis" = character(), "Gesamt" = character(), "Maennlich" = character(), "Weiblich" = character())


for(land in 0:15){
  for (n in 1:19) {
    output[n, 1] <- (n-1)*5
    output[n, 2] <- n*5
    output[n, 3] <- df[n*18+3, land*2+4]
    output[n, 4] <- df[n*18+4, land*2+4]
    output[n, 5] <- df[n*18+5, land*2+4]
  }

  filename <- paste0("2011-", colnames(df)[land*2+4], ".csv")
  write.table(output, filename, row.names = FALSE, sep = ";")
}