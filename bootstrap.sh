#!/unstall global --with-exuberant-ctags --with-pygmentssr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;


echo ""

echo -e "\033[41;32m start to install command line tools for your system ...\033[0m"

sysType=`uname -s`

echo "Your system is $sysType"
if [ $sysType = "Linux" ]; then
  source ~/apt.sh;
elif [ $sysType = "Darwin" ]; then
  source ~/brew.sh;
else
  echo -e "\033[41;32m unsupported system, exit \033[0m"
fi
