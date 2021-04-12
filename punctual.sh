#!/bin/bash

# punctual - poor man's powerline?

# initial default background colour
punctual_bg="${punctual_bg:-30}" # cyan-ish
punctual_fg="${punctual_fg:-7}"  # 0 black, 7 white

# 256 colour escape sequences
# set fg: \e[38;5;${fg}m
# set bg: \e[48;5;${bg}m
# both:   \e[38;5;124;48;5;155m
# e.g. 155 is yellow, 124 is a red;

punctual_prompt_command() {
    local last_return="$?"

    PS1="\[\e[48;5;${punctual_bg};38;5;${punctual_bg}m\]: "
    PS1+="\[\e[48;5;${punctual_bg};38;5;${punctual_fg}m\]\h "

    if [ 0 = "$last_return" ]; then
        PS1+="\[\e[0;38;5;${punctual_bg}m\]▶" # default bg; punctual_bg fg
    else
        # append a red chevron bit with status code
        PS1+="\[\e[0;41;38;5;${punctual_bg}m\]▶"  # green foreground, red background?
        PS1+="\[\e[0;41m\] $last_return "
        PS1+="\[\e[0;31m\]▶"
    fi
    PS1+="\e[8m\];\[\e[0m\]"
}
PROMPT_COMMAND="punctual_prompt_command"
