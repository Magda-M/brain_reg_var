#if installing using pip install --user, you must add the user-level bin directory to your PATH environment variable in order to launch jupyter lab. 
#If you are using a Unix derivative (FreeBSD, GNU / Linux, OS X), you can achieve this by using export PATH="$HOME/.local/bin:$PATH" command.
pip3 install jupyterlab 

sudo apt install git 
sudo apt install bedtools

#if you want to use jupyter lab extensions
sudo apt install nodejs==12.0
sudo apt install default-jre

sudo apt install python-is-python3

#obtain gnomAD_genome after ANNOVAR download
annotate_variation.pl -buildver hg38 -downdb -webfrom annovar gnomad_genome humandb/

pip3 install pandas scipy statsmodels pybedtools

#to install R 4.*in Ubuntu 20.04
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
sudo apt install r-base

pip3 install rpy2
sudo apt install libcurl4-gnutls-dev libssl-dev
sudo apt install libxml2-dev

#packages to install in R 4.*
install.packages("XML")
install.packages("httr")
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(version = "3.12")
BiocManager::install("motifbreakR")
options(timeout = 600)
BiocManager::install("BSgenome.Hsapiens.UCSC.hg38")
