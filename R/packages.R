
#' Load all needed packages succinctly
#'
#' @param pkg A comma separated list of package names .
#' @param reinstall A logical indicating whether all of the packages provided should be installed or re-installed. Defalut is FALSE.
#' @param mirror A character string indicating the CRAN mirror to use to install packages. Default is mirror = "https://cloud.r-project.org/".
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

packages <- function(pkg, reinstall=FALSE, mirror = "https://cloud.r-project.org/", quiet = TRUE){
  if (length(pkg)){
    pkg <- gsub("\\s+"," ",pkg)
    pkg <- strsplit(pkg, split = " ", fixed = TRUE)
    pkg <- dput(unlist(pkg))

    if(reinstall==FALSE){
      new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
      if (length(new.pkg)){
        install.packages(new.pkg, dependencies = TRUE, quiet = quiet, repos = mirror)
      }
      sapply(pkg, require, character.only = TRUE)
    }

    else{
      install.packages(pkg, dependencies = TRUE, quiet = quiet, repos = mirror)
      sapply(pkg, require, character.only = TRUE)
      }
    }
  }



