home = ${HOME}
dotfilesDir = $(home)/dotfiles
i3Dir = $(dotfilesDir)/i3
i3varDir = $(i3Dir)/variables

all: gitsetup

.PHONY: config
config:
	@echo -n "Choose which i3 configuration (variables pack) you want:"
	@for file in ./i3/variables/*; do echo -n " $${file##*/}"; done; echo ""
	@cat $(i3Dir)/header > $(i3Dir)/config
	@var=null; until [ -f "/home/tomato/dotfiles/i3/variables/$${var}" ]; do read -p "Choice: " var; done; \
		cat $(i3varDir)/$${var} >> $(i3Dir)/config
	@cat $(i3Dir)/base >> $(i3Dir)/config
	@echo "[DONE] Created i3 config file."

.PHONY: gitsetup
gitsetup:
	@cp .gitconfig ~/.gitconfig
	@echo "[DONE] Copied gitconfig file for global git configuration."
	@echo "[WARN] Please setup email in gitconfig..."

