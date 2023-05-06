#!/usr/bin/env bash

tbashcli(){

    args=( "$@" );

    case "${args[0]}" in
        show-hg | --show-hg)
            export TBASH_SHOW_HG=1;
            ;;
        hide-hg | --hide-hg)
            export TBASH_SHOW_HG=0;
            ;;
        show-git | --show-git)
            export TBASH_SHOW_GIT=1;
            ;;
        hide-git | --hide-git)
            export TBASH_SHOW_GIT=0;
            ;;
        set-theme | --set-theme)
            export TBASH_PROMPT_THEME=$((${args[1]}));
            ;;
        set-prompt-symbol | --set-prompt-symbol)
            export TBASH_PROMPT_SYMBOL=${args[1]};
            ;;
        colours | --colours)
            tbashcolours;
            ;;
        -h | --help | help)
            echo "Available commands:-";
            echo -e "* show-hg\t* show-git\t* hide-hg\t* hide-git\t* set-theme\t* set-prompt\t* colours";
            ;;
        * )
            echo "usage: tbashcli set-theme 1";
            ;;
    esac;

}

tbashcolours(){
    local _colour=$(tput colors);
    if [[ $_colour == "256" ]]; then
        for i in $(seq 1 256); do
            echo -ne "\033[38;5;${i}m${i}\033[0m\t";
        done;
    else
        for i in $(seq 1 8); do
            echo -ne "\033[$(( 30 + $i ))m${i}\033[0m\t";
        done;
    fi;
    echo "";
}