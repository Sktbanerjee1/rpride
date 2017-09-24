##' @description Get minimal information about PRIDE database
##' @title Minimal information available via PRIDE-api
##' @name getAllPrideProject
##' @author RINTU KUTUM
##' @export
##' @examples
##' prideProjects <- getAllPrideProject()

getAllPrideProject <- function(resultsPerPage = 100){
  count <- getProjectCount()
  nIter <- seq(1, count, resultsPerPage)[-1]
  #-----
  # pages to traverse
  nPages <- length(nIter)
  projectPerPage <- list()
  # page starts from 0
  for(i in 0:nPages){
    projectList <- getProjectList(resultsPerPage = resultsPerPage,
                                  page = i)
    cat(paste0('Page ', i, '\n'))
    # as i = 0
    # index should be 1 = i + 1
    projectPerPage[[i+1]] <- projectList
    cat(paste0('Number of results = ',length(projectList), '\n'))
    #-----
    # sleep for few seconds
    Sys.sleep(0.2)
  }
  allProjects <- c()
  for(i in 1:length(projectPerPage)){
    allProjects <- append(allProjects, projectPerPage[[i]])
  }
  cat(paste0(Sys.time(),'\n'))
  cat(paste0('Number of PRIDE projects downloaded = ',count,'\n'))
  return(allProjects)
}
