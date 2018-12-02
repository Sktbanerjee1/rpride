comb.children <- function(parent){
  return(paste(unlist(parent),collapse = ';'))
}

project.list2df <- function(x){
  if(length(x) != 0){
    x <- lapply(x,function(x){data.frame(lapply(x,comb.children),stringsAsFactors = FALSE)})
    x.df <- plyr::ldply(x)
  }else{
    x.df <- data.frame(matrix(data = NA,ncol=11),stringsAsFactors=FALSE)
    colnames(x.df) <- c("accession","title","projectDescription",
                        "publicationDate","submissionType","numAssays",
                        "species","tissues","ptmNames",
                        "instrumentNames","projectTags")
  }
  return(x.df)
}
