apt-get update -y
apt-get upgrade -y

sh setup/commons.sh
sh setup/zsh-p10k.sh
sh setup/conda.sh

FINAL_ZSHRC_TEXT='''
# to render Qt5 apps nicely over SSH X - not needed in docker
# export QT_QPA_PLATFORM=kde

# enables usage of monitoring
export PATH=~/.bin:$PATH

emulate sh -c "source /etc/profile"

# for zsh-completions
autoload -U compinit && compinit
'''

echo "$FINAL_ZSHRC_TEXT" >> ~/.zshrc
