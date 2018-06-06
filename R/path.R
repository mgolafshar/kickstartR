
#' Set path
#'
#' @param parent (optional) The project name. This becomes the top level folder for your project.
#' @param sub (optional) Sub folders to within path to file.
#'     If more than one subfolder, user can supply sub folders as a list c("folder1", "folder2").
#'     Subfolders must listed be in the correct order from parent to file.
#' @param file Specify the file name
#' @author Matthew Buras, Michael Golafshar
#' @examples
#' path(mydata.csv)
#' df <- read.csv(path(ISHLT, c(data, subdata, subsubdata), mydata.csv))
#' @export

path <- function(parent = FALSE,subfolder = FALSE,
                 doc) {
  #get wd
  #paste wd, arg1, arg2 sep /
  #return string

}
