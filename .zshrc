# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh


# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#export ZSH_THEME="random"
export ZSH_THEME="agnoster"
#export ZSH_THEME="ys"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github git-flow sublime zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/Users/lukeboh/bin

#ZSH_THEME="agnoster"
export DEFAULT_USER="🐢 🚀 🚁 @MacBook"

TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace')

recolor-cmd() {
    region_highlight=()
    colorize=true
    start_pos=0
    for arg in ${(z)BUFFER}; do
        ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
        ((end_pos=$start_pos+${#arg}))
        if $colorize; then
            colorize=false
            res=$(LC_ALL=C builtin type $arg 2>/dev/null)
            case $res in
                *'reserved word'*)   style="fg=magenta,bold";;
            *'alias for'*)       style="fg=cyan,bold";;
        *'shell builtin'*)   style="fg=yellow,bold";;
    *'shell function'*)  style='fg=green,bold';;
*"$arg is"*)
    [[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=blue,bold";;
*)                   style='none,bold';;
                                                                                                                                                                                                                                                  esac
                                                                                                                                                                                                                                                  region_highlight+=("$start_pos $end_pos $style")
                                                                                                                                                                                                                                              fi
                                                                                                                                                                                                                                              [[ ${${TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
                                                                                                                                                                                                                                              start_pos=$end_pos
                                                                                                                                                                                                                                          done
                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                      check-cmd-self-insert() { zle .self-insert && recolor-cmd }
                                                                                                                                                                                                                                      check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }

                                                                                                                                                                                                                                      zle -N self-insert check-cmd-self-insert
                                                                                                                                                                                                                                      zle -N backward-delete-char check-cmd-backward-delete-char

# The next line updates PATH for the Google Cloud SDK.
source '/Users/lukeboh/Downloads/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/lukeboh/Downloads/google-cloud-sdk/completion.zsh.inc'
