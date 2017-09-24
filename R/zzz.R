##' @description  Check for status and display necessary errors and results
##' @title connectionStatus
##' @name connectionStatus
connectionStatus <- function(resposeServer){
  status <- resposeServer$status_code
  if(status == 200){
    cat('Respose >>>> "OK"\n')
    queryContent <- httr::content(resposeServer)
    return(queryContent)
  }
  if(status == 401){
    stop("Unauthorized content requested!\n")
  }
  if(status == 403){
    stop("Forbidden content requested!\n")
  }
  if(status == 404){
    stop("Content requested was not found!\n")
  }
}

##' Beautification codes for content2df PRIDE json results to data.frame
pleural2single <- function(pleural){
  if(length(pleural) != 0){
    single <- paste(unlist(pleural), collapse=';')
  }else{
    single <- NA
  }
  return(single)
}

bindKeyWords<- function(keywords){
  return(gsub(', ',';',keywords))
}

formatLabHeads <- function(labHeads){
  labHeadName <- paste(labHeads[[1]][c('title','firstName', 'lastName')], collapse = ' ')
  return(labHeadName)
}

formatSubmitter <- function(submitter){
  submitterName <- paste(submitter[c('title','firstName', 'lastName')], collapse = ' ')
  return(submitterName)
}

null2na <- function(x){
  if(is.null(x)){
    return(NA)
  }else{
    return(x)
  }
}
