# README.md  
David Hopp  
2016-05-13
## Code For Durham Bicycle Safety Project  

This is curated data for the CodeForAmerica Durham NC Bicycle Safety project. The curation starts with the data from [North_Carolina_Bicycle_Crash_Data.csv.gz](https://github.com/BikeSafety/BikeSafety/blob/master/data/North_Carolina_Bicycle_Crash_Data.csv.gz).

The R markdown script **script_A00_readfile.Rmd** was run against that file and the result is the **rawDataFixedMiss_MD.csv** file. The primary effects were to use NA to replace a clutter of designations of missing data, and to remove 13 records that appeared unreliable. All changes are documented in the R scripts.

**script_compare_old_and_new.Rmd** may be run to compare a new version of the remote file with a version already used locally.
This requires the 'old' version to be in the R project as data frame rawData. This can be accomplished by loading bicycleSafetyData_MD.RData