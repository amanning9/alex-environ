#!/usr/bin/bash

#If tmux dosn't exist, or we're already in tmux, don't so anything
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]
then

# Get all temux sessions, and see if anyone is attached.
sessions=`tmux ls -F "#{session_name}:#{session_attached}"`


# Check what sessions exist.
# Pick a disconnected one to connect to. (the last one).
connectto="-1"
for item in ${sessions//\\n/ }
do
    name=`echo $item | cut -d":" -f1`
    connected=`echo $item | cut -d":" -f2`
    if [ $connected -eq "0" ]
    then
        connectto=$name
    fi
done

#iterm2 wants command mode
tmuxargs=""
if [ `uname -o` = "Darwin" ]
then
    tmuxargs=""
fi

# If we got a session to connect to, connect to it.
# If not, safe to create a new session.
if [ $connectto -eq "-1" ]
then
    exec tmux $tmuxargs new
else
    exec tmux $tmuxargs attach -t $connectto
fi

#We created a tmux session, bashrc will run inside it. Stop executing this one.
return
fi
