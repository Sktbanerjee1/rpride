##' @name get.project.assay
##' @title Get a Project information from PRIDE
##' @description Get a project information based on pride ID from PRIDE database
##' @author RINTU KUTUM
##' @export
get.project.assay <- function(accession = 'PXD000001'){
  baseURL <- 'https://www.ebi.ac.uk:443/pride/ws/archive/assay/list/project/'
  url <- paste0(
    baseURL,
    accession
    )
  queryContent <- connectionStatus(resposeServer = httr::GET(url))[[1]]
  return(queryContent)
}

##' @name get.project.assay.count
##' @title Get a Project information from PRIDE
##' @description Get a project information based on pride ID from PRIDE database
##' @author RINTU KUTUM
##' @export

get.project.assay.count <- function(accession = 'PXD000001'){
  baseURL <- 'https://www.ebi.ac.uk:443/pride/ws/archive/assay/count/project/'
  url <- paste0(
    baseURL,
    accession
  )
  queryContent <- connectionStatus(resposeServer = httr::GET(url))
  return(queryContent)
}

##' @name get.assay
##' @title Get a Project information from PRIDE
##' @description Get a project information based on pride ID from PRIDE database
##' @author RINTU KUTUM
##' @export

get.assay <- function(assay.accession = '22134'){
  baseURL <- 'https://www.ebi.ac.uk:443/pride/ws/archive/assay/'
  url <- paste0(
    baseURL,
    assay.accession
  )
  queryContent <- connectionStatus(resposeServer = httr::GET(url))
  return(queryContent)
}
