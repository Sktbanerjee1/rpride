##' @title get.project.file
##' @export get.project.file
get.project.file <- function(accession = 'PXD004149'){
  baseURL <- 'https://www.ebi.ac.uk:443/pride/ws/archive/file/list/project/'
  url <- paste0(
    baseURL,
    accession
  )
  queryContent <- connectionStatus(resposeServer = httr::GET(url))[[1]]
  return(queryContent)
}

##' @title get.project.file.count
##' @export get.project.file.count
get.project.file.count <- function(accession = 'PXD004149'){
  baseURL <- 'https://www.ebi.ac.uk:443/pride/ws/archive/file/count/project/'
  url <- paste0(
    baseURL,
    accession
  )
  queryContent <- connectionStatus(resposeServer = httr::GET(url))[[1]]
  return(queryContent)
}

get.assay.file <- function(assay.accession = '22134'){
  baseURL <- 'https://www.ebi.ac.uk:443/pride/ws/archive/file/list/assay/'
  url <- paste0(
    baseURL,
    assay.accession
  )
  queryContent <- connectionStatus(resposeServer = httr::GET(url))[[1]]
  return(queryContent)
}

get.assay.file.count <- function(assay.accession = '22134'){
  baseURL <- 'https://www.ebi.ac.uk:443/pride/ws/archive/file/count/assay/'
  url <- paste0(
    baseURL,
    assay.accession
  )
  queryContent <- connectionStatus(resposeServer = httr::GET(url))[[1]]
  return(queryContent)
}
