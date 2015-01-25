---
title: "README.md"
author: "Peter Nestorov"
date: "1/25/2015"
output: html_document
---

*Description*
The repo contains the R script "run_analysis.R" for extracting and processing 
data from the UCI Human Activity Recognition project (UCI HAR), as well as the 
CodeBook explaining the output data file. Briefly, data was downloaded and
the two subsets "test" and "train" were merged and annotated accordingly. 
Subsequently, the dataset was grouped by type of activity and subject and for
each activity and subject the mean of all mean and standard deviation measurments
was computed and returned in a tidy data frame as an output.

*Instruction for running the script*
The zip file containing the raw data should be downloaded into a folder "data",
which should be set as the working directory.

*Source:*

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy.
activityrecognition '@' smartlab.ws
www.smartlab.ws


*System info*
R version 3.1.1 (2014-07-10)
Platform: x86_64-unknown-linux-gnu (64-bit)

locale:
 [1] LC_CTYPE=en_US.UTF-8 LC_NUMERIC=C         LC_TIME=C            LC_COLLATE=C        
 [5] LC_MONETARY=C        LC_MESSAGES=C        LC_PAPER=C           LC_NAME=C           
 [9] LC_ADDRESS=C         LC_TELEPHONE=C       LC_MEASUREMENT=C     LC_IDENTIFICATION=C 

attached base packages:
 [1] splines   grid      tcltk     stats     graphics  grDevices utils     datasets  methods  
[10] base     

other attached packages:
 [1] data.table_1.9.4      Hmisc_3.14-5          Formula_1.1-2         survival_2.37-7      
 [5] lattice_0.20-29       jpeg_0.1-8            dplyr_0.4.1           XML_3.98-1.1         
 [9] sqldf_0.4-7.1         RSQLite.extfuns_0.0.1 RSQLite_0.11.4        DBI_0.3.1            
[13] gsubfn_0.6-6          proto_0.3-10          httpuv_1.3.2          httr_0.5             

loaded via a namespace (and not attached):
 [1] RColorBrewer_1.0-5  Rcpp_0.11.3         acepack_1.3-3.3     assertthat_0.1     
 [5] chron_2.3-45        cluster_1.15.3      foreign_0.8-61      latticeExtra_0.6-26
 [9] magrittr_1.0.1      nnet_7.3-8          parallel_3.1.1      plyr_1.8.1         
[13] reshape2_1.4        rpart_4.1-8         stringr_0.6.2       tools_3.1.1        
 