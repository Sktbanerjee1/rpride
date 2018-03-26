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
project.info <- get.project.detail(pxd = pxd)
```

## Get all PRIDE projects
```{R}
all.pride.projects <- get.project.list(pxd = pxd)
```

