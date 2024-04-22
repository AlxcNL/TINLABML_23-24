#!/usr/bin/env zsh

if [[ ! -d "$HOME/.zsh/spaceship" ]]; then
	echo "Clone Spaceship"
	git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.zsh/spaceship"
fi

echo "Update npm"
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

echo "Install ember"
sudo npm install -g npm && sudo npm install -g ember-cli
git clone https://github.com/spaceship-prompt/spaceship-ember.git "$HOME/.oh-my-zsh/custom/plugins/spaceship-ember"
