##' @description Get number of projects available in PRIDE
##' @name getProjectCount
##' @title Get number of projects in PRIDE database
##' @export
##' @examples
##' nPrideProjects <- getProjectCount()
getProjectCount <- function(query = NULL,
                            speciesFilter = NULL,
                            ptmsFilter = NULL,
                            tissueFilter = NULL,
                            diseaseFilter = NULL,
                            titleFilter = NULL,
                            instrumentFilter = NULL,
                            experimentTypeFilter = NULL,
                            quantificationFilter = NULL,
                            projectTagFilter = NULL){
  # base url
  # http://www.ebi.ac.uk:80/pride/ws/archive/project/count
  baseURL <- "http://www.ebi.ac.uk:80/pride/ws/archive/project/count"
  count <- connectionStatus(httr::GET(baseURL))
  cat(paste0(Sys.time(),'\n'))
  cat(paste0('Number of PRIDE projects = ',count,'\n'))
  return(count)
}
