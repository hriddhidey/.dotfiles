# Brew install basic dependencies
echo "Installing Brew dependencies"
brew bundle -v


# .gitconfig and .gitignore_global files
ln -sfv "./git/.gitconfig" ~
ln -sfv "./git/.gitignore_global" ~

###________________________________________###
###----------- Terminal Setup -------------###
###________________________________________###

# Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


##--- Installing plugins ---##

echo "Installing plugins for history search, auto complete, and syntax highlight."

# Install the ZSH syntax highlighting plugin if it's not already installed
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

# Install the ZSH autosuggestions plugin if it's not already installed
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

# Install the ZSH history-search-multi-word plugin if it's not already installed
if [[ ! -d ~/.oh-my-zsh/custom/plugins/history-search-multi-word ]]; then
  git clone https://github.com/zdharma/history-search-multi-word.git ~/.oh-my-zsh/custom/plugins/history-search-multi-word
fi

echo "Installing pure prompt..."
# Installing pure prompt
npm install --global pure-prompt


##--- Setup custom scripts ---##

# Setup cht.sh
if [[ ! -d ~/bin ]]; then
  mkdir -p ~/bin
fi
curl https://cht.sh/:cht.sh > ~/bin/cht.sh
chmod +x ~/bin/cht.sh

# Setup goto
chmod +x ./zsh/.goto.sh
ln -sfv ./zsh/.goto.sh ~/


##--- Symlink necessary files ---##

# Symlink .zsh files
ln -sfv "./zsh/.zshrc" ~
ln -sfv "./zsh/.zsh_aliases" ~
source ~/.zshrc

# Symlink .vimrc
ln -sfv "./vimrc" ~

###_______________________________________###
###--------- Terminal Setup Done ---------###
###_______________________________________###


# Setup VSCode
cat extensions.list | xargs -L1 code --install-extension
ln -s ./VSCode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ./VSCode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ./VSCode/snippets/ ~/Library/Application\ Support/Code/User/snippets

