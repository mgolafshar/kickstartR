
#' Load all needed packages succinctly
#'
#' @param pkg A comma separated list of package names .
#' @param reinstall A logical indicating whether all of the packages provided should be installed or re-installed. Defalut is FALSE.
#' @param repos A character string indicating the CRAN repos to use to install packages. Default is repos = "https://cloud.r-project.org/".
#' @param quiet A logical passed to install.packages for a quiet install. Default is TRUE.
#' @author Matthew Buras
#' @examples
#'
#'Load collections by type of analysis?
#'Print message with packages installed

#'Can feed package list in c() form
#'Ex1: c("arsenal", "rpart", "survival") or as
#'a character string separated by a single space
#'Ex2: "arsenal rpart survival"
#' @export

packages <- function(pkg, reinstall=FALSE, repos = "https://cloud.r-project.org/", quiet = TRUE){
  if (length(pkg)){
    pkg <- gsub("\\s+"," ",pkg)
    pkg <- strsplit(pkg, split = " ", fixed = TRUE)
    pkg <- dput(unlist(pkg))

    if(reinstall==FALSE){
      new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
      if (length(new.pkg)){
        install.packages(new.pkg, dependencies = TRUE, quiet = quiet, repos = repos)
      }
      sapply(pkg, require, character.only = TRUE)
    }

    else{
      install.packages(pkg, dependencies = TRUE, quiet = quiet, repos = repos)
      sapply(pkg, require, character.only = TRUE)
      }
    }
  }



