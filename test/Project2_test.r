###########################################################
# CS 632v - Project 2
# This is responsible for testing the Project 2 package.
# RW Taggart
# 2017.5.8
###########################################################

library(testthat)
context("Project 2")

test_that("Source Project2.r file", {
  source('Project2.r')
})

test_that("Package Info class properly defined", {
  info <- package_info('utils')
  expect_is(info, "PackageInfo")
  expect_equal(info$name, 'package:utils')
})

test_that('Package car works...', {
  info <- package_info('car')
  expect_is(info, "PackageInfo")
  expect_equal(info$name, 'package:car')
})

test_that("Validate package names", {
  info1 <- package_info('base')
  print(paste('(T): info1- ', info1$name))
  expect_equal(info1$name, 'package:base')
  info2 <- package_info('base')
  expect_equal(info2$name, 'package:base')
})

test_that("find_prims('base')", {
  print('(T): find_prims()')
  pkg_name <- 'base'
  info <- package_info(pkg_name)
  prims <- find_prims(info)
  write(unlist(prims), file="test/test_prims.out")
  expect_equal(prims[[1]], "-")
  expect_equal(prims[[36]], "acos")
  expect_is(info$prims, '')

  # TODO: Stuff the bottom stuff somewhere...
  # print('(T): find_prims- ')
  # items <- unlist(prims)
  # print(paste0(items, sep=", "))
  # cat(items, sep=", ")
})

test_that("find_fncs('base')", {
  pkg_name <- 'base'
  info <- package_info(pkg_name)
  fncs <- find_fncs(info)
  write(unlist(fncs), file="test/test_fncs.out")
  print(typeof(fncs))
  print(fncs[[1]])
  print(fncs[[36]])
  expect_equal(fncs[[1]], '-.Date')
  expect_equal(fncs[[36]], '[<-.POSIXlt')
  expect_equal(fncs[[52]], 'abbreviate')
  expect_is(info$fncs, "")
})

test_that("find_objs('base')", {
  pkg_name <- 'base'
  info <- package_info(pkg_name)
  fncs <- find_objs(info)
  write(unlist(fncs), file="test/test_objs.out")
  print(typeof(fncs))
  print(fncs[[1]])
  expect_equal(length(fncs), 2)
  expect_equal(fncs[[1]], 'R.version')
  expect_is(info$objs)
})
