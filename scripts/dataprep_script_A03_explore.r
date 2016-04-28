# ############################################
# David Hopp
# 4/23/2016
#
# CodeForDurham
# bicycle accident data
#
##############################################
# script_A03_explore.r
# data exploration
#
# observations
# ############################################################
# ############################################################
 #
 # BikeAge_Gr has 421 instances of "10-Jun" and 747 instances of "15-Nov"
 #
 # ###########################################################
 # ###########################################################
 #
 # BLANKS leading and trailing
 # (will use str_trim to remove them)
 #
 # there may be some entries that have trailing blanks
 # one way to find those is
 rawData_catmelt_trblank <- dplyr::filter(rawData_catmelt, str_detect(value," +$"))
 nrow(rawData_catmelt_trblank)
 [1] 860
unique(rawData_catmelt_trblank$variable)
[1] Crash_Type
reshape2::dcast(rawData_catmelt_trblank,value~variable)

                                      value Crash_Type
1              Bicyclist Failed to Clear -           3
2         Bicyclist Lost Control - Other /          37
3           Bicyclist Overtaking - Other /          33
4          Bicyclist Ride Out - Midblock -          84
5  Crossing Paths - Intersection - Other /          90
6      Crossing Paths - Midblock - Other /          16
7                                Head-On -           7
8          Motorist Drive Out - Midblock -          12
9          Motorist Lost Control - Other /          27
10           Motorist Overtaking - Other /         364
11         Motorist Turn / Merge - Other /           6
12                Parallel Paths - Other /          48
13  Sign-Controlled Intersection - Other /          43
14       Signalized Intersection - Other /          90  
 #
 # some may start with a blank
 rawData_catmelt_strblank <- dplyr::filter(rawData_catmelt, str_detect(value,"^ +"))
 nrow(rawData_catmelt_strblank)
[1] 909
reshape2::dcast(rawData_catmelt_strblank,value~variable)

            value Bike_Injur Crash_Loc Crash_Type Crsh_Sevri Drvr_Injur Drvr_VehTy
1  Approach Paths          0         0         54          0          0          0
2     Heavy Truck          0         0          0          0          0          4
3          Injury        136         0          0         31        666          0
4        Location          0         9          9          0          0          0
# ##################################################################
# ##################################################################
#
# there are 4 definitely undependable records in rawData: 
#				2902, 3188, 4108, 4620
# there are other records that look unreliable:
#				371, 846, 942, 1247, 1271, 1777, 2101, 2130, 2789
#
# there are records with dates in BikeAge_Gr
#				421 with value "10-Jun"
#				747 with value "15-Nov"
# this is some kind of systematic error
#
# ############################################
#
# records with empty columns:
# (same for trimmed value)
rawData_catcount[rawData_catcount$value=="",]
       variable value freq
3    BikeAge_Gr        112
19     Bike_Dir        276
31     Bike_Pos        249
47     Bike_Sex         96
1123 DrvrAge_Gr        759
1133   Drvr_Age        759
1198 Drvr_EstSp        475
1229   Drvr_Sex        758
1232 Drvr_VehTy        505
1260 Light_Cond          8
1271  Num_Lanes        319
1287 Rd_Charact         29
1297   Rd_Class         16
1306 Rd_Conditi         17
1314  Rd_Config         58
1319 Rd_Defects         26
1352 Rd_Surface         19
1366 Speed_Limi        287
# ############################################
#
# (same for trimmed value)
rawData_catcount[rawData_catcount$value=="/Missing",]
      variable    value freq
40   Bike_Race /Missing  131
1222 Drvr_Race /Missing  778
# ##########################################
#
# (same for trimmed value)
rawData_catcount[rawData_catcount$value=="Missing",]
       variable   value freq
16   Bike_Alc_D Missing   63
1195 Drvr_Alc_D Missing  632
1378 Traff_Cntr Missing  153
# #########################################
#
# City has 1297 entries with "None - Rural Crash" (may be acceptable)
#
#
# Crash_Loc has 9 entries with "Location" (makes no sense)
#
# ##########################################

 