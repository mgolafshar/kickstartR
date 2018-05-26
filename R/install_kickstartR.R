
#' Load kickstartR without having to manually install devtools
#'
#' @param none A comma separated list of package names .
#' @author Matthew Buras
#' @examples
#' @export

install_kickstartR <- function(){
  if(require(devtools)==FALSE){
    install.packages("devtools", quiet = TRUE)
    library(devtools)
  }
  if(require(kickstartR)==FALSE){
    install_github("mgolafshar/kickstartR")
    library(kickstartR)
  }
}

