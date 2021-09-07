# conda-ready-entrez-direct

Bioconda ready entrez-direct

* https://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/

### Rationale

The official entrez-direct install script connects to the internet to download certain software, and that process is not compatible with the bioconda install.

This repository prepackages entrez-direct to contain all code inside the repository.

### Usage

Entrez direct uses the  `MAJOR.MINOR.DATE` version labels for example `15.6.20210906`

To prepare a new distribution run:

    bash prepare.sh 15.6.20210906

it will generate the file

    dist/edirect.15.6.20210906.tar.gz
    dist/edirect.15.6.20210906.tar.gz.sha

A custom `install.sh` script is added to the archive that should be run during bioconda installation.


