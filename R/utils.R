
check.var <- function(var.name,var.value,status=NULL){
  if(is.null(status)){
    var.name <- NA
  }else{
    var.name <- paste0(
      var.name,
      '=',
      var.value
    )
  }
  return(var.name)
}

generate.query.c <- function(
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

){
  query <- check.var(
    var.name = 'query',
    var.value = query,
    status = query)

  speciesFilter <- check.var(
    var.name = 'speciesFilter',
    var.value = speciesFilter,
    status = speciesFilter)

  ptmsFilter <- check.var(
    var.name = 'ptmsFilter',
    var.value = ptmsFilter,
    status = ptmsFilter)

  tissueFilter <- check.var(
    var.name = 'tissueFilter',
    var.value = tissueFilter,
    status = tissueFilter)

  diseaseFilter <- check.var(
    var.name = 'diseaseFilter',
    var.value = diseaseFilter,
    status = diseaseFilter)

  titleFilter <- check.var(
    var.name = 'titleFilter',
    var.value = titleFilter,
    status = titleFilter)

  instrumentFilter <- check.var(
    var.name = 'instrumentFilter',
    var.value = instrumentFilter,
    status = instrumentFilter)

  experimentTypeFilter <- check.var(
    var.name = 'experimentTypeFilter',
    var.value = experimentTypeFilter,
    status = experimentTypeFilter)

  quantificationFilter <- check.var(
    var.name = 'quantificationFilter',
    var.value = quantificationFilter,
    status = quantificationFilter)

  projectTagFilter <- check.var(
    var.name = 'projectTagFilter',
    var.value = projectTagFilter,
    status = projectTagFilter)
  query.c <- na.omit(c(
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
  ))
  return(query.c)
}
################# FILE
beautify.ppf <- function(ppf){
  projectFileTypes <- sapply(ppf,function(x){x$fileType})
  fileTypes <- unique(projectFileTypes)
  ppfOrder <- list()
  for(i in 1:length(fileTypes)){
    ppfOrder[[i]] <- ppf[projectFileTypes %in% fileTypes[i]]
  }
  names(ppfOrder) <- fileTypes
  return(ppfOrder)
}

bytes2gb <- function(fileSize){
  return(fileSize/(1024 * 1024 *1024))
}
