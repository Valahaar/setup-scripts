# TODO: test how this command is affected by changing 
if command -v conda &> /dev/null
then
  echo "conda exists, exiting"
  exit
fi

wget -O miniconda.sh "https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh"
bash miniconda.sh -b
rm -f miniconda.sh

export PATH=~/miniconda3/bin:${PATH}
conda update -y conda