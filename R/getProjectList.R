##' @description Get all projects lised in PRIDE database
##' @title Get all Projects
##' @name getProjectList
getProjectList <- function(term = NULL,	# string
                           resultsPerPage = 100,	# integer
                           page = 0,	# integer
                           sort = NULL,	# string "score", "publication_date",
                           # id, project_title
                           order = TRUE,	# string; sorting order asc (ascending) or desc(descending)
                           taxonID = NULL,	# array[string]; NCBI taxon ID, 9606 for human
                           ptmsFilter = NULL,	# array[string]; PTM annotation phosphorylation
                           tissueFilter = NULL,	# array[string]; tissue annotation, brain
                           diseaseFilter = NULL,	# array[string]; disease annotation
                           titleFilter = NULL,	# array[string]; the title for keywords, "stress"
                           instrumentFilter = NULL, # array[string]; instrument names or keywords
                           experimentTypeFilter = NULL,	# array[string]; experiment type, shotgun
                           quantificationFilter = NULL,	# array[string]; quantification annotation, "label-free"
                           projectTagFilter = NULL	# array[string]; project tags, "Biomedical"
){
  # term
  if(is.null(term)){
    term <- ""
  }

  if(isTRUE(order)){
    # descending order
    order <- "desc"
  }else{
    # ascending order
    order <- "asc"
  }
  if(resultsPerPage > 500){
    stop(cat(paste0('******************************************************************\n',
                    '\tQuery of more than 500 results per page not allowed.\n',
                    '\tPlease proide less than or equal to 500 results.\n',
                    '******************************************************************\n')))
  }
  showResultsPerPage <- abs(as.integer(resultsPerPage))
  # base url
  # "http://www.ebi.ac.uk:80/pride/ws/archive/project/list?show=100&page=0&order=desc"
  link <- "http://www.ebi.ac.uk:80/pride/ws/archive/project/list?"
  queryLink <- paste0(link,
                      'show=', resultsPerPage,
                      '&',
                      'page=', page,
                      '&',
                      'order=', order)
  projectList <- connectionStatus(httr::GET(queryLink))[[1]]
  return(projectList)
}
