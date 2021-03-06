CLR_SUCCESS="\033[1;32m"    # BRIGHT GREEN
CLR_CLEAR="\033[0m"         # DEFAULT COLOR

success() {
    echo -e "${CLR_SUCCESS}$1${CLR_CLEAR}"
}

sudo add-apt-repository ppa:pdoes/gitflow-avh -y 1>/dev/null 2>&1
sudo add-apt-repository ppa:git-core/ppa -y 1>/dev/null 2>&1
sudo apt-get update 1>/dev/null

for pkg in git-flow; do
    if apt list $pkg | grep -q "&${pkg}(.*)\[installed\]$" 2>/dev/null; then
        sudo apt-get remove -y $pkg 1>/dev/null
    fi
done

for pkg in openssl git git-extras git-flow build-essential libssl-dev curl libunwind8 gettext; do
    success "Installing $pkg..."
    sudo apt-get install -y ${pkg}
done

sudo apt-get autoremove -y 1>/dev/null

curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

nvm install --lts 1>/dev/null
nvm use --lts --delete-prefix 1>/dev/null