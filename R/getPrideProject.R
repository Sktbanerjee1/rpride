##' @name getPrideProject
##' @title Get a Project information from PRIDE
##' @description Get a project information based on pride ID from PRIDE database
##' @author RINTU KUTUM
##' @export
##' @examples
##' pxd = "PXD004083"
##' pp <- getPrideProject(pxd)

getPrideProject <- function(pxd){
  link <- paste0('http://www.ebi.ac.uk:80/pride/ws/archive/project/',pxd)
  #----------
  if (!requireNamespace("httr", quietly = TRUE)) {
    stop("Pkg needed for this function to work. Please install it.",
         call. = FALSE)
  }
  #----------
  contentPRIDE <- httr::GET(link)
  queryContent <- connectionStatus(contentPRIDE)
  return(queryContent)
}
