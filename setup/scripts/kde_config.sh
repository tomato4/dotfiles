# https://github.com/shalva97/kde-configuration-files

if ! confirm "This will require to stop plasmashell. Proceed?"; then
    return
fi

# this will kill plasma. After linking plasma will be started again
kquitapp5 plasmashell || killall plasmashell

message_info "Linking KDE config files."

for filename in $(get_all_files $DOTFILES_KDE_CONFIG); do
    message_info "    Linking '$filename'"
    link $DOTFILES_KDE_CONFIG/"$filename" $CONFIG/"$filename"
done

message_done "Successfully linked all KDE config files."

if confirm "Restart session[y] or try to start plasmashell[n]?"; then
    pkill -TERM -u "$(whoami)"
else
    kstart5 plasmashell >/dev/null 2>&1 & disown
fi
