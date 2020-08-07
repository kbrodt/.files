# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# Verbosity and settings that you pretty much just always are going to want.
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	mkd="mkdir -pv" \

# Colorize commands when possible.
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	ll="ls -lah" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
