message_info "Installing i3blocks."
sudo pamac install --no-confirm i3blocks > /dev/null
message_done "Installed i3blocks."
for file in $DOTFILES_I3BLOCK/scripts/*
do
   chmod +x $file
done
rm -rf $CONFIG/i3blocks
ln -s $DOTFILES/i3blocks $CONFIG/i3blocks
message_done "Linked i3blocks config folder."

