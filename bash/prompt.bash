ATTRIBUTE_RESET='\[\e[0m\]'
ATTRIBUTE_BOLD='\[\e[1m\]'
ATTRIBUTE_DIM='\[\e[2m\]'
ATTRIBUTE_UNDERLINED='\[\e[4m\]'
ATTRIBUTE_BLINKING='\[\e[5m\]'
ATTRIBUTE_REVERSED='\[\e[7m\]'
ATTRIBUTE_HIDDEN='\[\e[8m\]'

COLOR_BLACK='\[\e[30m\]'
COLOR_RED='\[\e[31m\]'
COLOR_GREEN='\[\e[32m\]'
COLOR_YELLOW='\[\e[33m\]'
COLOR_BLUE='\[\e[34m\]'
COLOR_MAGENTA='\[\e[35m\]'
COLOR_CYAN='\[\e[36m\]'
COLOR_WHITE='\[\e[37m\]'
COLOR_DEFAULT='\[\e[39m\]'

COLOR_1=$COLOR_BLUE
COLOR_2=$COLOR_DEFAULT
COLOR_3=$COLOR_CYAN
COLOR_4=$COLOR_GREEN
COLOR_5=$COLOR_MAGENTA
COLOR_6=$COLOR_YELLOW
COLOR_7=$COLOR_RED

COLOR_MYBLUE="\e[38;2;123;185;221m"    # #F35A45
COLOR_MYRED="\e[38;2;243;90;69m"       # #7BB8DD
COLOR_MYPESOK="\e[38;2;211;185;186m"   # #D3B9BA
COLOR_MYGREEN="\e[38;2;215;185;186m"   # #D7B9BA
COLOR_MYYELLOW="\e[38;2;195;195;111m"  # #C3C36F

#COLOR_1=$COLOR_MYGREEN
#COLOR_3=$COLOR_MYRED
#COLOR_4=$COLOR_WHITE
#COLOR_5=$COLOR_MYBLUE
#COLOR_6=$COLOR_MYYELLOW

# https://unix.stackexchange.com/questions/204707/ls-colors-for-256-color-terminal
# https://linuxopsys.com/topics/colors-for-ls-mean-change-colors-for-ls-in-bash
#COLOR_FI='0;37'
#COLOR_FI='\e[0;38;2;238;238;238'
#COLOR_DI='\e[1;38;2;27;96;161'
#COLOR_EX='\e[1;38;2;38;173;38'
#COLOR_LN='\e[1;38;2;54;209;204'
#COLOR_SO='\e[1;38;2;188;27;196'
#
#LS_COLORS=$LS_COLORS\
#:'fi='${COLOR_FI}\
#:'di='${COLOR_DI}\
#:'ex='${COLOR_EX}\
#:'ln='${COLOR_LN}\
#:'so='${COLOR_SO}\
#
#export LS_COLORS

machine_name() {
    if [[ -f $HOME/.name ]]; then
        cat "$HOME"/.name
    else
        hostname
    fi
}

PROMPT_DIRTRIM=3
PS1="\n${COLOR_1}#${COLOR_2} ${COLOR_3}\\u${COLOR_2} ${COLOR_4}at${COLOR_2} ${COLOR_5}\$(machine_name)${COLOR_2} ${COLOR_4}in${COLOR_2} ${COLOR_6}\w${COLOR_2}\n\$(if [ \$? -ne 0 ]; then echo \"${COLOR_7}!${COLOR_2} \"; fi)${COLOR_1}>${COLOR_2} "
PS2="${COLOR_1}>${COLOR_2} "

COLOR_GRAY='\e[38;5;246m'

demoprompt() {
    PROMPT_DIRTRIM=1
    PS1="${COLOR_GRAY}\w ${COLOR_1}\$ "
    trap '[[ -t 1 ]] && tput sgr0' DEBUG
}
