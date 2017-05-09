###########################################################
# CS 632v - Project 2
# This is responsible for listing some info about a
# given package.
#
# RW Taggart
# 2017.5.8
###########################################################

package_info <- function(package) {
  debug('(D): package_info()...')
  library(package, character.only=TRUE)
  if ( !grepl("package:", package) ) {
    package <- paste0("package:", package)
  }
  info <- list(name = package, items = c(), objs=c(), fncs=c())
  class(info) <- "PackageInfo"
  info$items <- ls(package)
  return(info)
}

# TODO: The next 3 functions are exatly the same, almost...
#       We should figure out a way to abstract them into one.
# QUESTION:  Are these args copies of the objects?
find_prims <- function(pkg_obj) {
  debug('(D): find_prims()...')
  prims <- sapply(pkg_obj$items, function(fnc){
    if (is.primitive(get(fnc))) {
      return (fnc)
    }
  })
  valid_items <- Filter(Negate(is.null), prims)
  pkg_obj$prims <- valid_items  #FIXME:  This doesn't appear to do anything for us...
  return (valid_items)
}

find_fncs <- function(pkg_obj) {
  debug('(D): find_fncs()...')
  prims <- sapply(pkg_obj$items, function(fnc){
    if ( is.function(get(fnc)) && !is.primitive(get(fnc)) ) {
      return (fnc)
    }
  })
  valid_items <- Filter(Negate(is.null), prims)
  pkg_obj$fncs <- valid_items
  return (valid_items)
}

find_objs <- function(pkg_obj) {
  debug('(D): find_objs()...')
  # debug(pkg_obj)
  prims <- sapply(pkg_obj$items, function(fnc){
    # debug(paste0('(D): prim ', str(get(fnc))))
    if (is.object(get(fnc))) {
      return (fnc)
    }
  })
  valid_items <- Filter(Negate(is.null), prims)
  pkg_obj$objs <- valid_items
  return (valid_items)
}

find_consts <- function(pkg_obj) {
  debug('(D): find_consts()...')
  # debug(pkg_obj)
  prims <- sapply(pkg_obj$items, function(fnc){
    # debug(paste0('(D): prim ', str(get(fnc))))
    if (is.vector(get(fnc))) {
      return (fnc)
    }
  })
  valid_items <- Filter(Negate(is.null), prims)
  pkg_obj$objs <- valid_items
  return (valid_items)
}

print_info <- function(p_info) {
  output_info(p_info, cat)
}

write_info <- function(p_info, file_name) {
  f_write <- function(...) {
    cat(..., file = file_name, append = TRUE)
  }
  write('', file=file_name)
  output_info(p_info, f_write)
}

output_info <- function(p_info, stream) {
  debug('(D): print_info()...')
  stream('(I): Showing info for <', p_info$name, '>', '\n', sep="")

  stream('\t', 'Primative Functions', '\n')
  stream(unlist(p_info$prims), sep=", ", '\n')

  stream('\t', 'Non-Primative Functions', '\n')
  stream(unlist(p_info$fncs), sep=", ", '\n')

  stream('\t', 'Constants', '\n')
  stream(unlist(p_info$constants), sep=", ", '\n')

  stream('\t', 'Objects', '\n')
  stream(unlist(p_info$objs), sep=", ", '\n')
}


#' Main function to query package information
#'
#' @param package_name The name of the package.
#' @return class('PackageInfo') An object of the type "PackageInfo"
#'   $name, $prims, $fncs, $objs, $constants
collect_info <- function(package_name) {
  debug('(D): collect_info()...')
  info <- package_info(package_name)
  debug(class(info))
  info$prims <- find_prims(info)
  info$fncs  <- find_fncs(info)
  info$objs  <- find_objs(info)
  info$constants <- find_consts(info)
  return(info)
}

if ( !exists("p2debug") ) {
  debug <- function(...) {
    # print(...)
  }
}
