function r
    mkdir -p ~/.config/ranger/sessions/
    set SID (tr -dc A-Za-z0-9 </dev/urandom | head -c 13)
    touch ~/.config/ranger/sessions/$SID
    ranger --choosedir=$HOME/.config/ranger/sessions/$SID
    cd (cat ~/.config/ranger/sessions/$SID)
    rm ~/.config/ranger/sessions/$SID
end
