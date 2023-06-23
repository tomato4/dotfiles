SERVER_DIR="/mnt/md0"
SERVER_USER="root@10.0.1.39"
BACKUP_USER="tomato@10.0.1.16"
BACKUP_DEV="/dev/sdc1"
BACKUP_DIR="/run/media/tomato/drive"
BACKUP_REPO_PATH="/Backup/server::$(date +'%Y_%m_%d')"

message_info "Input directories without trailing slash!"

input=$(input "Server directory ($SERVER_DIR)")
if [ -n "$input" ]
then
  SERVER_DIR=$input
fi

input=$(input "Server user ($SERVER_USER)")
if [ -n "$input" ]
then
  SERVER_USER=$input
fi

input=$(input "Backup user ($BACKUP_USER)")
if [ -n "$input" ]
then
  BACKUP_USER=$input
fi

while :
do
  input=$(input "Backup device [? for list] ($BACKUP_DEV)")
  if [ "$input" == "?" ]
  then
    echo
    lsblk
    echo
    continue
  elif [ -n "$input" ]
  then
    BACKUP_DEV=$input
  fi
  break
done

input=$(input "Backup device mount directory ($BACKUP_DIR)")
if [ -n "$input" ]
then
  BACKUP_DIR=$input
fi

input=$(input "Backup repository ($BACKUP_REPO_PATH)")
if [ -n "$input" ]
then
  BACKUP_REPO_PATH=$input
fi

message_info "Configuration:"
echo
echo "Server directory: $SERVER_DIR"
echo "Server user: $SERVER_USER"
echo "Backup user: $BACKUP_USER"
echo "Backup device: $BACKUP_DEV"
echo "Backup device mount directory: $BACKUP_DIR"
echo "Backup repository: $BACKUP_REPO_PATH"
echo

if ! confirm "Proceed with this configuration?"
then
  message_warn "Aborted..."
  exit 0
fi

if grep -qs "$BACKUP_DEV" /proc/mounts
then
    if grep -qs "$BACKUP_DEV $BACKUP_DIR " /proc/mounts
    then
        message_warn "External drive is already mounted on correct location. Skipping mount..."
    else
        BACKUP_DIR=$(findmnt -no TARGET "$BACKUP_DEV")
        message_warn "External drive is already connected but on different location. ($BACKUP_DIR)"
        if ! confirm "Should I proceed?"
        then
            message_warn "Aborted..."
            exit 1
        fi
    fi
else
    sudo mkdir -p "$BACKUP_DIR"
    sudo mount "$BACKUP_DEV" "$BACKUP_DIR"
    message_done "Successfully mounted '$BACKUP_DEV' to '$BACKUP_DIR'."
fi

# shellcheck disable=SC2029
ssh -t "$SERVER_USER" "
BORG_RELOCATED_REPO_ACCESS_IS_OK=true
borg create --progress '$BACKUP_USER:$BACKUP_DIR$BACKUP_REPO_PATH' '$SERVER_DIR'
" < /dev/tty

message_done "Backup finished."

if confirm "Unmount and shutdown backup drive?"
then
  sudo umount "$BACKUP_DIR"
  sudo hdparm -y "$BACKUP_DEV"
fi

message_done "Successfully unmounted drive."
