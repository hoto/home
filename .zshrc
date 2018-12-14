emulate sh -c 'source ~/.profile'

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bullet-train"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

plugins=(
  git
)

# https://github.com/caiogondim/bullet-train.zsh
BULLETTRAIN_PROMPT_ORDER=(
    time
    status
    custom
    #context
    dir
    #screen
    #aws
    git
    cmd_exec_time
  )

source $ZSH/oh-my-zsh.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/andrzej.rehmann/.sdkman"
[[ -s "/home/andrzej.rehmann/.sdkman/bin/sdkman-init.sh" ]] && source "/home/andrzej.rehmann/.sdkman/bin/sdkman-init.sh"
