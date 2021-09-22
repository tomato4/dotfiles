function r
    mkdir -p ~/.config/ranger/sessions/
    find $HOME/.config/ranger/sessions/ -mindepth 1 -mtime +2 -exec rm {} \;
    set SID (tr -dc A-Za-z0-9 </dev/urandom | head -c 13)
    ranger --choosedir=$HOME/.config/ranger/sessions/$SID
    cd (cat ~/.config/ranger/sessions/$SID)
    rm ~/.config/ranger/sessions/$SID
end
