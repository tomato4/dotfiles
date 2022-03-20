function gitclean
    git fetch --all -p
    git branch -vv | grep ": gone]" | awk '{ print $1 }' | xargs -r -n 1 git branch -D
    git branch --merged | egrep -v "(^\*|master|dev)" | xargs -r git branch -d
end
