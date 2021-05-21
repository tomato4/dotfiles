message_info "Downloading Mon2Cam to Programs."
mkdir -p $PROGRAMS
if [ ! -d $PROGRAMS/Mon2Cam ]
then
   git clone -q https://github.com/ShayBox/Mon2Cam.git $PROGRAMS/Mon2Cam > /dev/null
fi
install_pacman deno
