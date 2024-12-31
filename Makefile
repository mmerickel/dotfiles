DOTFILES=$(shell pwd)
LN=ln -snf

XDG_CONFIG_HOME=$(HOME)/.config

.PHONY: all zsh tmux git nvim ghostty
all: zsh tmux git nvim ghostty

$(XDG_CONFIG_HOME):
	mkdir -p $(XDG_CONFIG_HOME)

zsh: $(XDG_CONFIG_HOME)
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

ghostty: $(XDG_CONFIG_HOME)
	mkdir -p $(XDG_CONFIG_HOME)/ghostty
	$(LN) $(DOTFILES)/ghostty $(XDG_CONFIG_HOME)/ghostty/config

tmux:
	$(LN) $(DOTFILES)/tmux.conf $(HOME)/.tmux.conf

git:
	$(LN) $(DOTFILES)/gitconfig $(HOME)/.gitconfig
	$(LN) $(DOTFILES)/gitignore $(HOME)/.gitignore
	$(LN) $(DOTFILES)/git-templates $(HOME)/.git-templates

nvim: $(XDG_CONFIG_HOME)
	$(LN) $(DOTFILES)/nvim $(XDG_CONFIG_HOME)/nvim
