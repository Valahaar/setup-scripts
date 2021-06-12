P10K_BASE_URL=https://github.com/romkatv/powerlevel10k-media/raw/master

mkdir ~/.fonts
cd ~/.fonts

wget $P10K_BASE_URL/MesloLGS%20NF%20Regular.ttf 
wget $P10K_BASE_URL/MesloLGS%20NF%20Italic.ttf 
wget $P10K_BASE_URL/MesloLGS%20NF%20Bold.ttf 
wget $P10K_BASE_URL/MesloLGS%20NF%20Bold%20Italic.ttf 

fc-cache -fv
