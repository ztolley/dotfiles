DIR=$(HOME)/dotfiles
LATEST_RUBY="2.2.4"

all: brew node ruby symlinks

symlinks:
	@ln -sf $(DIR)/bash/aliases ~/.aliases
	@ln -sf $(DIR)/bash/bash_profile ~/.bash_profile
	@ln -sf $(DIR)/bash/bash_prompt ~/.bash_prompt
	@ln -sf $(DIR)/bash/exports ~/.exports
	@ln -sf $(DIR)/bash/functions ~/.functions
	@ln -sf $(DIR)/bash/path ~/.path
	@ln -sf $(DIR)/bash/git-completion.bash ~/.git-completion.bash
	@ln -sf $(DIR)/linter/jshintrc ~/.jshintrc
	@ln -sf $(DIR)/linter/scss-lint.yml ~/.scss-lint.yml
	@ln -sf $(DIR)/git/gitconfig ~/.gitconfig
	@ln -sf $(DIR)/git/gitignore_global ~/.gitignore_global
	@ln -sf $(DIR)/gem/gemrc ~/.gemrc
	@ln -nsf $(DIR)/bundle ~/.bundle
	@ln -sf $(DIR)/rbenv/default-gems ~/.rbenv/default-gems

ensure_brew:
	sh $(DIR)/scripts/ensure_homebrew.sh

brew: ensure_brew
	brew tap Homebrew/bundle
	brew tap Caskroom/cask
	brew bundle

ruby:
	[ -d ~/.rbenv/versions/$(LATEST_RUBY) ] || rbenv install $(LATEST_RUBY)
	rbenv global $(LATEST_RUBY)

node: brew
	npm install -g gulp-cli browser-sync mocha nodemon
