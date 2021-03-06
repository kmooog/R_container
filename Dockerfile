
FROM rocker/verse:3.6.0
MAINTAINER YOHEI_KUMAGAI

# R

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    lbzip2 \
    libfftw3-dev \
    libgdal-dev \
    libgeos-dev \
    libgsl0-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libhdf4-alt-dev \
    libhdf5-dev \
    libjq-dev \
    liblwgeom-dev \
    libpq-dev \
    libproj-dev \
    libprotobuf-dev \
    libnetcdf-dev \
    libsqlite3-dev \
    libssl-dev \
    libudunits2-dev \
    netcdf-bin \
    postgis \
    protobuf-compiler \
    sqlite3 \
    tk-dev \
    wget \
    unixodbc-dev \
  && install2.r --error \
    RColorBrewer \
    RandomFields \
    RNetCDF \
    classInt \
    deldir \
    gstat \
    hdf5r \
    lidR \
    mapdata \
    maptools \
    mapview \
    ncdf4 \
    proj4 \
    raster \
    rgdal \
    rgeos \
    rlas \
    sf \
    sp \
    spacetime \
    spatstat \
    spatialreg \
    spdep \
    geoR \
    geosphere \
    vegan \
    dichromat \
    ## from bioconductor
    && R -e "BiocManager::install(c('rhdf5','qvalue'))" \
    && R -e "BiocManager::install('WGCNA')" \
    && R -e "install.packages(\"glmnet\", dependencies=TRUE)" \
    && R -e "install.packages(\"igraph\", deoendencies=TRUE)" \
    && R -e "install.packages(\"Rcpp\", dependencies=TRUE)" \
    && R -e "install.packages(\"dendextend\", deoendencies=TRUE)" \
    && R -e "BiocManager::install(c('ggtree'))" \
    && R -e "install.packages('ape')" \
    && R -e "install.packages('Biostrings')" \
    && R -e "BiocManager::install(c('Biostrings'))" \
    && R -e "install.packages(\"magrittr\", dependencies=TRUE)"

# Install python3 and pip3
RUN apt-get update && apt-get install -y python3 \
    python3-pip \
    build-essential

# Install jupyter
RUN pip3 install jupyter

WORKDIR /root    
RUN git clone https://github.com/jessieren/VirFinder.git 
RUN R CMD INSTALL /root/VirFinder/linux/VirFinder_1.1.tar.gz

# Jupiter notebook
