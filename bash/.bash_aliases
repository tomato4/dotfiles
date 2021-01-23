alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias vim='nvim'
alias diff='diff --color=auto'

# Open basic applications on start
alias start='opera & spotify & discord & exit'
alias work='google-chrome-stable & /home/tomato/netbeans-12.0/netbeans/bin/netbeans & slack &konsole --workdir ~/NetBeansProjects/cme/ & exit'

# Open folders
alias cme='cd ~/NetBeansProjects/cme/'
alias unity='cd ~/UnityProjects/The\ Project/'
alias school='cd ~/School/'

# Screen sharing via loopback
alias scrshare='~/Stažené/Mon2Cam.sh'
alias scrsharerepair='sudo echo; cd ~/Stažené/v4l2loopback-master/; make clean; make; sudo make install; sudo depmod -a; sudo modprobe v4l2loopback; scrshare'

# Some basic shortcuts
alias cl='clear'
alias hdd='sudo /usr/local/bin/hddquiet'
alias make='make -j12'
alias myg++='g++ -Wall -pedantic -Wextra -g -fsanitize=address'

# make dir and move into it shortcut
mkcd() {
  mkdir "$1"
  cd "$1"
}
