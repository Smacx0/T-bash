#!/usr/bin/env bash

function git-branch(){
	[ $TBASH_SHOW_GIT -eq 1 ] && command git symbolic-ref -q --short HEAD 2>/dev/null;
}

function git-dirty(){
	command git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ] && echo 1 || echo 0;
}

function hg-branch(){
	[ $TBASH_SHOW_HG -eq 1 ] && command hg branch 2>/dev/null;
}

function hg-dirty(){
	[ $(command hg status 2>/dev/null | wc -l) -eq 0 ] && echo 0 || echo 1;
}