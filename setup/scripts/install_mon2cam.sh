message_info "Downloading Mon2Cam to Programs."
mkdir -p $PROGRAMS
if [ ! -d $PROGRAMS/Mon2Cam ]
then
   git clone -q https://github.com/ShayBox/Mon2Cam.git $PROGRAMS/Mon2Cam > /dev/null
fi
message_info "Installing Deno repl."
sudo pacman -S --needed --noconfirm deno > /dev/null
message_done "Download and install completed."
