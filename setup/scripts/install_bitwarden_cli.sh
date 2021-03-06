message_info "Downloading Bitwarden CLI client."

install_pacman unzip
curl -Ls -o ~/Downloads/bw_zip.zip "https://vault.bitwarden.com/download/?app=cli&platform=linux"
unzip ~/Downloads/bw_zip.zip
sudo mv bw /usr/bin/bw
sudo chmod 755 /usr/bin/bw
rm -f ~/Downloads/bw_zip.zip

message_done "Installed Bitwarden CLI"
