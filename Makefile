home = /home/tomato
programs = $(home)/Programs
configDir = $(home)/.config
dotfilesDir = $(home)/dotfiles
bashDir = $(dotfilesDir)/bash
i3Dir = $(dotfilesDir)/i3
i3varDir = $(i3Dir)/variables
xkbDir = $(dotfilesDir)/xkb

.PHONY: all rootCheck config i3blocks bash git nvim ranger redshift pureline xkb

all: rootCheck update config i3blocks bash git nvim ranger redshift pureline xkb

rootCheck:
	@if [ "$$EUID" -ne 0 ]; then echo "Root required. Please run with sudo."; exit 1; fi

update: rootCheck
	@echo "[INFO] Updating pacman..."
	@pacman -Syu --noconfirm > /dev/null
	@echo "[DONE] Update completed."

config:
	@echo -n "Choose which i3 configuration (variables pack) you want:"
	@for file in ./i3/variables/*; do echo -n " $${file##*/}"; done; echo ""
	@cat $(i3Dir)/header > $(i3Dir)/config
	@var=null; until [ -f "/home/tomato/dotfiles/i3/variables/$${var}" ]; do read -p "Choice: " var; done; \
		cat $(i3varDir)/$${var} >> $(i3Dir)/config
	@cat $(i3Dir)/base >> $(i3Dir)/config
	@echo "[DONE] Created i3 config file."
	@rm -rf ~/.i3
	@ln -s $(i3Dir) ~/.i3
	@echo "[DONE] Linked i3 conf folder."

i3blocks: rootCheck
	@echo "[INFO] Installing i3blocks..."
	@pamac install --no-confirm i3blocks > /dev/null
	@echo "[DONE] Installed i3blocks."
	@rm -rf $(configDir)/i3blocks
	@ln -s $(dotfilesDir)/i3blocks $(config)/i3blocks
	@echo "[DONE] Linked i3blocks config folder."

bash:
	@echo -n "Choose which bash configuration you want:"
	@for file in $(bashDir)/*; do if [ ! -d $${file} ]; then echo -n " $${file##*/}"; fi; done; echo ""
	@var=null; until [ -f "/home/tomato/dotfiles/bash/$${var}" ]; do read -p "Choice: " var; done; \
		echo -e "# Include bash configuration from dotfiles\nsource ~/dotfiles/bash/$${var}" >> ~/.bashrc

git:
	@echo "[INFO] Preparing git configuration..."
	@rm -f $(home)/.gitconfig
	@cp $(dotfilesDir)/.gitconfig $(home)/.gitconfig
	@echo "[DONE] Copied gitconfig file for global git configuration."
	@echo -n "Please write your name for global git configuration: "; read name; git config --global user.name "$${name}"
	@echo -n "Please write your email for global git configuration: "; read email; git config --global user.email "$${email}"

nvim: rootCheck
	@echo "[INFO] Installing neovim..."
	@pacman -S --needed --noconfirm neovim > /dev/null
	@echo "[DONE] Installed neovim."
	@rm -rf $(config)/nvim
	@ln -s $(dotfilesDir)/nvim $(config)/nvim
	@echo "[DONE] Linked neovim config folder."

ranger: rootCheck
	@echo "[INFO] Installing ranger..."
	@pacman -S --needed --noconfirm ranger > /dev/null
	@echo "[DONE] Installed ranger."
	@rm -rf $(config)/ranger
	@ln -s $(dotfilesDir)/ranger $(config)/ranger
	@echo "[DONE] Linked ranger config folder."

redshift: rootCheck
	@echo "[INFO] Installing redshift..."
	@pacman -S --needed --noconfirm redshift > /dev/null
	@echo "[DONE] Installed redshift."
	@rm -rf $(config)/redshift
	@ln -s $(dotfilesDir)/redshift $(config)/redshift
	@echo "[DONE] Linked redshift config folder."

pureline: rootCheck
	@echo "[INFO] Installing pureline..."
	@mkdir -p $(programs)
	@git clone https://github.com/chris-marsh/pureline.git $(programs)/pureline > /dev/null
	@chmod +x $(programs)/pureline/pureline
	@echo "[DONE] Installed pureline."
	@rm -rf $(config)/pureline
	@ln -s $(dotfilesDir)/pureline $(config)/pureline
	@echo "[DONE] Linked pureline config folder."

xkb: rootCheck
	@echo "[INFO] Applying my keyboard settings..."
	@rm -f /usr/share/X11/xkb/symbols/cz
	@ln -s $(xkbDir)/my_cz /usr/share/X11/xkb/symbols/cz
	@echo "[DONE] Linked my keyboard settings."
