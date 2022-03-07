message_info "Installing droidcam, v4l2loopback"

install_yay droidcam v4l2loopback-dc-dkms

echo "options v4l2loopback_dc width=1920 height=1080" | sudo tee /etc/modprobe.d/droidcam.conf > /dev/null

message_warn "Restart required!"
