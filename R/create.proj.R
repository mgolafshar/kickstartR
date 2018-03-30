
#' Create project folder with preset or user given sub folders and a README file.
#'
#' @param path A file path.
#' @param parent The project name. This becomes the top level folder for your project.
#' @param sub (optional) Sub folders to be created within your project folder.
#'     Default folders created are "code","data","deliverables" and "documents".
#'     User can supply any number of sub folders as a list c("folder1", "folder2").
#'     User supplied folders will overwrite the default options.
#'     For no subfolders, supply an empty list.
#' @param doctype (optional) Specify the type of document to be created as README.
#'     Defoult is "txt". Any valid document type (i.e. "md", "doc") can be supplied.
#' @param setwd (optional) Sets the newly created project as the working directory. Default is FALSE
#' @author Michael Golafshar
#' @examples
#' create.proj(path = "C:/Users/username/Desktop", parent = "my_new_project")
#'
#' #create a new folder with only 2 sub folders in it along with README.md. Then, set the new project as your working directory.
#' filepath <- "C:/Users/username/Desktop"
#' create.proj(path = filepath, parent = "Project_x", sub = c("Mulder", "Scully"), doctype = "md", setwd = TRUE)
#' @export

create.proj <- function(path,
                        parent,
                        sub = c("code","data","deliverables","documents"),
                        doctype = "txt",
                        setwd = FALSE) {
  ifelse(!dir.exists(file.path(path, parent)),
         dir.create(file.path(path, parent), showWarnings = F), FALSE)
  for (i in 1:length(sub))  {
    dir.create(paste(path,parent ,sub[i], sep="/"))
  }
  invisible(ifelse(file.exists(paste(path,parent, paste("README", doctype, sep = "."), sep = "/")), FALSE,
                   file.create(paste(path,parent, paste("README", doctype, sep = "."), sep = "/"))))
  invisible(ifelse(setwd == TRUE, setwd(file.path(path, parent)), FALSE))
}
