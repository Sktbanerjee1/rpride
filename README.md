# rpride
PRIDE api for R users. It uses [PRIDE web API](https://www.ebi.ac.uk/pride/ws/archive/) and `httr` package to download PRIDE projects informations.

## Install
```{R}
library('devtools')
install_github('rintukutum/rpride')
```

## Get information about a PRIDE project
```{R}
# load rpride library
library('rpride')
# pride ID or proteome exchange ID
# pxd <- 'PXD007997' # this is a MassIVE id
pxd <- 'PXD000561'
project.info <- get.project.detail(pxd)
```

## Get all PRIDE projects
```{R}
pride_projects <- get.pride.projects()
pride_acc_ids <- as.character(pride_projects$accession)
idx.human <- grep('Human',as.character(pride_projects$species))
tissue.human <- as.character(pride_projects$tissues[idx.human])
names(tissue.human) <-pride_acc_ids[idx.human]
idxInfo <- grep('[a-z]',tissue.human)
tissue.human <- tissue.human[idxInfo]
tissue.human <- sapply(tissue.human,function(x){strsplit(x,split='\\;')[[1]]})
tissue.human.l <- list()
for(i in 1:length(tissue.human)){
  tiss <- tissue.human[[i]]
  accID <- names(tissue.human)[i]
  df_ <- data.frame(
    tissue = tiss,
    accession.id = accID,
    stringsAsFactors =FALSE
    )
  tissue.human.l[[i]] <- df_
}
tissue.human.df <- plyr::ldply(tissue.human.l)
write.csv(tissue.human.df,
  './vignette/tissue_human.csv',
  row.names = FALSE
)
writeLines(
  sort(unique(tissue.human.df$tissue)),
  './vignette/tissues-human-unique.txt'
  )
accIDs.human <- pride_acc_ids[idx.human]

getKeywords <- function(x){
  keywords <- get.project.detail(x)$keywords
  keywords <- gsub('^[[:space:]]','',strsplit(keywords, split='\\,')[[1]])
  return(keywords)
}
pride_keywords.human <- sapply(accIDs.human[1:10], getKeywords)
```

