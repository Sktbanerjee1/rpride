# <img src="https://github.com/rintukutum/r-pack-logo/blob/master/logo/rpride-blue-600dpi.png" height="36" align="middle">
An R package powered by PRIDE web api. It allows r-users to retrieve project `summary`, `detail`, `assay` and `files` using PRIDE accession-ID.  It uses [PRIDE web API](https://www.ebi.ac.uk/pride/ws/archive/) and `httr` package to download the content.

## Install
```{R}
library('devtools')
install_github('rintukutum/rpride')
```

## Get information about a PRIDE project
```{R}
# load rpride library
library('rpride')
# PRIDE ID
pxd <- 'PXD000561'
project.info <- get.project.detail(pxd)
```

## Get all PRIDE projects
```{R}
pride_projects <- get.pride.projects()
```
