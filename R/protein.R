get.project.protein <- function(accession = 'PXD000001',show=10000){
  if(show > 10000){
    show <- 10000
  }
  baseURL <- paste0(
    'https://www.ebi.ac.uk:443/pride/ws/archive/protein/list/project/',
    accession,
    '?show=',
    show
    )
  p.count <- get.project.protein.count(accession)
  cat(paste0('No. of proteins ',p.count,'\n'))
  if(p.count > show){
    nIter <- seq(
      1,
      p.count,
      show)[-1]
    # pages to traverse
    nPages <- length(nIter)
  }else{
    nPages <- 0
  }
  proteinPerPage <- list()
  # page starts from 0
  for(i in 0:nPages){
    cur.url <- paste0(
      baseURL,
      '&page=',
      i
      )
    proteinList <- connectionStatus(httr::GET(cur.url))[[1]]
    cat(paste0('Page ', i+1, '\n'))
    proteinPerPage[[i+1]] <- proteinList
    cat(paste0('Number of results = ',length(proteinList), '\n'))

  }
  allProteins <- c()
  for(i in 1:length(proteinPerPage)){
    allProteins <- append(allProteins, proteinPerPage[[i]])
  }
  return(allProteins)
}

get.project.protein.count <- function(accession = 'PXD000001'){
  baseURL <- 'https://www.ebi.ac.uk:443/pride/ws/archive/protein/count/project/'
  url <- paste0(
    baseURL,
    accession
  )
  queryContent <- connectionStatus(resposeServer = httr::GET(url))[[1]]
  return(queryContent)
}

get.protein.by.project <- function(
  protein.accession = 'P38398',
  project.accession = 'PXD001536'
  ){
  baseURL <- 'https://www.ebi.ac.uk:443/pride/ws/archive/protein/list/project/'
  url <- paste0(
    baseURL,
    project.accession,
    '/protein/',
    protein.accession
  )
  queryContent <- connectionStatus(resposeServer = httr::GET(url))[[1]]
  return(queryContent)
}

get.protein.count.by.project <- function(
  protein.accession = 'P38398',
  project.accession = 'PXD001536'
){
  baseURL <- 'https://www.ebi.ac.uk:443/pride/ws/archive/protein/count/project/'
  url <- paste0(
    baseURL,
    project.accession,
    '/protein/',
    protein.accession
  )
  queryContent <- connectionStatus(resposeServer = httr::GET(url))[[1]]
  return(queryContent)
}

get.protein.by.assay <- function(
  assay.accession = '22134',
  show = 200
){
  baseURL <- paste0(
    'https://www.ebi.ac.uk:443/pride/ws/archive/protein/list/assay/',
    assay.accession,
    '?show=',
    show)
  p.count <- get.protein.count.by.assay(assay.accession)
  cat(paste0('No. of proteins ',p.count,'\n'))
  if(p.count > show){
    nIter <- seq(
      1,
      p.count,
      show)[-1]
    # pages to traverse
    nPages <- length(nIter)
  }else{
    nPages <- 0
  }
  proteinPerPage <- list()
  # page starts from 0
  for(i in 0:nPages){
    cur.url <- paste0(
      baseURL,
      '&page=',
      i
    )
    proteinList <- connectionStatus(httr::GET(cur.url))[[1]]
    cat(paste0('Page ', i+1, '\n'))
    proteinPerPage[[i+1]] <- proteinList
    cat(paste0('Number of results = ',length(proteinList), '\n'))

  }
  allProteins <- c()
  for(i in 1:length(proteinPerPage)){
    allProteins <- append(allProteins, proteinPerPage[[i]])
  }
  return(allProteins)
}

get.protein.count.by.assay <- function(
  assay.accession = '22134'
){
  baseURL <- 'https://www.ebi.ac.uk:443/pride/ws/archive/protein/count/assay/'
  url <- paste0(
    baseURL,
    assay.accession
  )
  queryContent <- connectionStatus(resposeServer = httr::GET(url))[[1]]
  return(queryContent)
}
