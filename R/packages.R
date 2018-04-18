
#' Create project folder with preset or user given sub folders and a README file.
#'
#' @param pkg A comma separated list of package names .
#' @param default (optional) Load default set of libraries. Default is set to TRUE
#'                Default libraries include:
#'                    Tidyverse - suite of data cleaning and manipulation tools
#'                    Arsenal - functions for large-scale statistical summaries
#'                    others????
#' @param group (optional) Set of additional libraries to load for specific tasks
#'               i.e. viz, predict, descriptive, trees, ???
#' @author Matthew Buras
#' @examples
#' # load default packages
#' packages()
#'
#' # load user defined package list
#'packages(rpart, pROC, rattle, rpart.plot, randomForest, caret) # Can we load without quotes???
#'
#'#' # load group without default package
#'packages(group = "viz", default = FALSE)
#' @export


#Load collections by type of analysis?
#Print message with packages installed

packages <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}


