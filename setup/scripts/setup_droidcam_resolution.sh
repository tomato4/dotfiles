message_info "Asking for resolution for droidcam"

width=$(input "WIDTH")
height=$(input "HEIGHT")

if confirm "Should these values be remembered?"
then
    echo "options v4l2loopback_dc width=$width height=$height" | sudo tee /etc/modprobe.d/droidcam.conf > /dev/null
fi

sudo rmmod v4l2loopback_dc
sudo insmod /lib/modules/`uname -r`/updates/dkms/v4l2loopback-dc.ko.xz width=$width height=$height

message_done "Resolution for droidcam set"
