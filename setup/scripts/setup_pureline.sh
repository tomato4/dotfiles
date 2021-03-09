message_info "Installing pureline."
mkdir -p $PROGRAMS
if [ ! -d $PROGRAMS/pureline ]
then
   git clone -q https://github.com/chris-marsh/pureline.git $PROGRAMS/pureline > /dev/null
fi
chmod +x $PROGRAMS/pureline/pureline
message_done "Installed pureline."
message_warn "Rollbacking pureline to commit a410b02 (last update of config). For newer version config update is needed."
git --git-dir $PROGRAMS/pureline/.git reset --hard a410b02
rm -rf $CONFIG/pureline
ln -s $DOTFILES/pureline $CONFIG/pureline
message_done "Linked pureline config folder."

