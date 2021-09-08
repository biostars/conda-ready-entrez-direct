# conda-ready-entrez-direct

Bioconda ready entrez-direct

### Rationale

The official entrez-direct install script connects to the internet to download the binary component. Connecting to the internet during the bioconda installation is not allowed as it is a security risk and makes it impossible to validate archive hashes.

This repository repackages entrez-direct to contain all code inside the repository.

Official distribution URL for Entrez Direct

* https://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/

The Entrez Direct manual:

* https://www.ncbi.nlm.nih.gov/books/NBK179288/

### Usage

Entrez direct uses the  `MAJOR.MINOR.DATE` version labels for example `15.6.20210906`

To prepare a new distribution run:

    bash prepare.sh 15.6.20210906

it will generate the file

    dist/edirect.15.6.20210906.tar.gz
    dist/edirect.15.6.20210906.tar.gz.sha

A custom `install.sh` script is added to the archive that should be run during bioconda installation.


