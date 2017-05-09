# CS632v - Project 2
The objective of this project is to show the available functions and objects
that exist within a package.
This project can be run in a few ways.

# How to Use
## Run It
You can run an example script which will load the `package:car` library and list the functions and objects associated with it. It will write that information out to `./car.out`:

`$ Rscript run_project2.r`  

## Testing
The following will run the unit tests:  
`$Rscript test/Project2_test.r`


## PackageInfo
`Project2.r` can be sourced to access the PackageInfo class:  

| PackageInfo | |
|---| --- |
| +collect_info() | +write_info()
| +print_info() | |
| -package_info() | -find_prims()
| -find_fncs() | -find_objs()  |
| -find_consts() | -output_info() |
