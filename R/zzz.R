##' @description  Check for status and display necessary errors and results
##' @title connectionStatus
##' @name connectionStatus
connectionStatus <- function(resposeServer){
  status <- resposeServer$status_code
  if(status == 200){
    # remove response
    # cat('Respose >>>> "OK"\n')
    queryContent <- httr::content(resposeServer)
    return(queryContent)
  }
  if(status == 401){
    message("Unauthorized content requested!")
    # not available
    return(NA)
  }
  if(status == 403){
    message("Forbidden content requested!")
    return(NA)
  }
  if(status == 404){
    message("Content requested was not found!\n")
    return(NA)
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

formatLabHeads <- function(x){
  labHeadName <- paste(x$labHeads[[1]][c('title','firstName', 'lastName')], collapse = ' ')
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

submitterName <- function(x){
  y <- paste(gsub(' ','',x$submitter[c('title','firstName','lastName')]),collapse = ' ')
  return(y)
}



