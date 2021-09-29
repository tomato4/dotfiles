function r
    mkdir -p ~/.config/ranger/sessions/
    find $HOME/.config/ranger/sessions/ -mindepth 1 -mtime +2 -exec rm {} \; 2> /dev/null
    set SID (tr -dc A-Za-z0-9 </dev/urandom | head -c 13)
    ranger --choosedir=$HOME/.config/ranger/sessions/$SID
    cd (cat ~/.config/ranger/sessions/$SID)
    rm ~/.config/ranger/sessions/$SID
end
