if ! command -v zsh &> /dev/null
then
  echo "zsh could not be found, trying to install from apt"
  apt-get install -y zsh
fi

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zpm-zsh/autoenv ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autoenv

sed -i 's/^plugins=.*/plugins=\(git zsh-completions zsh-autosuggestions zsh-syntax-highlighting history-substring-search autoenv\)/' ~/.zshrc

# powerlevel10k setup

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/config/p10k-classic.zsh ~/.p10k.zsh

sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# in .zshrc, we need to add the following at the beginning of the file
ZSHRC_PREPEND='''
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
'''

# while at the end, we need to add this in order to source the new configuration:
ZSHRC_APPEND='''
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
'''

mv ~/.zshrc ~/.zshrc.old
echo "$ZSHRC_PREPEND" >> ~/.zshrc
cat ~/.zshrc.old >> ~/.zshrc
echo "$ZSHRC_APPEND" >> ~/.zshrc
rm ~/.zshrc.old

# here we change the .p10k.zsh configuration file with the customized config :)
# one can always run `p10k configuration` in order to change the current config

# Generated by Powerlevel10k configuration wizard on 2021-06-11 at 18:27 CEST.
# Based on romkatv/powerlevel10k/config/p10k-classic.zsh, checksum 20612.
# Wizard options: nerdfont-complete + powerline, small icons, classic, unicode, light,
# 24h time, angled separators, sharp heads, flat tails, 2 lines, disconnected,
# full frame, sparse, many icons, concise, instant_prompt=quiet.
# Type `p10k configure` to generate another config.

# decomment os_icon, vi_mode, time and disk_usage for prompt's right-side elements
# we add space after 'time' to avoid replacing '# timewarrior'
sed -i \
    -e 's/\# os_icon/os_icon/' \
    -e 's/\# vi_mode/vi_mode/' \
    -e 's/\# time /time /' \
    -e 's/\# disk_usage/disk_usage/' \
    -e "s/POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=$/POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''/" \
    -e "s/POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=$/POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=''/" \
    -e "s/POWERLEVEL9K_VCS_BRANCH_ICON=$/POWERLEVEL9K_VCS_BRANCH_ICON='\\uF126 '/" \
    -e "s/POWERLEVEL9K_BATTERY_STAGES=.*/POWERLEVEL9K_BATTERY_STAGES='\\uf58d\\uf579\\uf57a\\uf57b\\uf57c\\uf57d\\uf57e\\uf57f\\uf580\\uf581\\uf578'/" \
    -e "s/POWERLEVEL9K_INSTANT_PROMPT=verbose$/POWERLEVEL9K_INSTANT_PROMPT=quiet/" \
    ~/.p10k.zsh

conda init zsh

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
