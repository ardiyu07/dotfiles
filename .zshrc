# .zshrc
# 
# Yuri Ardila
# Last updated: 2013-05-15

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# oh-my-zsh plugins
plugins=(git)

RUNNING_OS=`uname -s`

# Settings for history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTCONTROL=ignoreboth
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Don’t write over existing files with >, use >! instead
setopt NOCLOBBER

# Background processes aren't killed on exit of shell
setopt AUTO_CONTINUE

# No need to write cd
setopt AUTO_CD

# Prompts for confirmation after 'rm *' etc
# Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
setopt RM_STAR_WAIT

setopt extendedglob
setopt nomatch 
setopt notify

# No beep sound
setopt NO_BEEP

# Bind emacs key
bindkey -e

# Other keybindings
if [[ $RUNNING_OS = "Linux" ]] 
then
    bindkey '^[[1;5C' emacs-forward-word
    bindkey '^[[1;5D' emacs-backward-word
    bindkey '^[[1;3C' emacs-forward-word
    bindkey '^[[1;3D' emacs-backward-word
elif [[ $RUNNING_OS = "CYGWIN_NT-6.1-WOW64" ]]
then
    bindkey '5C' emacs-forward-word
    bindkey '5D' emacs-backward-word
    bindkey '[C' emacs-forward-word
    bindkey '[D' emacs-backward-word
elif [[ $RUNNING_OS = "CYGWIN_NT-6.1" ]]
then
    bindkey '5C' emacs-forward-word
    bindkey '5D' emacs-backward-word
    bindkey '[C' emacs-forward-word
    bindkey '[D' emacs-backward-word
fi

# Alias for OS X
if [[ $RUNNING_OS = "Darwin" ]]
then
    alias 'readlink=greadlink'
fi

autoload -U compinit promptinit zcalc zsh-mime-setup zmv
compinit
promptinit
zsh-mime-setup

# Set less options
if [[ -x $(which less) ]]
then
    export PAGER="less"
    export LESS="--ignore-case --LONG-PROMPT --QUIET --chop-long-lines -Sm --RAW-CONTROL-CHARS --quit-if-one-screen --no-init"
    export LESSHISTFILE='-'
    if [[ -x $(which lesspipe) ]]
    then
	LESSOPEN="| lesspipe.sh %s"
	export LESSOPEN
    fi
fi

# Short command aliases
alias 'l=ls -lAhv'
alias 'la=ls -A'
alias 'll=ls -l'
alias 'lq=ls -Q'
alias 'lr=ls -R'
alias 'lrs=ls -lrS'
alias 'lrt=ls -lrt'
alias 'lrta=ls -lrtA'
alias 'lrth=ls -lrth'
alias 'lrtha=ls -lrthA'
alias 'j=jobs -l'
alias 'kw=kwrite'
alias 'tf=tail -F'
alias 'e=emacs -nw'
alias 'emacs=emacs -nw'
alias 'mkdir=mkdir -p'
alias 'rm=rm -v'
alias 'cp=cp -v'

# FAQ 3.10: Why does zsh not work in an Emacs shell mode any more?
# http://zsh.sourceforge.net/FAQ/zshfaq03.html#l26
[[ $EMACS = t ]] && unsetopt zle

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first -X'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

function fungir() {
    grep -ir "$1" *
}

# some more aliases
alias rma='rm *~ ; rm \#* ; rm .*~ ; rm .\#*'
alias f='find . -name'
alias gir='fungir'
alias du='du -h --max-depth 1 | sort -h'
alias df='df -h | sort -h'

# For Git
alias 'gk=gitk --all'
alias 'gs=git status' # (NB overriding GhostScript)
alias 'gd=git diff'
alias 'gg=git gui'
alias 'gco=git checkout'
alias 'gc=git clone'
alias 'gl=git log --color'
alias 'gg=git gui'
alias 'gb=git branch'
alias 'gbs=git branch --sort=-committerdate'
alias 'gpull=git pull'
alias 'gpush=git push'
alias 'gcoa=sh ${HOME}/Installer/gitcheckoutall.sh'
alias 'gcm=git commit -am'

# Global aliases (expand whatever their position)
#  e.g. find . E L
alias -g L='| less'
alias -g H='| highlights'
alias -g HC='| highlights_critical'
alias -g S='| sort'
alias -g T='| tail'
alias -g G='| grep'

# SVN aliases
alias svndelall="svn status | grep '^\!' | sed 's/! *//' | xargs -I% svn rm %"
alias svndeluntr="svn status | grep '^\?' | cut -c9- | xargs rm -rfv"
alias ss="svn st"
alias sc="svn co"
alias scm="svn commit -m"
alias sa="svn add"
alias safall="svn add --force *"
alias sr="svn revert"
alias sd="svn diff"
alias srr="svn revert -R ."

# YUM aliases
alias 'ys=yum search'
alias 'yiy=sudo yum install -y'
alias 'yi=sudo yum install'
alias 'ywp=yum whatprovides'

# RPM Aliases
alias 'rpmuvh=sudo rpm -Uvh'
alias 'rpmivh=sudo rpm -ivh'

# Make aliases
alias 'mk=make'
alias 'mkcln=make clean'

alias cleantemps='find . -name "*~" -exec rm -rfv {} \;; find . -name "\#*" -exec rm -rfv {} \;; find . -name ".*~" -exec rm -rfv {} \;; find . -name ".\#*" -exec rm -rfv {} \;; find . -name ".DS_Store" -exec rm -rfv {} \;'
alias getallbranches='for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master `; do git branch --track ${branch#remotes/origin/} $branch; done'

# Highlights output
function highlights () {
    perl -pe "s/$1/\e[1;32;40m$&\e[0m/g"
}

function highlights_critical () {
    perl -pe "s/$1/\e[1;31;43m$&\e[0m/g"
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# WGET as firefox
alias wget-as-firefox='wget --referer="http://www.google.com" --user-agent="Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6" --header="Accept:text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5" --header="Accept-Language: en-us,en;q=0.5" --header="Accept-Encoding: gzip,deflate" --header="Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7" --header="Keep-Alive: 300" -dnv'

# Change editor to emacs
export SVN_EDITOR="emacs -nw"
export EDITOR="emacs -nw"

# Fix git commit on emacs bug
git config --global core.editor ~/.emacs.d/emacs.sh

# Export default local path for nix
export PATH=$PATH:/usr/local/bin

# When asking for username and password, don't use gtk
alias git="SSH_ASKPASS='' git" 

# Load other aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Load local variables setup
if [ -f ~/.varsetup ]; then
    . ~/.varsetup
fi

# Load zsh-syntax-highlighting
source ~/Installer/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# .zshrc theme based on steeef theme

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}
PR_GIT_UPDATE=1

setopt prompt_subst
autoload colors
colors

autoload -U add-zsh-hook
autoload -Uz vcs_info

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075](branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

# primary prompt
PROMPT=$'$FG[237]------------------------------------------------------------%{\e[0;34m%}%B[%b%{\e[0;33m%}'%D{"%Y-%m-%d %I:%M:%S"}%b$'%{\e[0;34m%}%B]%b%{\e[0m%}%{$reset_color%}
%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# right prompt
RPROMPT='%~$vcs_info_msg_0_ $(virtualenv_info)$(git_prompt_info)'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if [ -f ~/.rvm/scripts/rvm ]; then
    source ~/.rvm/scripts/rvm
fi

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
# [[ -s "/Users/yuriardila/.gvm/bin/gvm-init.sh" ]] && source "/Users/yuriardila/.gvm/bin/gvm-init.sh"
export PATH="/usr/local/opt/opencv3/bin:$PATH"

eval "$(pyenv init -)"

source /opt/intel/openvino/bin/setupvars.sh
export PATH="/usr/local/opt/node@14/bin:$PATH"
export PATH="/usr/local/opt/node@12/bin:$PATH"
export PATH="/usr/local/opt/node@10/bin:$PATH"

# zz - smart directory changer
# 14dec2015  +chris+
# 15dec2015  +chris+ clean up nonexisting paths
chpwd_zz() {
    print -P '0\t%D{%s}\t1\t%~' >>~/.zz
}
zz() {
    awk -v ${(%):-now='%D{%s}'} <~/.zz '
    function r(t,f) {
      age = now - t
      return (age<3600) ? f*4 : (age<86400) ? f*2 : (age<604800) ? f/2 : f/4
    }
    { f[$4]+=$3; if ($2>l[$4]) l[$4]=$2 }
    END { for(i in f) printf("%d\t%d\t%d\t%s\n",r(l[i],f[i]),l[i],f[i],i) }' |
        sort -k2 -n -r | sed 9000q | sort -n -r -o ~/.zz
    if (( $# )); then
        local p=$(awk 'NR != FNR { exit }  # exit after first file argument
                   { for (i = 3; i < ARGC; i++) if ($4 !~ ARGV[i]) next
                     print $4; exit }' ~/.zz ~/.zz "$@")
        [[ $p ]] || return 1
        local op=print
        [[ -t 1 ]] && op=cd
        if [[ -d ${~p} ]]; then
            $op ${~p}
        else
            # clean nonexisting paths and retry
            while read -r line; do
                [[ -d ${~${line#*$'\t'*$'\t'*$'\t'}} ]] && print -r $line
            done <~/.zz | sort -n -r -o ~/.zz
            zz "$@"
        fi
    else
        sed 10q ~/.zz
    fi
}
alias z=' zz'

export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"

# For pkg-config to find zlib you may need to set:
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

setopt no_aliases

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

setopt aliases

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

capture() {
    sudo dtrace -p "$1" -qn '
        syscall::write*:entry
        /pid == $target && arg0 == 1/ {
            printf("%s", copyinstr(arg1, arg2));
        }
    '
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

