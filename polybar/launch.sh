#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

ENV=$(cat ~/dotfiles/setup/env)

if [ $ENV = "pc" ]
then
    polybar pc-left 2>&1 | tee -a /tmp/polybar1.log & disown
    polybar pc-right 2>&1 | tee -a /tmp/polybar2.log & disown
elif [ $ENV = "airbook" ]
then
    polybar ntb 2>&1 | tee -a /tmp/polybar1.log & disown
else
    echo "!!!Error!!! for this ENV is not predefined polybar bar. Launching ntb default bar..." | tee -a /tmp/polybar1.log
    polybar ntb 2>&1 & disown
fi

echo "Bars launched..."
