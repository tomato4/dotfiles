message_info "Compiling and linking i3 config file."
echo -n "Choose which i3 configuration (variables pack) you want:"
for file in $DOTFILES_I3_CONFIGS/*
do
   echo -n " ${file##*/}"
done
echo ""

cat $DOTFILES_I3/header > $DOTFILES_I3/config

SEL_CONFIG=$(for config in $DOTFILES_I3_CONFIGS/*; do echo "$(basename $config)"; done | rofi -dmenu -format 's' 2> /dev/null)

cat $DOTFILES_I3_CONFIGS/$SEL_CONFIG >> $DOTFILES_I3/config
cat $DOTFILES_I3/base >> $DOTFILES_I3/config
message_done "Created i3 config file."
rm -rf $SETUP_HOME/.i3
ln -s $DOTFILES_I3 $SETUP_HOME/.i3

message_done "I3 config file ready."
