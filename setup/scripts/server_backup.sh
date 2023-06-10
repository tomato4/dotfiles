EXTERNAL_DIR="/run/media/tomato/drive"
EXTERNAL_DEV="/dev/sdc1"
EXTERNAL_PATH_BACKUP="/Backup/Server/$(date +'%Y_%m_%d').tar.gz"
SERVER_DIR="/mount/md0"

message_info "Input directories without trailing slash!"

input=$(input "Server directory ($SERVER_DIR)")
if [ -n "$input" ]
then
  SERVER_DIR=$input
fi

input=$(input "Backup device ($EXTERNAL_DEV)")
if [ -n "$input" ]
then
  EXTERNAL_DEV=$input
fi

input=$(input "Backup device mount directory ($EXTERNAL_DIR)")
if [ -n "$input" ]
then
  EXTERNAL_DIR=$input
fi

input=$(input "Backup location ($EXTERNAL_PATH_BACKUP)")
if [ -n "$input" ]
then
  EXTERNAL_PATH_BACKUP=$input
fi

message_info "Configuration:"
echo "Server directory: $SERVER_DIR"
echo "Backup device: $EXTERNAL_DEV"
echo "Backup device mount directory: $EXTERNAL_DIR"
echo "Backup location: $EXTERNAL_PATH_BACKUP"

if ! confirm "Proceed with this configuration?"
then
  message_warn "Aborted..."
  return 0
fi

if grep -qs "$EXTERNAL_DEV" /proc/mounts
then
    if grep -qs "$EXTERNAL_DEV $EXTERNAL_DIR " /proc/mounts
    then
        message_warn "External drive is already mounted on correct location. Skipping mount..."
    else
        EXTERNAL_DIR=$(findmnt -no TARGET $EXTERNAL_DEV)
        message_warn "External drive is already connected but on different location. ($EXTERNAL_DIR)"
        if ! confirm "Should I proceed?"
        then
            message_warn "Aborted..."
            return 1
        fi
    fi
else
    sudo mkdir -p "$EXTERNAL_DIR"
    sudo mount "$EXTERNAL_DEV" "$EXTERNAL_DIR"
    message_done "Successfully mounted '$EXTERNAL_DEV' to '$EXTERNAL_DIR'."
fi

sudo tar -cvzf "$EXTERNAL_DIR$EXTERNAL_PATH_BACKUP" "$SERVER_DIR"

message_done "Backup finished."

if confirm "Unmount and shutdown backup drive?"
then
  sudo umount "$EXTERNAL_DIR"
  sudo hdparm -y "$EXTERNAL_DEV"
fi

message_done "Successfully unmounted drive."
