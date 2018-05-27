
#' Load all needed packages succinctly
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


#'Load collections by type of analysis?
#'Print message with packages installed

#'Can feed package list in c() form
#'Ex1: c("tidyverse", "ggpubr", "summarytools") or as
#'a character string separated by a single space
#'Ex2: "tidyverse ggpubr summarytools"

#'Only issue with code below is that if you have to restart
#'your R session it will auto recall the function as
#'packages2(pkg, reinstall = TRUE) after the session
#'reinitializes. If that happens all you have to do is
#'resubmit the function as it was before refreshing the R
#'session and it will work.
#'
#'This can be avoided by entering the list of packages in the
#'function call.
#'
#'In otherwords don't do the following.
#'pkglist <- "tidyverse summarytools"
#'packages(pkglist)
#'Instead do packages("tidyverse summarytools")

packages <- function(pkg, reinstall=FALSE, mirror){
  if(reinstall==FALSE){
    pkg <- strsplit(pkg, split = " ", fixed = TRUE)
    pkg <- dput(unlist(pkg))
    new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
    if (length(new.pkg)){
      if (length(mirror)){
        install.packages(new.pkg, dependencies = TRUE, repos = mirror)
      }
      install.packages(new.pkg, dependencies = TRUE)
    }
    sapply(pkg, require, character.only = TRUE)
  }
  else{
    if (length(mirror)){
      install.packages(pkg, dependencies = TRUE, repos = mirror)
      sapply(pkg, require, character.only = TRUE)
    }
    install.packages(pkg, dependencies = TRUE)
    sapply(pkg, require, character.only = TRUE)
  }
}

