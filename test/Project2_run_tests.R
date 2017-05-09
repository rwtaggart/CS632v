###########################################################
# CS 632v - Project 2
# This is responsible for running the tests.
# RW Taggart
# 2017.5.8
###########################################################

library(testthat)

# source('Project2_test.r')

test_results <- test_dir('.', reporter="summary")
test_results
