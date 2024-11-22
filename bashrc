stty -ixon  # stty ixany

# Settings
source ~/.bash/settings.bash

# Aliases
source ~/.shell/aliases.sh

# Custom prompt
source ~/.bash/prompt.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/texlive/2022/bin/x86_64-linux:$PATH"
export HSA_OVERRIDE_GFX_VERSION=9.0.0
