alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# colors
COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[38;5;220m"
COLOR_GREEN="\033[0;32m"
COLOR_ORANGE="\033[38;5;3m"
COLOR_MAGENTA="\033[0;95m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "Changes to be committed" ]]; then
    echo -e $COLOR_ORANGE
  elif [[ ! $git_status =~ "working tree clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "Your branch is behind" ]]; then
    echo -e "\033[7m"$COLOR_YELLOW
  elif [[ $git_status =~ "HEAD detached at" ]]; then
    echo -e $COLOR_MAGENTA
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"
  local commits_count="by ([^${IFS}]*) commit."

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo -n " ($branch) "
    if [[ $git_status =~ $commits_count ]]; then
        local count=${BASH_REMATCH[1]}
        echo -n "$count "
    fi
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo " ($commit) "
  fi
}

# basename of pwd
PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w"
# colors git status
PS1+="\[\$(git_color)\]"
# prints current branch
PS1+="\$(git_branch)"
# '#' for root, else '$'
PS1+="\[\033[00m\]\$ "
export PS1
