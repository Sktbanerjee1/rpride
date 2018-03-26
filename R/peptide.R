get.psms.by.project <- function(
  project.accession = 'PXD001536',
  show = 10000
)
{
  if(show > 10000){
    show <- 10000
  }
  baseURL <- paste0(
    'https://www.ebi.ac.uk:443/pride/ws/archive/peptide/list/project/',
    project.accession,
    '?show=',
    show
    )
  psms.count <- get.psms.count.by.project(project.accession = project.accession)
  cat(paste0('No. of proteins ',psms.count,'\n'))
  if(psms.count > show){
    nIter <- seq(
      1,
      psms.count,
      show)[-1]
    # pages to traverse
    nPages <- length(nIter)
  }else{
    nPages <- 0
  }
  psmsPerPage <- list()
  # page starts from 0
  for(i in 0:nPages){
    cur.url <- paste0(
      baseURL,
      '&page=',
      i
    )
    psmsList <- connectionStatus(httr::GET(cur.url))[[1]]
    cat(paste0('Page ', i+1, '\n'))
    psmsPerPage[[i+1]] <- psmsList
    cat(paste0('Number of results = ',length(psmsList), '\n'))
  }
  all.psms <- c()
  for(i in 1:length(psmsPerPage)){
    all.psms <- append(all.psms, psmsPerPage[[i]])
  }
  return(all.psms)
}

get.psms.count.by.project <- function(
  project.accession = 'PXD001536'
)
{
  baseURL <- 'https://www.ebi.ac.uk:443/pride/ws/archive/peptide/count/project/'
  url <- paste0(
    baseURL,
    project.accession
  )
  queryContent <- connectionStatus(resposeServer = httr::GET(url))[[1]]
  return(queryContent)
}

get.psms.by.project.n.seq <- function(
  project.accession = 'PXD001536',
  peptide.seq = 'DDDIAALVVDNGSGMCKAGFAGDDAPR',
  show = 1e4

){
  if(show > 1e4){
    show <- 1e4
  }
  baseURL <- paste0(
    'https://www.ebi.ac.uk:443/pride/ws/archive/peptide/list/project/',
    project.accession,
    '/sequence/',
    peptide.seq,
    '?show=',
    show
  )
  psms.count <- get.psms.count.by.project.n.seq(
    project.accession = project.accession,
    peptide.seq = peptide.seq)
  cat(paste0('No. of proteins ',psms.count,'\n'))
  if(psms.count > show){
    nIter <- seq(
      1,
      psms.count,
      show)[-1]
    # pages to traverse
    nPages <- length(nIter)
  }else{
    nPages <- 0
  }
  psmsPerPage <- list()
  # page starts from 0
  for(i in 0:nPages){
    cur.url <- paste0(
      baseURL,
      '&page=',
      i
    )
    psmsList <- connectionStatus(httr::GET(cur.url))[[1]]
    cat(paste0('Page ', i+1, '\n'))
    psmsPerPage[[i+1]] <- psmsList
    cat(paste0('Number of results = ',length(psmsList), '\n'))
  }
  all.psms <- c()
  for(i in 1:length(psmsPerPage)){
    all.psms <- append(all.psms, psmsPerPage[[i]])
  }
  return(all.psms)
}

get.psms.count.by.project.n.seq <- function(
  project.accession = 'PXD001536',
  peptide.seq = 'DDDIAALVVDNGSGMCKAGFAGDDAPR'
){
  baseURL <- 'https://www.ebi.ac.uk:443/pride/ws/archive/peptide/count/project/'
  url <- paste0(
    baseURL,
    project.accession,
    '/sequence/',
    peptide.seq
  )
  queryContent <- connectionStatus(resposeServer = httr::GET(url))[[1]]
  return(queryContent)
}


get.psms.by.assay <- function(
  assay.accession = 22134,
  show = 1e4
)
{
  if(show > 1e4){
    show <- 1e4
  }
  baseURL <- paste0(
    'https://www.ebi.ac.uk:443/pride/ws/archive/peptide/list/assay/',
    assay.accession,
    '?show=',
    show
  )
  psms.count <- get.psms.count.by.assay(assay.accession = assay.accession)
  cat(paste0('No. of proteins ',psms.count,'\n'))
  if(psms.count > show){
    nIter <- seq(
      1,
      psms.count,
      show)[-1]
    # pages to traverse
    nPages <- length(nIter)
  }else{
    nPages <- 0
  }
  psmsPerPage <- list()
  # page starts from 0
  for(i in 0:nPages){
    cur.url <- paste0(
      baseURL,
      '&page=',
      i
    )
    psmsList <- connectionStatus(httr::GET(cur.url))[[1]]
    cat(paste0('Page ', i+1, '\n'))
    psmsPerPage[[i+1]] <- psmsList
    cat(paste0('Number of results = ',length(psmsList), '\n'))
  }
  all.psms <- c()
  for(i in 1:length(psmsPerPage)){
    all.psms <- append(all.psms, psmsPerPage[[i]])
  }
  return(all.psms)
}

get.psms.count.by.assay <- function(
  assay.accession = '22134'
)
{
  baseURL <- 'https://www.ebi.ac.uk:443/pride/ws/archive/peptide/count/assay/'
  url <- paste0(
    baseURL,
    assay.accession
    )
  queryContent <- connectionStatus(resposeServer = httr::GET(url))[[1]]
  return(queryContent)
}

get.psms.by.assay.n.seq <- function(
  assay.accession = '22134',
  peptide.seq = 'GIANSILIK',
  show = 1e4
)
{
  if(show > 1e4){
    show <- 1e4
  }
  baseURL <- paste0(
    'https://www.ebi.ac.uk:443/pride/ws/archive/peptide/list/assay/',
    assay.accession,
    '/sequence/',
    peptide.seq,
    '?show=',
    show
  )
  psms.count <- get.psms.count.by.assay.n.seq(
    assay.accession = assay.accession,
    peptide.seq = peptide.seq)
  cat(paste0('No. of proteins ',psms.count,'\n'))
  if(psms.count > show){
    nIter <- seq(
      1,
      psms.count,
      show)[-1]
    # pages to traverse
    nPages <- length(nIter)
  }else{
    nPages <- 0
  }
  psmsPerPage <- list()
  # page starts from 0
  for(i in 0:nPages){
    cur.url <- paste0(
      baseURL,
      '&page=',
      i
    )
    psmsList <- connectionStatus(httr::GET(cur.url))[[1]]
    cat(paste0('Page ', i+1, '\n'))
    psmsPerPage[[i+1]] <- psmsList
    cat(paste0('Number of results = ',length(psmsList), '\n'))
  }
  all.psms <- c()
  for(i in 1:length(psmsPerPage)){
    all.psms <- append(all.psms, psmsPerPage[[i]])
  }
  return(all.psms)
}

get.psms.count.by.assay.n.seq <- function(
  assay.accession = '22134',
  peptide.seq = 'GIANSILIK'
)
{
  baseURL <- 'https://www.ebi.ac.uk:443/pride/ws/archive/peptide/count/assay/'
  url <- paste0(
    baseURL,
    assay.accession,
    '/sequence/',
    peptide.seq
  )
  queryContent <- connectionStatus(resposeServer = httr::GET(url))[[1]]
  return(queryContent)
}
