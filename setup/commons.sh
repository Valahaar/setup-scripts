apt-get update -y
apt-get install build-essential linux-headers-$(uname -r)
apt-get install -y git curl wget nano vim
apt-get install -y openssh-server openssh-client rsync
apt-get install -y lm-sensors byobu tmux htop

# git config --global user.email "niccolo.campolungo@gmail.com"
# git config --global user.name "Valahaar"

mkdir ~/.ssh ~/.bin

# automatically create an ssh key in ~/.ssh/id_rsa if it does not exist (empty passphrase)
# taken from https://unix.stackexchange.com/a/135090
cat /dev/zero | ssh-keygen -q -N ""