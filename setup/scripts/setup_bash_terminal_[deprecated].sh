message_warn "****************************************"
message_warn "*     !!!This script needs edit!!!     *"
message_warn "****************************************"
message_warn "This script is deprecated. It is not updated due to newer configuration with alacritty as terminal emulator and fish as shell."
if ! confirm "Do you really want to continue?"
then
   return
fi

message_info "Installing gnome terminal."
sudo pacman -S --needed --noconfirm gnome-terminal > /dev/null
message_done "Installed gnome terminal."
if [[ $(cat $SETUP_HOME/.bashrc | grep "# Include bash configuration from dotfiles") ]]
then
   message_done "Bash config already imported in .bashrc."
else
   echo -n "Choose which bash configuration you want:"
   for file in $DOTFILES_BASH/*
   do
      if [ ! -d $file ]
      then
         echo -n " ${file##*/}"
      fi
   done
   echo ""
   SEL_BASH=$(for bash in $DOTFILES_BASH/*; do if [ -f $bash ]; then echo "$(basename $bash)"; fi; done | rofi -dmenu -format 's' 2> /dev/null)
   if [ $SEL_BASH ]
   then
      echo -e "\n# Include bash configuration from dotfiles\nsource $DOTFILES_BASH/$SEL_BASH" >> $SETUP_HOME/.bashrc
      message_done "$SEL_BASH was included in bashrc."
   else
      message_error "You have not selected bash file to source. No file will be included."
   fi
fi

