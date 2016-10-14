#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Set the colours you can use
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

#  Reset text attributes to normal + without clearing screen.
alias Reset="tput sgr0"

# Color-echo.
# arg $1 = message
# arg $2 = Color
cecho() {
  echo -e "${2}${1}"
  # Reset # Reset to normal.
  return
}



cecho "attension: please make sure you have installed the command line tools use: xcode-select --install" $yellow
echo ""


# Homebrew
# http://brew.sh
if hash brew 2>/dev/null; then
	cecho "Homebrew already installed" $green
else
	cecho "Installing Homebrew" $yellow
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew doctor
fi

# Homebrew Cask
# http://caskroom.io
if command brew cask 1>/dev/null; then
	cecho "Homebrew Cask already installed, just conitnue ..." $green
else
	cecho "Installing Homebrew Cask" $yellow
    brew tap caskroom/cask
	brew install caskroom/cask/brew-cask
fi


# Install command-line tools using Homebrew.
# Ask for the administrator password upfront.
# sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

cecho "Updating Homebrew" $yellow
# Make sure we’re using the latest Homebrew.
#brew update

# Upgrade any already-installed formulae.
#brew upgrade --all

cecho "Install command-line tools ... " $yellow

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
#sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri
brew install vbindiff

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# Install more recent versions of some OS X tools.
brew install macvim --HEAD --with-cscope --with-lua --with-override-system-vim --with-luajit --with-python
# brew install emacs --HEAD --with-imagemagick --with-cocoa --with-gnutls --with-librsvg
# brew install emacs --HEAD --use-git-head --with-cocoa --with-gnutls --with-rsvg --with-imagemagick

sudo -H pip install pygments
brew install global --with-exuberant-ctags --with-pygments --HEAD

brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
#brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz
brew install sshpass

# Install other useful binaries.
#brew install ack
#brew install dark-mode
#brew install exiv2
brew install git
brew install git-lfs
#brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install tree
brew install webkit2png
brew install zopfli

# custom my command line tools
brew install tmux
brew install aspell
brew install ctags
brew install curl
brew install fzf
brew install trash
brew install pcre
brew install openssl
brew install autojump
brew install liquidprompt
brew install z
brew install thefuck
brew install zsh
brew install zsh-completions
brew install graphviz
brew install htop-osx
brew install plantuml
brew install git-flow-avh
# imagemagick vs graphicsmagick
brew install graphicsmagick
brew install the_silver_searcher
brew install iojs
brew install cask
# cool hack command
brew install cmatrix

# proxy tools
brew install proxychains-ng
brew install privoxy

# nvm
brew install nvm
# Note: this installs `npm` too, using the recommended installation method.
brew install node

# manage my password
brew install lastpass-cli --with-pinentry

# # A terminal emulator for the 21st century.
brew cask install black-screen
# # A better WeChat on macOS and Linux. Fewer bugs, more features. Built with Electron by Zhongyi Tong.
# brew cask install electronic-wechat
# 
# # Remove outdated versions from the cellar.
cecho "Removing outdated versions from the brew cellar." $yellow
brew cleanup


# refer: https://github.com/junegunn/fzf
cecho "fzf deloying ..." $yellow
/usr/local/opt/fzf/install
complete -F _fzf_file_completion -o default -o bashdefault doge


echo ""
cecho "Now time to install my favorate apps ..." $yellow
apps=(
	   # Utilities
    alfred
    dropbox
    google-chrome
    firefox
    caffeine
    aliwangwang
    thunder
    Transmission
    baiducloud
    vlc
    qq

    # Mac 上的 Rime 输入法 鼠鬚管: Squirrel
    # squirrel

    # Dev Stuff
    cord
    mou
    keycastr
    licecap
    iterm2
    sourcetree
    cheatsheet
    dash
    java
    jumpcut
    steam

    #A Mac PrefPane to manage all your Homebrew-installed services
    launchrocket
)

for item in ${apps[@]}; do
	cecho "> ${item}" $magenta
done

echo ""

select yn in "Yes" "No"; do
	case $yn in
		Yes )
		    cecho "Ok! installing apps, please wait ... " $yellow
		    brew cask install --appdir="/Applications" ${apps[@]}
		    break;;
		No ) break;;
	esac
done


# read -p "install the awesome swagger, are you sure? (y/n) " -n 1;
# if [[ $REPLY =~ ^[Yy]$ ]]; then
#   echo ""
#   npm install -g swagger
# fi;

echo ""
read -p "install the awesome tool terminal stackoverflow how2, are you sure? (y/n) " -n 1;
if [[ $REPLY =~ ^[Yy]$ ]]; then
  npm install -g how2
fi;


echo ""
read -p "do you want to go through G-F-W use shadowsocks client of python version ? (y/n) " -n 1;
if [[ $REPLY =~ ^[Yy]$ ]]; then
  sudo -H pip install shadowsocks

  echo -e "\033[40;32m deploy the proxy server on your remote vps: server[1,2,3] \033[0m"

  SS_CFG="/etc/shadowsocks.json"
  if [ ! -f "$SS_CFG" ]; then
    echo "no found shadowsocks config file: /etc/shadowsocks.json";
    sudo touch "$SS_CFG"
  fi
  sudo chmod a+w "$SS_CFG"

cat > "$SS_CFG" <<EOF
{
  "server":["server1","server2"],
  "server_port":8080,
  "local_address":"127.0.0.1",
  "local_port":1080,
  "password":"password",
  "timeout":300,
  "method":"aes-256-cfb",
  "fast_open": false
}
EOF

  echo -e "\033[40;32m you can start the shadowsocks server on remote vps: sudo ssserver -c /etc/shadowsocks.json -d start \033[0m"
  #sudo ssserver -c $SS_CFG -d stop
  #sudo ssserver -c $SS_CFG -d start
  echo -e "\033[40;32m you can start the shadowsocks client on your local laptop: sslocal -c /etc/shadowsocks.json \033[0m"
fi;


echo ""
read -p "Use privoxy to transform Socks5 Proxy into HTTP Proxy (y/n) " -n 1;
if [[ $REPLY =~ ^[Yy]$ ]]; then
  if [ -f "/usr/local/etc/privoxy/config" ]; then
    sudo chmod o+w "/usr/local/etc/privoxy/config"

sudo cat >> /usr/local/etc/privoxy/config <<EOF
listen-address  0.0.0.0:8118
forward-socks5t / 127.0.0.1:1080 .
EOF

    sudo chmod o-w "/usr/local/etc/privoxy/config"
  fi
fi


echo ""
echo -e "\033[40;33m change the default shell into: /user/local/bin/bash\033[0m"
sudo chsh -s /usr/local/bin/bash


echo ""
read -p "install an awesome tmux configuration file, are you sure? (y/n) " -n 1;
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo ""
  git clone https://github.com/gpakosz/.tmux.git
  if [ -f "$HOME/.tmux.conf" ]; then
    sudo rm $HOME/.tmux.conf
  fi;
  sudo ln -s $CURRENT_DIR/.tmux/.tmux.conf $HOME/.tmux.conf
  sudo ln -s $CURRENT_DIR/.tmux/.tmux.conf.local $HOME/.tmux.conf.local
fi;
echo ""

cecho "Done, Happy Hacking At the Speed Of The Thought" $green
