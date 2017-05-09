###########################################################
# CS 632v - Project 2
# This is responsible for listing some info about a
# given package.
# RW Taggart
# 2017.5.8
###########################################################

package_info <- function(package) {
  print('(D): package_info()...')
  library(package, character.only=TRUE)
  if ( !grepl("package:", package) ) {
    package <- paste0("package:", package)
  }
  info <- list(name = package, attrs = c())
  class(info) <- "PackageInfo"
  info$objs <- ls(package)
  return(info)
}

# TODO: The next 3 functions are exatly the same, almost...
#       We should figure out a way to abstract them into one.
find_prims <- function(pkg_obj) {
  print('(D): find_prims()...')
  prims <- sapply(pkg_obj$objs, function(fnc){
    if (is.primitive(get(fnc))) {
      return (fnc)
    }
  })
  valid_items <- Filter(Negate(is.null), prims)
  pkg_obj$prims <- valid_items
  return (valid_items)
}

find_fncs <- function(pkg_obj) {
  print('(D): find_fncs()...')
  prims <- sapply(pkg_obj$objs, function(fnc){
    if ( is.function(get(fnc)) && !is.primitive(get(fnc)) ) {
      return (fnc)
    }
  })
  valid_items <- Filter(Negate(is.null), prims)
  pkg_obj$fncs <- valid_items
  return (valid_items)
}

find_objs <- function(pkg_obj) {
  print('(D): find_objs()...')
  # print(pkg_obj)
  prims <- sapply(pkg_obj$objs, function(fnc){
    # print(paste0('(D): prim ', str(get(fnc))))
    if (is.object(get(fnc))) {
      return (fnc)
    }
  })
  valid_items <- Filter(Negate(is.null), prims)
  pkg_obj$objs <- valid_items
  return (valid_items)
}

print_info <- function(package, info_obj) {
  idt <- 0
  paste_idt <- function(...) {
    return (paste0(indent_n(idt), ...))
  }
  indent_n <- function(n) {  # Simple indent function for formatting
    return (rep("\t", n))
  }
  print(paste_idt('(I): Showing info for <', package, '>'))
  idt <- idt + 1;


}
