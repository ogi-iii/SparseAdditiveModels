# SparseAdditiveModels
high-dimensional nonparametric regression and classification called sparse additive models (SpAM)

# Setup

## Requirements

- Docker

## Start Docker and Jupyter Notebook

    docker build -t spam .
    docker run --rm --user root -e NB_UID=$(id -u) -p 8888:8888 -v "$(pwd)":/opt/local/work spam