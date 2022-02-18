OUTPUT=$(ask_rofi_multi $(get_all_files $HTTPD_VHOSTS_ENABLED))

if [ -z "$OUTPUT" ]
then
    return
fi

while IFS= read -r line
do
    sudo rm -f $HTTPD_VHOSTS_ENABLED/$line
done <<< "$OUTPUT"

sudo systemctl restart httpd
