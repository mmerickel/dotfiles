DOTFILES=$(shell pwd)
LN=ln -snf

.PHONY: all zsh tmux git nvim
all: zsh tmux git nvim

zsh:
	$(LN) $(DOTFILES)/zshenv $(HOME)/.zshenv
	$(LN) $(DOTFILES)/zprofile $(HOME)/.zprofile
	$(LN) $(DOTFILES)/zprezto $(HOME)/.zprezto
	$(LN) $(DOTFILES)/zpreztorc $(HOME)/.zpreztorc
	$(LN) $(DOTFILES)/zshrc $(HOME)/.zshrc
	$(LN) $(DOTFILES)/aliasrc $(HOME)/.aliasrc
	$(LN) $(DOTFILES)/zlogin $(HOME)/.zlogin
	$(LN) $(DOTFILES)/zlogout $(HOME)/.zlogout
	$(LN) $(DOTFILES)/sandboxd/sandboxd $(HOME)/.sandboxd
	$(LN) $(DOTFILES)/sandboxrc $(HOME)/.sandboxrc
	$(LN) $(DOTFILES)/gemrc $(HOME)/.gemrc
	$(LN) $(DOTFILES)/rvmrc $(HOME)/.rvmrc
	$(LN) $(DOTFILES)/ripgreprc $(HOME)/.ripgreprc
	$(LN) $(DOTFILES)/rgignore $(HOME)/.rgignore

tmux:
	$(LN) $(DOTFILES)/tmux.conf $(HOME)/.tmux.conf

git:
	$(LN) $(DOTFILES)/gitconfig $(HOME)/.gitconfig
	$(LN) $(DOTFILES)/gitignore $(HOME)/.gitignore
	$(LN) $(DOTFILES)/git-templates $(HOME)/.git-templates

nvim:
	mkdir -p $(HOME)/.config
	$(LN) $(DOTFILES)/nvim $(HOME)/.config/nvim
