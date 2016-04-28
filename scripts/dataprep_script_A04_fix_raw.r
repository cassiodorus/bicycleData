# ############################################
# David Hopp
# 4/23/2016
#
# CodeForDurham
# bicycle accident data
#
##############################################
# script_A04_fix_raw.r
# data exploration
#
# "Fix" rawData on basis of script_A03_explore.rawData
#
# result is df rawDataFixedMiss  <<<<<<<<<<<<<<<<<<<<<<
#
# SPECIAL TREATMENT OF COLUMNS Longitude and Location
# zeroes appear in both, as 0 and 0.00000 for Longitude
# and (0, 0) for Location (watch out for the space)
# these are best replaced with NA but that depends on 
# how Location is handled in the subsequent processing programs.
# For now, replace with NA
#
# #############################################
# 
# create df rawDataFixed
#
rawDataFixed <- rawData
nrow(rawDataFixed)
[1] 5716
#
# remove suspicious rows <<<<<<<<<<<<<<
#
rawDataFixed <- rawDataFixed[ -c(2902, 3188, 4108, 4620,371, 846, 942, 1247, 1271, 1777, 2101, 2130, 2789), , drop=FALSE]
nrow(rawDataFixed)
[1] 5703
# #############################################
#
# trim text fields <<<<<<<<<<<<<<<<<<<
#
mycols <- c("Bike_Injur","Crash_Loc","Crash_Type","Crsh_Sevri","Drvr_Injur","Drvr_VehTy")
#
rawDataFixed[mycols] <- lapply( rawDataFixed[mycols], function(x) str_trim(x) )
nrow(rawDataFixed)
[1] 5703
#
# ###############################################
#
# go through prep steps for categorical variables
# using rawDataFixed as the basis
#
rawDataFixed_cat <- dplyr::select( rawDataFixed, one_of(catcol_rawData) )
#
 rawDataFixed_catmelt <- reshape2::melt(rawDataFixed_cat,id="OBJECTID")
 rawDataFixed_catcount <- plyr::count( rawDataFixed_catmelt, vars=c("variable","value") )
 #
 nrow(rawDataFixed_catmelt)
 [1] 273744
 nrow(rawDataFixed_catcount)
 [1] 1369
 #
 rawDataFixed_catmelt_trblank <- dplyr::filter(rawDataFixed_catmelt, str_detect(value," +$"))
 #
 # YES! exactly as it should be:
 nrow(rawDataFixed_catmelt_trblank)
 [1] 0
 # ###############################################
 # ###############################################
 # fix missing values
 # replace with NA
 #
 rawDataFixedMiss <- rawDataFixed
 rawDataFixedMiss[rawDataFixedMiss=="" | rawDataFixedMiss=="." | rawDataFixedMiss=="Missing" | rawDataFixedMiss=="/Missing"] <- NA
 nrow(rawDataFixedMiss)
 [1] 5703
 # ###############################################################################
 # fix Longitude and Location - replace zeros with NA
 #
 sum(rawDataFixedMiss$Location=="(0, 0)")
 [1] 1014
 rawDataFixedMiss$Location[rawDataFixedMiss$Location=="(0, 0)"] <- NA
 sum(is.na(rawDataFixedMiss$Location))
 [1] 1014
 #
 sum(rawDataFixedMiss$Longitude==0)
 [1] 1014
 rawDataFixedMiss$Longitude[rawDataFixedMiss$Longitude==0] <- NA
 sum(is.na(rawDataFixedMiss$Longitude))
 [1] 1014
 # ###############################################################################
 #
 # look closely at the categorical variables
 rawDataFixedMiss_cat <- dplyr::select( rawDataFixedMiss, one_of(catcol_rawData) )
 rawDataFixedMiss_catmelt <- reshape2::melt(rawDataFixedMiss_cat,id="OBJECTID")
 rawDataFixedMiss_catcount <- plyr::count( rawDataFixedMiss_catmelt, vars=c("variable","value") )
 nrow(rawDataFixedMiss_catmelt)
 [1] 273744
 nrow(rawDataFixedMiss_catcount)
 [1] 1368	# redundant entries Missing and /Missing
 # ###############################################
 # noted in passing
 #
 # there are 4 Workzone_I entries with "No0" instead of "No"
 # There is 1 Crash_Loc with "Location" and 1 Crash_Type with "Location"
 #
 rawDataFixedMiss[rawDataFixedMiss=="Location"] <- NA
 rawDataFixedMiss[rawDataFixedMiss=="No0"] <- "No"
 #
 nrow(rawDataFixedMiss_catmelt)
 [1] 273744
 nrow(rawDataFixedMiss_catcount)
 [1] 1367
 # ##################################################
 # ##################################################
 # THE FINAL PRODUCT OF THIS IS rawDataFixedMiss
 # ##################################################
 # ##################################################
 # save it
 save(rawDataFixedMiss,file="rawDataFixedMiss.RData")
 #
 # write as tab delim file
 write.table(rawDataFixedMiss, "output/rawDataFixedMiss.csv", sep="\t")
 # #####################################################
 #              FINIS
 # #####################################################
