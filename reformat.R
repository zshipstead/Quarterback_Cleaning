QBonly <- NFL_Offensive_Player_stats_1999_2013

#Reduce data to QB, rename columns

QBonly <- QBonly[QBonly$FantPos=="QB",]
QBonly <- QBonly[order(QBonly$Player, QBonly$Year),]
View(QBonly)

colnames(QBonly)
colnames(QBonly)[10] <- "PassAtt"
colnames(QBonly)[11] <- "PassYards"
colnames(QBonly)[12] <- "PassTD"
colnames(QBonly)[15] <- "RushYards"
colnames(QBonly)[17] <- "RushTD"
colnames(QBonly)[24] <- "Height_IN"
colnames(QBonly)[28] <- "College_Wins"
colnames(QBonly)[29] <- "College_Losses"
colnames(QBonly)[31] <- "Draft_RD"
colnames(QBonly)[32] <- "Draft_YR"
colnames(QBonly)[34] <- "40_YRD"
colnames(QBonly)[35] <- "Bench_Press"
colnames(QBonly)[36] <- "Vert_Leap_IN"
colnames(QBonly)[37] <- "Broad_Jump_IN"

# Drop unused columns
QBonly <- QBonly[-c(3,4,5,6,14,15,16,17,18,19,20,21,22,23)]


#               File for removing players from outside of 1999-2009 window
QB1999 <- QBonly

#                               Data Entry Issues

# Search for cases where QB has multiple values for draft year (data input error)
QB1999$TotDraftYears <- 1

for (i in 2:(length(QB1999$Year))){
  if (QB1999$Player[i] == QB1999$Player[i-1]) {
    if (QB1999$Draft_YR[i] != (QB1999$Draft_YR[i-1])) {
      QB1999$TotDraftYears[i] <- 999
      QB1999$TotDraftYears[i-1] <- 999
    }
  }}

View(QB1999[order(-QB1999$TotDraftYears),])

# Isolate inconsistent data (draft year changes by row)
FixPlayers <- QB1999[c(2,18)][QB1999$TotDraftYears == 999,]
View(FixPlayers)

# Errors...Set info to be consistent...required research to know
QB1999$Draft_YR[QB1999$Player == "Bubby Brister"] <- 1986
QB1999$Draft_YR[QB1999$Player == "Cade McNown"] <- 1999
QB1999$Draft_YR[QB1999$Player == "Chris Greisen"] <- 1999
QB1999$Draft_YR[QB1999$Player == "Eric Zeier"] <- 1995
QB1999$Draft_YR[QB1999$Player == "J.P. Losman"] <- 2004
QB1999$Draft_YR[QB1999$Player == "J.T. O'Sullivan"] <- 2002
QB1999$Draft_YR[QB1999$Player == "Jeff George"] <- 1990
QB1999$Draft_YR[QB1999$Player == "Jeff Lewis"] <- 1996
QB1999$Draft_YR[QB1999$Player == "John Friesz"] <- 1990
QB1999$Draft_YR[QB1999$Player == "Josh Johnson"] <- 2008
QB1999$Draft_YR[QB1999$Player == "Kent Graham"] <- 1992
QB1999$Draft_YR[QB1999$Player == "Russell Wilson"] <- 2012
QB1999$Draft_YR[QB1999$Player == "Terrelle Pryor"] <- 2011
QB1999$Draft_YR[QB1999$Player == "Troy Aikman"] <- 1989
QB1999$Draft_YR[QB1999$Player == "Tyler Thigpen"] <- 2007
#
rm(FixPlayers)


# Search for cases where QB has multiple values for draft round (data input error)
QB1999$TotDraftRound <- 1

for (i in 2:(length(QB1999$Year))){
  if (QB1999$Player[i] == QB1999$Player[i-1]) {
    if (QB1999$Draft_RD[i] != (QB1999$Draft_RD[i-1])) {
      QB1999$TotDraftRound[i] <- 999
      QB1999$TotDraftRound[i-1] <- 999
    }
  }}

View(QB1999[order(-QB1999$TotDraftRound),])

FixPlayers <- QB1999[c(2,17)][QB1999$TotDraftRound == 999,]
View(FixPlayers)

# Errors...required research
QB1999$Draft_RD[QB1999$Player == "Alex Van Pelt"] <- 8
QB1999$Draft_RD[QB1999$Player == "Bobby Hoying"] <- 3
QB1999$Draft_RD[QB1999$Player == "Brock Huard"] <- 3
QB1999$Draft_RD[QB1999$Player == "Bubby Brister"] <- 3
QB1999$Draft_RD[QB1999$Player == "Charlie Batch"] <- 2
QB1999$Draft_RD[QB1999$Player == "Chris Chandler"] <- 3
QB1999$Draft_RD[QB1999$Player == "Chris Greisen"] <- 7
QB1999$Draft_RD[QB1999$Player == "Chris Redman"] <- 3
QB1999$Draft_RD[QB1999$Player == "Danny Kanell"] <- 4
QB1999$Draft_RD[QB1999$Player == "Danny Wuerffel"] <- 4
QB1999$Draft_RD[QB1999$Player == "Doug Flutie"] <- 11
QB1999$Draft_RD[QB1999$Player == "Elvis Grbac"] <- 8
QB1999$Draft_RD[QB1999$Player == "Eric Zeier"] <- 3
QB1999$Draft_RD[QB1999$Player == "Gus Frerotte"] <- 7
QB1999$Draft_RD[QB1999$Player == "Jarious Jackson"] <- 7
QB1999$Draft_RD[QB1999$Player == "Jeff Blake"] <- 6
QB1999$Draft_RD[QB1999$Player == "Jeff Lewis"] <- 4
QB1999$Draft_RD[QB1999$Player == "Jim Miller"] <- 6
QB1999$Draft_RD[QB1999$Player == "John Friesz"] <- 6
QB1999$Draft_RD[QB1999$Player == "Jonathan Quinn"] <- 3
QB1999$Draft_RD[QB1999$Player == "Kent Graham"] <- 8
QB1999$Draft_RD[QB1999$Player == "Kordell Stewart"] <- 2
QB1999$Draft_RD[QB1999$Player == "Koy Detmer"] <- 7
QB1999$Draft_RD[QB1999$Player == "Moses Moreno"] <- 7
QB1999$Draft_RD[QB1999$Player == "Neil O'Donnell"] <- 3
QB1999$Draft_RD[QB1999$Player == "Randall Cunningham"] <- 2
QB1999$Draft_RD[QB1999$Player == "Rob Johnson"] <- 4
QB1999$Draft_RD[QB1999$Player == "Scott Mitchell"] <- 4
QB1999$Draft_RD[QB1999$Player == "Shaun King"] <- 2
QB1999$Draft_RD[QB1999$Player == "Spergon Wynn"] <- 6
QB1999$Draft_RD[QB1999$Player == "Steve Beuerlein"] <- 4
QB1999$Draft_RD[QB1999$Player == "Stoney Case"] <- 3
QB1999$Draft_RD[QB1999$Player == "Tim Rattay"] <- 7
QB1999$Draft_RD[QB1999$Player == "Tony Banks"] <- 2
#
rm(FixPlayers)

# Find players who don't have zeros in draft round and year
# i.e., players who the numbers say was drafted, but doen't have a round
# Or were not drafted, but had a round

QB1999$DraftMatch <- 1

for (i in 2:(length(QB1999$Year))){
  if ((QB1999$Draft_RD[i] == 0) | (QB1999$Draft_YR[i] == 0)) {
    if ((QB1999$Draft_RD[i] != 0) | (QB1999$Draft_YR[i] != 0)) {
      QB1999$DraftMatch[i] <- 999
    }
  }}

View(QB1999[order(-QB1999$DraftMatch),])

FixPlayers <- QB1999[c(2,17,18)][QB1999$DraftMatch == 999,]
View(FixPlayers)

# Fix missing years
QB1999$Draft_YR[QB1999$Player == "Dave Brown"] <- 1992
QB1999$Draft_YR[QB1999$Player == "John Skelton"] <- 2010
QB1999$Draft_YR[QB1999$Player == "Keith Null"] <- 2009
QB1999$Draft_YR[QB1999$Player == "Steve Walsh"] <- 1989
QB1999$Draft_YR[QB1999$Player == "Steve Young"] <- 1984

# Fix missing rounds
QB1999$Draft_RD[QB1999$Player == "Joe Hamilton"] <- 7
QB1999$Draft_RD[QB1999$Player == "Michael Bishop"] <- 7
QB1999$Draft_RD[QB1999$Player == "Todd Husak"] <- 6

rm(FixPlayers)


#             Only keep players who started their careers between 1999 and 2009
# Temp file
QB1999b <- QB1999
nrow(QB1999)
nrow(QB1999b)


# 1. Drop Draft Year less than 1999 without dropping free agents (coded as 0)
QB1999b <- QB1999b[(QB1999b$Draft_YR > 1998) | (QB1999b$Draft_YR == 0),]

# 2. Find free agents who entered the league before 1999
View(QB1999b[order(QB1999b$Draft_YR, QB1999b$Year),])
# Year 1999
QB1999b <- QB1999b[QB1999b$Player != "Pete Gonzalez",]
QB1999b <- QB1999b[QB1999b$Player != "Warren Moon",]
QB1999b <- QB1999b[QB1999b$Player != "Jason Garrett",]
QB1999b <- QB1999b[QB1999b$Player != "Jake Delhomme",]
QB1999b <- QB1999b[QB1999b$Player != "Jay Fiedler",]
QB1999b <- QB1999b[QB1999b$Player != "Damon Huard",]
QB1999b <- QB1999b[QB1999b$Player != "Doug Peterson",]
QB1999b <- QB1999b[QB1999b$Player != "Mike Tomczak",]
QB1999b <- QB1999b[QB1999b$Player != "Ray Lucas",]
QB1999b <- QB1999b[QB1999b$Player != "Shane Matthews",]
QB1999b <- QB1999b[QB1999b$Player != "Jon Kitna",]
QB1999b <- QB1999b[QB1999b$Player != "Kurt Warner",]
QB1999b <- QB1999b[QB1999b$Player != "Doug Pederson",]
QB1999b <- QB1999b[QB1999b$Player != "Erik Kramer",]
# Year 2000
QB1999b <- QB1999b[QB1999b$Player != "Dameyune Craig",]
QB1999b <- QB1999b[QB1999b$Player != "Mark Hartsell",]
QB1999b <- QB1999b[QB1999b$Player != "Jamie Martin",]
# Year 2001
QB1999b <- QB1999b[QB1999b$Player != "Kelly Holcomb",]
QB1999b <- QB1999b[QB1999b$Player != "Todd Bouman",]
# Year 2002
QB1999b <- QB1999b[QB1999b$Player != "Cory Sauter",]

# Drop After 2009 and Non Drafted
QB1999c <- QB1999b
nrow(QB1999b)
nrow(QB1999c)

View(QB1999c[order(QB1999c$Draft_YR, QB1999c$Year),])
QB1999c <- QB1999c[QB1999c$Draft_YR < 2010,]

# Undrafted Players
QB1999c <- QB1999c[QB1999c$Player != "Max Hall",]
QB1999c <- QB1999c[QB1999c$Player != "Dominique Davis",]
QB1999c <- QB1999c[QB1999c$Player != "Graham Harrell",]
QB1999c <- QB1999c[QB1999c$Player != "Thaddeus Lewis",]
QB1999c <- QB1999c[QB1999c$Player != "Case Keenum",]
QB1999c <- QB1999c[QB1999c$Player != "Jeff Tuel",]
QB1999c <- QB1999c[QB1999c$Player != "Matt McGloin",]
QB1999c <- QB1999c[QB1999c$Player != "Matt Simms",]
QB1999c <- QB1999c[QB1999c$Player != "Ryan Quigley",]
QB1999c <- QB1999c[QB1999c$Player != "Scott Tolzien",]

# Save Work
setwd("~")
write.csv(QB1999c, "QBcuts.csv", row.names = FALSE)

rm(list=ls())

QBcuts <- read.csv("QBcuts.csv", header = TRUE)

# Aggregate data
QBagg <- aggregate (list (Games = QBcuts$G, GamesStart = QBcuts$GS,
                          Completions = QBcuts$Cmp, Attempts = QBcuts$PassAtt,
                          Yards = QBcuts$PassYards, TD = QBcuts$PassTD,
                          Int = QBcuts$Int),
                    by = list (Player = QBcuts$Player),
                    FUN = sum, na.rm = TRUE)
View(QBagg)
View(QBcuts)

# Transform data to make IV columns.
QBagg$pctStart <- QBagg$GamesStart / QBagg$Games
QBagg$compPct[QBagg$Attempts > 0] <- QBagg$Completions[QBagg$Attempts > 0] / QBagg$Attempts[QBagg$Attempts > 0]
QBagg$ydsPerAtt[QBagg$Attempts >0] <- QBagg$Yards[QBagg$Attempts >0] / QBagg$Attempts[QBagg$Attempts >0]
QBagg$tdPCT[QBagg$Attempts >0] <- QBagg$TD[QBagg$Attempts >0] / QBagg$Attempts[QBagg$Attempts >0]
QBagg$intPCT[QBagg$Attempts >0] <- QBagg$Int[QBagg$Attempts >0] / QBagg$Attempts[QBagg$Attempts >0]

## Not QB
QBagg <- QBagg[QBagg$Player != "Isaiah Stanback",]
QBagg <- QBagg[QBagg$Player != "Tory Woodbury",]

# Set NAs to zero
QBagg[c(10,11,12,13)][is.na(QBagg[c(10,11,12,13)])] <- 0


# Process Combine data

# Remove unneeded columns and search combine data for inconsistencies
QBcuts <- QBcuts[-c(12, 13, 16, 26, 27, 28)]


# Before combine, search combine & wins data for inconsistencies
QBtemp <- QBcuts
QBtemp$warning <- 1

QBtemp[c(12,13,14,15,16,17,18,19,20,21,22,23)][is.na(QBtemp[c(12,13,14,15,16,17,18,19,20,21,22,23)])] <- 0

for (j in 12:22){
  for (i in 2:(length(QBtemp))){
    if (QBtemp$Player[i] == QBtemp$Player[i-1])
      if (QBtemp[i, j] != QBtemp[i-1, j])
        QBtemp$warning[i] <- 999
  }
}


#Height check
for (i in 2:(length(QBtemp))){
  if (QBtemp$Player[i] == QBtemp$Player[i-1])
    if (QBtemp$Height_IN[i] != QBtemp$Height_IN[i-1])
      QBtemp$warning[i] <- 999
}

View(QBtemp)

# End seach

# Make corrections
QBcuts$Bench_Press[QBcuts$Player == "Aaron Brooks"] <- 35.5



# Keep first instance of predictor data
#######t.first <- species[match(unique(species$Taxa), species$Taxa),]
combineData <- QBcuts[match(unique(QBcuts$Player), QBcuts$Player),]
View(combineData[order(combineData$Player),])

nrow(QBcuts)
nrow(combineData)
nrow(QBagg)

# Merge files

QBdata <- merge(QBagg, combineData[c(2,10,12,13,16,17,18,19,20,21,22)], by = "Player")

nrow(QBdata)
View(QBdata)

# Change zeros to NA in combine data
QBdata[c(17,18,19,20,21,22,23)][QBdata[c(17,18,19,20,21,22,23)] == 0] <- NA



  # Code for missing data
# No Combine
for (i in 1 : (length(QBdata$Player))){
  if (is.na(QBdata[i,17]) && is.na(QBdata[i,18]) && is.na(QBdata[i,19]) && is.na(QBdata[i,20]) &&
    is.na(QBdata[i,21]) && is.na(QBdata[i,22]) && is.na(QBdata[i,23])) QBdata$CombineData[i] <- 0
  else QBdata$CombineData[i] <- 1
}

# Combine, but data missing
for (j in 17:23){
  for (i in 1 : (length(QBdata$Player))){
    if (QBdata[i,24] == 1) {
      if (is.na(QBdata[i,j])) QBdata[i,j+8] <- 0
      else QBdata[i,j+8] <- 1
    }
  }
}

# Name New Columns
colnames(QBdata)[25] <- "didWonder"
colnames(QBdata)[26] <- "did40"
colnames(QBdata)[27] <- "didBench"
colnames(QBdata)[28] <- "didVertLeap"
colnames(QBdata)[29] <- "didBroadJump"
colnames(QBdata)[30] <- "didShuttle"
colnames(QBdata)[31] <- "didCone"

setwd("~/PC Docs/Tableau Projects/Data Analysis/1. Cleaning and Processing")
write.csv(QBdata, "QBprocessed.csv", row.names = FALSE)




library(Hmisc)

rcorr(as.matrix(QBdata[c(9,10,11,12,13,14,15,16,24,25,26,27,29,29,30,31)]), type= "pearson")






