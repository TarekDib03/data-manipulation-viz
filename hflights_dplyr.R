library(dplyr)
library(hflights)

nrow(hflights)

hflights <- tbl_df(hflights)
'You can create a lookup table with a named vector. When you subset the lookup table with a character 
string (like the character strings in UniqueCarrier), R will return the values of the lookup table that 
correspond to the names in the character string.'
lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental", 
         "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways", 
         "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier", 
         "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")
hflights$UniqueCarrier <- lut[hflights$UniqueCarrier]
# Structure of the hflights tbl data frame
glimpse(hflights)

# Build the lookup table: lut. CancellationCode variable
cancelCode <- c("A"="carrier", "B"="weather", "C"="FFA", "D"="security", "E"="not cancelled") 
# Use the lookup table to create a vector of code labels. Assign the vector to the CancellationCode column of hflights
hflights$CancellationCode <- cancelCode[hflights$CancellationCode]
# Inspect the resulting raw values of your variables
glimpse(hflights)