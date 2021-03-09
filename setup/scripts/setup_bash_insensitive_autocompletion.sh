message_info "Setting up bash autocompletion case-insensitive."
if ! [[ $(cat /etc/inputrc | egrep "set\s+completion-ignore-case\s+On") ]]; then echo "set completion-ignore-case On" | sudo tee -a /etc/inputrc > /dev/null; fi
message_done "Set up."
