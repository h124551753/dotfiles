#!/usr/bin/env bash


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


if hash apt 2>/dev/null; then
	cecho "apt has been installed, just continue install ..." $green
else
	cecho "no apt found! exit ..." $yellow
  exit
fi


# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


echo ""
cecho "Now time to install my favorate tools ..." $yellow

sudo apt-add-repository ppa:ubuntu-elisp/ppa
sudo apt-get update
sudo apt-get install 

cecho "purge the old tools: firefox ..." $yellow
sudo apt-get purge firefox

apps=(
	  # Utilities
    ## for openresty
    libreadline-dev 
    libncurses5-dev 
    libpcre3-dev
    libssl-dev
    perl 
    make 
    build-essential

	  ## Dev tools
    wget
    curl
    git
		firefox
    emacs-snapshot    # install the latest version from ppa
		openssh-server
     
)

for item in ${apps[@]}; do
	cecho "> ${item}" $magenta
done

echo ""

select yn in "Yes" "No"; do
	case $yn in
		Yes )
		    cecho "Ok! installing apps, please wait ... " $yellow
		    apt-get install ${apps[@]}
		    break;;
		No ) break;;
	esac
done


echo "change the default shell into: /bin/bash"

sudo chsh -s /bin/bash

cecho "Done, Happy Hacking At the Speed Of The Thought" $green
