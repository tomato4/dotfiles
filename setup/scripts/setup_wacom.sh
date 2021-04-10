message_info "Setup Wacom tablet."
OUTPUT=$(echo -e -n "Left screen\nRight screen" | rofi -dmenu -format 's\n' 2> /dev/null | sed 's/\\n//g')
if [ "$OUTPUT" == "Left screen" ]
then
   xsetwacom set "Wacom One by Wacom M Pen stylus" MapToOutput 1920x1080+0+0
   xsetwacom set "Wacom One by Wacom M Pen eraser" MapToOutput 1920x1080+0+0
elif [ "$OUTPUT" == "Right screen" ]
then
   xsetwacom set "Wacom One by Wacom M Pen stylus" MapToOutput 1920x1080+1920+0
   xsetwacom set "Wacom One by Wacom M Pen eraser" MapToOutput 1920x1080+1920+0
else
   message_error "Unexpected value returned from rofi (wacom setup select)."
   exit 1
fi
message_done "Wacom setup completed."
