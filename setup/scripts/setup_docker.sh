message_info "Installing docker"
install_pacman docker docker-compose
message_done "Installed docker and docker-compose"

sudo usermod -a -G docker $(whoami)

sudo systemctl enable docker --now

message_warn "Reboot required!"
