# DO NOT RUN THIS WITH MULTI CORE MAKE (run only one core because of sudo requests)

user = tomato
home = /home/tomato
programs = $(home)/Programs
configDir = $(home)/.config
dotfilesDir = $(home)/dotfiles
bashDir = $(dotfilesDir)/bash
i3Dir = $(dotfilesDir)/i3
i3varDir = $(i3Dir)/variables
i3blocksDir = $(dotfilesDir)/i3blocks
xkbDir = $(dotfilesDir)/xkb

.PHONY: all config i3blocks bash git nvim ranger redshift pureline xkb opera conky

all: update config i3blocks bash git nvim ranger redshift pureline xkb opera conky

update:
	@echo "[INFO] Updating pacman..."
	@sudo pacman -Syu --noconfirm > /dev/null
	@echo "[DONE] Update completed."

config:
	@echo -n "Choose which i3 configuration (variables pack) you want:"
	@for file in ./i3/variables/*; do echo -n " $${file##*/}"; done; echo ""
	@cat $(i3Dir)/header > $(i3Dir)/config
	@var=null; until [ -f "/home/tomato/dotfiles/i3/variables/$${var}" ]; do read -p "Choice: " var; done; \
		cat $(i3varDir)/$${var} >> $(i3Dir)/config
	@cat $(i3Dir)/base >> $(i3Dir)/config
	@echo "[DONE] Created i3 config file."
	@rm -rf $(home)/.i3
	@ln -s $(i3Dir) $(home)/.i3
	@echo "[DONE] Linked i3 conf folder."

time:
	@echo "[INFO] Setting time to use RTC..."
	@sudo timedatectl set-local-rtc 1
	@echo "[DONE] Time set."

i3blocks:
	@echo "[INFO] Installing i3blocks..."
	@sudo pamac install --no-confirm i3blocks > /dev/null
	@echo "[DONE] Installed i3blocks."
	@for file in $(i3blocksDir)/scripts/*; do chmod +x $$file; done
	@rm -rf $(configDir)/i3blocks
	@ln -s $(dotfilesDir)/i3blocks $(configDir)/i3blocks
	@echo "[DONE] Linked i3blocks config folder."

bash:
	@echo "[INFO] Installing gnome terminal..."
	@sudo pacman -S --needed --noconfirm gnome-terminal > /dev/null
	@echo "[DONE] Installed gnome terminal."
	@echo -n "Choose which bash configuration you want:"
	@for file in $(bashDir)/*; do if [ ! -d $${file} ]; then echo -n " $${file##*/}"; fi; done; echo ""
	@var=null; until [ -f "/home/tomato/dotfiles/bash/$${var}" ]; do read -p "Choice: " var; done; \
		echo -e "\n# Include bash configuration from dotfiles\nsource $(bashDir)/$${var}" >> $(home)/.bashrc

git:
	@echo "[INFO] Preparing git configuration..."
	@rm -f $(home)/.gitconfig
	@cp $(dotfilesDir)/.gitconfig $(home)/.gitconfig
	@echo "[DONE] Copied gitconfig file for global git configuration."
	@echo -n "Please write your name for global git configuration: "; read name; git config --global user.name "$${name}"
	@echo -n "Please write your email for global git configuration: "; read email; git config --global user.email "$${email}"

nvim: nvim-plug
	@echo "[INFO] Installing neovim..."
	@sudo pacman -S --needed --noconfirm neovim > /dev/null
	@echo "[DONE] Installed neovim."
	@rm -rf $(configDir)/nvim
	@ln -s $(dotfilesDir)/nvim $(configDir)/nvim
	@echo "[DONE] Linked neovim config folder."

nvim-plug:
	@echo "[INFO] Downloading nvim plug manager..."
	@sh -c 'curl -fLo $(home)/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' > /dev/null
	@echo "[DONE] Downloaded."

ranger:
	@echo "[INFO] Installing ranger..."
	@sudo pacman -S --needed --noconfirm ranger > /dev/null
	@echo "[DONE] Installed ranger."
	@rm -rf $(configDir)/ranger
	@ln -s $(dotfilesDir)/ranger $(configDir)/ranger
	@echo "[DONE] Linked ranger config folder."

redshift:
	@echo "[INFO] Installing redshift..."
	@sudo pacman -S --needed --noconfirm redshift > /dev/null
	@echo "[DONE] Installed redshift."
	@rm -rf $(configDir)/redshift
	@ln -s $(dotfilesDir)/redshift $(configDir)/redshift
	@echo "[DONE] Linked redshift config folder."

pureline:
	@echo "[INFO] Installing pureline..."
	@mkdir -p $(programs)
	@if [ ! -d "$(programs)/pureline" ]; then git clone -q https://github.com/chris-marsh/pureline.git $(programs)/pureline > /dev/null; fi
	@chmod +x $(programs)/pureline/pureline
	@echo "[DONE] Installed pureline."
	@echo "[WARN] Rollbacking pureline to commit a410b02 (last update of config)."
	@git --git-dir $(programs)/pureline/.git reset --hard a410b02
	@rm -rf $(configDir)/pureline
	@ln -s $(dotfilesDir)/pureline $(configDir)/pureline
	@echo "[DONE] Linked pureline config folder."

xkb:
	@echo "[INFO] Applying my keyboard settings..."
	@sudo rm -f /usr/share/X11/xkb/symbols/cz
	@sudo ln -s $(xkbDir)/my_cz /usr/share/X11/xkb/symbols/cz
	@echo "[DONE] Linked my keyboard settings."

opera:
	@echo "[INFO] Installing opera..."
	@sudo snap install opera > /dev/null
	@echo "[DONE] Opera installed."

conky:
	@echo "[INFO] Linking conky config..."
	@sudo rm -f /usr/share/conky/conky_green
	@sudo ln -s $(dotfilesDir)/conky/conky_green /usr/share/conky/conky_green
	@echo "[DONE] Linked config file."
