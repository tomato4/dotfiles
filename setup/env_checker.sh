message_info "Starting checker for env config files."

# define env configs here
ENV_FILES=(
   "$DOTFILES_I3_CONFIGS/$DOTFILES_ENV"
   "$DOTFILES_I3BLOCK/config_$DOTFILES_ENV"
   "$DOTFILES_CONFIGS/Xresources/.Xresources_$DOTFILES_ENV"
)


for file in ${ENV_FILES[@]}
do
   if ! [ -f $file ]
   then
      message_warn "Config file for this enviroment (\"$DOTFILES_ENV\") in \"$file\" does not exist!"
   fi
done
message_done "Check completed."
