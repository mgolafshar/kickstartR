Overview
--------
`KickstartR` is a set of functions that are designed to make it easy to speed through the tedious startup stage of any new project. 
&nbsp;  

Installation
------------
 The development version of kickstartR can easily be downloaded from GitHub using the `devtools` package.

```
# install.packages("devtools")
devtools::install_github("mgolafshar/kickstartR")
```

Functions
------------  

### The `create.proj()` function
   
You've been handed an exciting project and are eager to dig in, but, before you can start writing code and exploring the data, you need to set up your project directories. The `create.proj()` function does it it for you. Simply feed it a path, project name and any number of subfolders, then, get to work.

##### _Example_
Create a project called "Project_x" on your desktop with 3 sub folders called "Mulder", "Scully" and "The_Truth", plus a blank README.md file:
```
create.proj(path = "~/Desktop", 
            parent = "Project_x", 
            sub = c("Mulder", "Scully", "The_Truth"), 
            doctype = "md")
```
&nbsp;  

### The `packages()` function  
  
`packages()` is a function that simplifies the process of loading multiple libraries. Feed the `packages()` function a list if packages, and it will load them all for you ( _including downloading them form CRAN if necessary_ ).



