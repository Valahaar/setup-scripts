wget -O miniconda.sh "https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh"
bash miniconda.sh -b
rm -f miniconda.sh

export PATH=/root/miniconda3/bin:${PATH}
conda update -y conda && conda init zsh