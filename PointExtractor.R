#Writen by EBG
#The MIT License (MIT)
#Copyright (c) 2016 Evan B. Goldstein

#This part of the code lodes the neccesary libraries
library(sp)
library(rgdal)
library(raster)


#this part of the code sets the working directory to a
#folder on your desktop called 'KiteDSM'

setwd("~/Desktop/KiteDSM")

#Load up the DSM from may (make sure it has this title)
DSM <- raster("15May7GCPsC.tif")

#IF you need to tile your DEM...
# r1 <- raster("May.GCP.DEMs/10GCP_1.tif")
# r2 <- raster("May.GCP.DEMs/10GCP_2.tif")
# r3 <- raster("May.GCP.DEMs/10GCP_3.tif")
# r4 <- raster("May.GCP.DEMs/10GCP_4.tif")
# DSM <- merge(r1, r2, r3, r4)


#display it as an image (just to check)
image(DSM)

#load the XY points that you want to query an elevation (from the SfM DSM)
QPoints = read.csv("MAY15qp.csv")
#find the point locations in the DSM raster and export the elevations
QP <- extract(DSM, QPoints)
#write the exported SfM-DSM elevations at the specific points to a csv file
write.csv(QP,"MAY15qp.csv")
