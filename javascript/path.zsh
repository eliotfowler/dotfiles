# sup yarn
# https://yarnpkg.com

if (( $+commands[yarn] ))
then
  # export PATH="$PATH:`yarn global bin`"
fi

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
