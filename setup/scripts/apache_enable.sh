OUTPUT=$(ask_rofi_multi $(get_all_files $DOTFILES_HTTPD/vhosts))

if [ -z "$OUTPUT" ]
then
    return
fi

while IFS= read -r line
do
    if ! [ -L $HTTPD_VHOSTS_ENABLED/$line ]
    then
        sudo ln -s $HTTPD_VHOSTS/$line $HTTPD_VHOSTS_ENABLED/$line
    fi
done <<< "$OUTPUT"

sudo systemctl restart httpd
