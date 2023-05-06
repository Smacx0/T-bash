#!/usr/bin/env bash

# T'Bash (Themed Bash)
# A Customized Bash Prompt


# Here are the list of variable which can be customized.
# starts

# HG & GIT are Vision Control System's (vcs). If Current working directory is under vcs, then working branch will be shown in the terminal prompt.
# By default, hg is disabled to improve performance.

TBASH_SHOW_HG=0 # disabled
TBASH_SHOW_GIT=1 # enabled

# Bash prompt theme
# Available themes (0 - 5)
TBASH_PROMPT_THEME=4

# Bash prompt symbol
TBASH_PROMPT_SYMBOL='';
# ends

# Internally used variables
# Dynamically changes based on the currently working directory
TBASH_PATH='';
TBASH_VCS_NAME='';
TBASH_VCS_BRANCH='';
TBASH_WORD_REGEX='\(\w+\)';


# supporting cli commands
TBASH_PATH=$(dirname $BASH_SOURCE);
source "${TBASH_PATH}/src/vcs.sh" --script-only
source "${TBASH_PATH}/src/cli.sh" --script-only
source "${TBASH_PATH}/src/theme.sh" --script-only


# This function will be invoked to update the terminal prompt
function update_terminal_prompt(){
	set_tbash_prompt;	
}