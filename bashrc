# Settings
source ~/.bash/settings.bash

# Aliases
source ~/.shell/aliases.sh

# Custom prompt
source ~/.bash/prompt.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PATH="$HOME/soft/node/bin:$PATH"
export PATH="$HOME/.local/nvim/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.config/coc/extensions/coc-clangd-data/install/11.0.0/clangd_11.0.0/bin:$PATH"
