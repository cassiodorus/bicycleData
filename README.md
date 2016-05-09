# README.md  
David Hopp  
2016-05-08
## Code For Durham Bicycle Safety Project  

This is curated data for the CodeForAmerica Durham NC Bicycle Safety project. The curation starts with the data from [North_Carolina_Bicycle_Crash_Data.csv.gz](https://github.com/BikeSafety/BikeSafety/blob/master/data/North_Carolina_Bicycle_Crash_Data.csv.gz).

The R markdown scripts were run against that file and the result is the **rawDataFixedMiss.csv** file. The primary effects were to use NA to replace a clutter of designations of missing data, and to remove 13 records that appeared unreliable. All changes are documented in the R scripts.