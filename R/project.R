##' @name get.project.detail
##' @title Get a Project information from PRIDE
##' @description Get a project information based on pride ID from PRIDE database
##' @author RINTU KUTUM
##' @export
##' @examples
##' pID = "PXD000561"
##' pp <- get.project.detail(pID)
get.project.detail <- function(accession){
  url <- paste0(
    'http://www.ebi.ac.uk:80/pride/ws/archive/project/',
    accession)
  content.proj <- httr::GET(url = url)
  queryContent <- connectionStatus(resposeServer = content.proj)
  return(queryContent)
}

##' @name get.pride.projects
##' @description Get all projects lised in PRIDE database
##' @title Get all Projects
##' @export
get.pride.projects <- function(
  query = NULL,	# string
  resultsPerPage = 100,	# integer
  # id, project_title
  order = 'desc',	# string; sorting order asc (ascending) or desc(descending)
  speciesFilter = NULL,	# array[string]; NCBI taxon ID, 9606 for human
  ptmsFilter = NULL,	# array[string]; PTM annotation phosphorylation
  tissueFilter = NULL,	# array[string]; tissue annotation, brain
  diseaseFilter = NULL,	# array[string]; disease annotation
  titleFilter = NULL,	# array[string]; the title for keywords, "stress"
  instrumentFilter = NULL, # array[string]; instrument names or keywords
  experimentTypeFilter = NULL,	# array[string]; experiment type, shotgun
  quantificationFilter = NULL,	# array[string]; quantification annotation, "label-free"
  projectTagFilter = NULL	# array[string]; project tags, "Biomedical"
){
  baseURL <- 'https://www.ebi.ac.uk:443/pride/ws/archive/project/list?'
  project.avail <- get.project.count(
    query,
    speciesFilter,
    ptmsFilter,
    tissueFilter,
    diseaseFilter,
    titleFilter,
    instrumentFilter,
    experimentTypeFilter,
    quantificationFilter,
    projectTagFilter
  )
  p.count <- as.numeric(project.avail['count'])
  if(length(grep('?',project.avail['url'])) != 0){
    query.c <- strsplit(project.avail['url'],split='\\?')[[1]][2]
    if(is.na(query.c)){
      query.c <- ''
    }
    baseURL <- paste0(
      baseURL,
      query.c,
      '&show=',
      resultsPerPage
    )
  }else{
    # do nothing
  }
  if(p.count > resultsPerPage){
    nIter <- seq(
      1,
      p.count,
      resultsPerPage)[-1]
    # pages to traverse
    nPages <- length(nIter)
  }else{
    nPages <- 0
  }
  if(nPages > 1){
    projectPerPage <- list()
    # page starts from 0
    ###################
    # library('progress')
    # pb <- progress_bar$new(
    #   format = paste0(" Downloading ", p.count," PRIDE projects"," [:bar] :percent in :elapsed"),
    #   total = nPages,
    #   clear = FALSE, width= 60)

    for(i in 0:nPages){
      message('Number of Pages dowloaded ',i+1,'/',nPages+1)
      cur.url <- paste0(
        baseURL,
        '&page=',
        i,
        '&order=',
        order)
      projectList <- connectionStatus(httr::GET(cur.url))[[1]]
      projectPerPage[[i+1]] <- projectList
    }

    allProjects <- c()
    for(i in 1:length(projectPerPage)){
      allProjects <- append(allProjects, projectPerPage[[i]])
    }
  }else{
    cur.url <- paste0(
      baseURL,
      '&page=',
      nPages,
      '&order=',
      order)
    allProjects <- connectionStatus(httr::GET(cur.url))[[1]]
  }

  #----
  project.df <- project.list2df(x = allProjects)
  return(project.df)

}

##' @name get.project.count
##' @description Get number of projects available in PRIDE
##' @title Get number of projects in PRIDE database
##' @export
##' @examples
##' nPrideProjects <- get.project.count()
get.project.count <- function(
  query = NULL,
  speciesFilter = NULL,
  ptmsFilter = NULL,
  tissueFilter = NULL,
  diseaseFilter = NULL,
  titleFilter = NULL,
  instrumentFilter = NULL,
  experimentTypeFilter = NULL,
  quantificationFilter = NULL,
  projectTagFilter = NULL
)
{
  # base url
  # http://www.ebi.ac.uk:80/pride/ws/archive/project/count
  baseURL <- "http://www.ebi.ac.uk:80/pride/ws/archive/project/count"
  #
  query.c <- generate.query.c(
    query,
    speciesFilter,
    ptmsFilter,
    tissueFilter,
    diseaseFilter,
    titleFilter,
    instrumentFilter,
    experimentTypeFilter,
    quantificationFilter,
    projectTagFilter
  )

  if(length(query.c) != 0){
    query.c <- paste(
      query.c,collapse = '&')
    baseURL <- paste0(
      baseURL,
      '?',
      query.c
    )
    baseURL <- gsub('[[:space:]]', '%20',baseURL)
  }else{

  }
  count <- connectionStatus(httr::GET(baseURL))
  #cat(paste0('Number of PRIDE projects = ',count,'\n'))
  return(c(count=count,
           url = baseURL))
}
