#!/usr/bin/env bash

_tbash_prompt_theme() (

	function getColor(){
		printf "\[\033[%s;%sm\]" $(getConfig "${2:-reset}") $(getConfig "${1:-reset}");
	}

	function getConfig(){
		egrep "^$1=*" "${TBASH_PATH}/config.ini" | cut -d'=' -f2;
	}

	function getStatusCodeColor(){
		[ ! -z $1 ] && $(getColor $(git-dirty || hg-dirty));
	}

	[[ ! -z $1 ]] && local vcs_style=$(getConfig vcs-symbol);

	[[ ! -z $vcs_style ]] && vcs_style="$(getColor border) $vcs_style $(getColor $(git-dirty || hg-dirty) vcs-mode)$1$(getColor reset)";

	if [[  ! -z $1 && -z $vcs_style ]]; then
		vcs_style="$(getColor border) on ⎇  $(getColor $(git-dirty || hg-dirty) vcs-mode)$1$(getColor reset)";
	fi;

	case $(($TBASH_PROMPT_THEME)) in 
		1) 
			echo "$2$(getColor user bold)\u$(getColor border)@$(getColor host bold)\h$(getColor white):$(getColor directory)\w/$(getColor reset)$vcs_style ${TBASH_PROMPT_SYMBOL:-$}";;
		2) 
			echo "$2$(getColor user bold)\u$(getColor border) in $(getColor directory)\W/$(getColor reset)$vcs_style ${TBASH_PROMPT_SYMBOL:-$}";;
		3)
			echo "$(getColor border)┌──($(getColor user bold)\u$(getColor grey)@$(getColor host bold)\h$(getColor grey))-[$2$(getColor directory bold)\w/$vcs_style$(getColor border)]\n└─${TBASH_PROMPT_SYMBOL:-$}$(getColor reset)";;
		4)
			echo "$2$(getColor directory bold)\W$(getColor reset)$vcs_style ${TBASH_PROMPT_SYMBOL:-➜}$(getColor reset)";;
		5)
			[[ ! -z $1 ]] && vcs_style=" $(getColor border)on ⎇ $(getColor vcs-bg)$1$(getColor rest)" || vcs_style="";
			echo "$2$(getColor directory bold)\W$vcs_style $(getColor border)${TBASH_PROMPT_SYMBOL:-➜}$(getColor reset)";;
		*) 
			echo "$2$(getColor directory bold)\w/$(getColor reset)$vcs_style\n${TBASH_PROMPT_SYMBOL:-»}";;
	esac;

)

set_tbash_prompt(){

	# TBASH_PATH=$(dirname $BASH_SOURCE);
	TBASH_VCS_BRANCH=$(git-branch || hg-branch);

	local word=$(echo $PS1 | egrep -o $TBASH_WORD_REGEX);

	local prompt=$(_tbash_prompt_theme $TBASH_VCS_BRANCH $word);

	PS1="$prompt ";
}