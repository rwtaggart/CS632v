###########################################################
# Use this file to run the Project 2 R script.
#
# RW Taggart
# 2017.5.8
###########################################################

source('Project2.r')

message('(I): Writing info for <package:car> to ./car.out...')
p_info <- collect_info('car')
write_info(p_info, file="car.out")
