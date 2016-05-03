# ###################################################
# Durham NC Bicycle Safety data CodeForAmerica project
# David Hopp
# 4/29/16
#
# dataprep_script_A00_readfile.r
#
# read the csv file acquired from the github project
#
# ###################################################
#
# borrowed from Brian:
#
  strDownload <- "CrashData.csv.gz"  
  bikeSafetyURL <- "https://github.com/BikeSafety/BikeSafety/blob/master/data/North_Carolina_Bicycle_Crash_Data.csv.gz?raw=true"
  download.file(bikeSafetyURL, strDownload, mode="wb")
  rawData <- read.csv(gzfile(strDownload), stringsAsFactors = FALSE)
  unlink(strDownload)
  rawData %>% write.csv("RawData.csv", row.names = FALSE)
#  
nrow(rawData)
[1] 5716
# ###################################################
