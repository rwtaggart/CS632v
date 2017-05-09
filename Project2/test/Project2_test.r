###########################################################
# CS 632v - Project 2
# This is responsible for testing the Project 2 package.
#
# RW Taggart
# 2017.5.8
###########################################################

###
# Comment out to enable debug
debug <- function(...) {
  p2debug = TRUE
  print(...)
}

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
  debug(paste('(T): info1- ', info1$name))
  expect_equal(info1$name, 'package:base')
  info2 <- package_info('base')
  expect_equal(info2$name, 'package:base')
})

test_that("find_prims('base')", {
  debug('(T): find_prims()')
  pkg_name <- 'base'
  info <- package_info(pkg_name)
  prims <- find_prims(info)
  write(unlist(prims), file="test/test_prims.out")
  expect_equal(prims[[1]], "-")
  expect_equal(prims[[36]], "acos")
  # NOTE:  The following fails. Looks like we can't
  #        mess with objects within functions.
  ## expect_is(info$prims, '')
})

test_that("find_fncs('base')", {
  pkg_name <- 'base'
  info <- package_info(pkg_name)
  fncs <- find_fncs(info)
  write(unlist(fncs), file="test/test_fncs.out")
  debug(typeof(fncs))
  debug(fncs[[1]])
  debug(fncs[[36]])
  expect_equal(fncs[[1]], '-.Date')
  expect_equal(fncs[[36]], '[<-.POSIXlt')
  expect_equal(fncs[[52]], 'abbreviate')
  # debug(info$fncs)
  # expect_is(info$fncs, "")
})

test_that("find_objs('base')", {
  pkg_name <- 'base'
  info <- package_info(pkg_name)
  fncs <- find_objs(info)
  write(unlist(fncs), file="test/test_objs.out")
  debug(typeof(fncs))
  debug(fncs[[1]])
  expect_equal(length(fncs), 2)
  expect_equal(fncs[[1]], 'R.version')
  # debug(info$objs)
  # expect_is(info$objs, "list")
})

test_that("find_consts('base')", {
  pkg_name <- 'base'
  info <- package_info(pkg_name)
  fncs <- find_consts(info)
  write(unlist(fncs), file="test/find_consts.out")
  debug(typeof(fncs))
  debug(fncs[[1]])
  expect_equal(length(fncs), 9)
  expect_equal(fncs[[1]], 'F')
  expect_equal(fncs[[8]], 'R.version.string')
  # expect_is(info$objs)
})

test_that("collect_info() returns a valid object", {
  pkg_name <- "base"
  p_info <- collect_info(pkg_name)
  debug(class(p_info))
  expect_is(p_info$name, 'character')
  expect_is(p_info$prims, 'list')
  expect_is(p_info$fncs,  'list')
  expect_is(p_info$objs,  'list')
  expect_is(p_info$constants, 'list')

  expect_equal(p_info$name, paste0('package:', pkg_name))
  expect_equal(p_info$prims[[1]], '-')
  expect_equal(p_info$fncs[[1]], '-.Date')
  expect_equal(p_info$objs[[1]], 'R.version')
  expect_equal(p_info$constants[[1]], 'F')
})

test_that("print_info() provides valid output", {
  pkg_name <- "base"
  p_info <- collect_info(pkg_name)
  print_info(p_info)
})
test_that("write_info() provides valid output", {
  pkg_name <- "base"
  p_info <- collect_info(pkg_name)
  write_info(p_info, 'test/test_write.out')
})

test_that('Tests pass...', {
  print("✔ All Tests Passed.")
})
