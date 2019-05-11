DOTFILES=$(shell pwd)
LN=ln -snf

.PHONY: all zsh tmux vim git
all: zsh tmux vim git

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

tmux:
	$(LN) $(DOTFILES)/tmux.conf $(HOME)/.tmux.conf

vim:
	$(LN) $(DOTFILES)/vim $(HOME)/.vim

git:
	$(LN) $(DOTFILES)/gitconfig $(HOME)/.gitconfig
	$(LN) $(DOTFILES)/gitignore $(HOME)/.gitignore
	$(LN) $(DOTFILES)/git-templates $(HOME)/.git-templates
