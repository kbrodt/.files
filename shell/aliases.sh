# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# settings that you pretty much just always are going to want.
alias \
	cp="cp -i" \
	mv="mv -i" \
	rm="rm -I" \
	mkd="mkdir -p" \
    df="df -h" \

# navigation
alias \
    ..="cd .." \
    ...="cd ../.." \
    .3="cd ../../.." \

function listdot() { ls -al --color=auto | awk '{if ($9~/^\./) {print}}'; }

function pvenv() {
    if [ -d venv ]; then
        . venv/bin/activate
    else
        . ~/venv/bin/activate
    fi
}

# Colorize commands when possible.
alias \
	la="ls -a --color=auto --group-directories-first" \
	ll="ls -l --color=auto --group-directories-first" \
    l.="listdot" \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
    pv=pvenv \
