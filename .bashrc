#!/usr/bin/env bash

### UTIL ALIASES
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias ls='ls --color --group-directories-first'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias ls='ls -G'
fi
alias des='cd ~/Desktop'
alias l='ls'
alias la='ls -a'
alias ll='ls -lash'
alias colors='perl .bash/256colors2.pl'
alias grep='grep --ignore-case --line-number --color'
function grep_highlight() {
  grep -E "$1|\$"
}
alias greph='grep_highlight'
alias tree='tree -C'
alias terminal='tilix &'
alias ter='tilix &'
alias exp='nautilus --browser . &'
alias ports='sudo lsof -i -n -P | grep TCP'
alias c='~/envs/pygmentize/bin/pygmentize -g'
alias stat='/usr/bin/stat --format "%a %U %G %n [%F]"'
alias ack='ack -i'
alias acki='/usr/bin/ack'
alias ackf='ack -f | ack -i'
function open_chrome() {
  local url=$1
  google-chrome ${url} &
  exit
}
alias gm='open_chrome https://mail.google.com/mail/u/0/'
alias gmm='open_chrome https://mail.google.com/mail/u/1/'
alias lastpass='lpass'
function set_backlight() {
  xbacklight -set $1
}
alias b='set_backlight'
alias diff='webstorm diff'
alias k='kubectl'
alias o='xdg-open'
alias less='less -S'
alias light='gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"'
alias white='light'
alias dark='gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"'
alias black='dark'
alias rmp='rm -rf .idea && find . -name "*.iml" | xargs rm'
alias fix_project='rmp'
function scanpdf() {
  local file=$1
  convert ${file} -colorspace gray \( +clone -blur 0x1 \) +swap -compose divide -composite -linear-stretch 1%x0% -rotate 1.5 scanned.pdf
}
alias scan_pdf='scanpdf'
alias ipcheck="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"

### GIT
alias gg="cd ~/projects; tree -L 1 -d"
alias gc="git commit -m"
alias ga="git add -A"
alias gs="git status"
alias gd="git diff"
alias gds="gd --staged"
alias gcm="git checkout master"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %C(bold magenta)%an%Creset %Cgreen%cr' --abbrev-commit"
alias gsm="git submodule"
function git_hash() {
  local n=${1:-'3'}
  git log --pretty=format:'%h' -n ${n}
}
function git_hash_colorized() {
  echo -e "$( \
      git_hash $1 | \
      sed '1 s/^/\\\e[35m/g' | \
      sed '1 s/$/\\\e[0m /g' | \
      sed '2~1 s/6/\\\e[96m6\\e[0m/g' | \
      awk '{a[i++]=$0} END {for (j=i-1; j>=0;) print a[j--] }' \
    )"
}
alias gh="git_hash_colorized"
function git_push() {
  git push --set-upstream origin $(echo $git_branch)
}
alias gp="git_push"

### TREE
function _tree(){
  local n=${1:='1'}
  tree -L $n -I ".git|.svn|node_modules|.idea|bower_components|coverage|.gradle" -a
}
alias t='_tree 1'
alias t1='_tree 1'
alias t2='_tree 2'
alias t3='_tree 3'
alias t4='_tree 4'
alias t5='_tree 5'
alias t6='_tree 6'
alias t7='_tree 7'
alias t8='_tree 8'
alias tt='t8'

### ANSIBLE
alias ap='ansible-playbook'
alias av='ansible-vault'
alias ag='ansible-galaxy'

### PROJECTS ALIASES
PROJECTS="${HOME}/projects"
MY_PROJECTS="${PROJECTS}/hoto"
alias proj="cd ${PROJECTS}"
alias ans="cd ${MY_PROJECTS}/ansible-home-fedora"
alias home="cd ${MY_PROJECTS}/home"
function go_to_project() {
  local pattern=$1
  fuzzy-project-finder ${pattern}
  local selectedProjectPath=$(cat ~/.fuzzy-project-finder/.projects)
  cd ${selectedProjectPath}
}
alias g='go_to_project'
function copy_template() {
  local template_name="$1"
  #cp --recursive ${MY_PROJECTS}/project-templates/${template_name}/. .
  cp -R ${MY_PROJECTS}/project-templates/${template_name}/. .
  echo "Copied ${template_name} template files."
  git init
}
alias template='copy_template'
function copy_kata_description() {
  local kata_name="$1"
  if [[ -z "$1" ]]; then
    ls -1  ${MY_PROJECTS}/project-templates/ | /usr/bin/grep kata | rev | cut -c 4- | rev
    return
  fi
  cat README.md > /tmp/original-file
  cat ${MY_PROJECTS}/project-templates/${kata_name}.md /tmp/original-file > README.md
  echo "Prepended kata description to README.md file."
}
alias kata='copy_kata_description'

### MANGO ALIASES
function mango_versions() {
  for name in pricesloader prices partners product stock; do
    echo "${name}"
    for environment in dev pre pro; do
      local version=$(ssh jenkins curl -s ${name}.${environment}.mango.com/info | jq -r .build.version)
      local health=$(ssh jenkins curl -s ${name}.${environment}.mango.com/health | jq -r .status)
      printf "${environment}: ${health} ${version}\n"
    done
  done
}
alias versions='mango_versions'

# SOFTWARE
alias wn='webstorm ${PWD}/ &'
alias w='(wn) && exit'
alias in='idea ${PWD}/ &'
alias i='(in) && exit'
alias pn='charm ${PWD}/ &'
alias p='(pn) && exit'
alias an='nohup atom -a ${PWD}/ > /dev/null'
alias a='an && exit'
alias vn='code ${PWD} &'
alias v='(vn) && exit'

### DOCKER
alias dc='COMPOSE_HTTP_TIMEOUT=99999 docker-compose'
alias d='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'

### XCLIP
alias xclip='xclip -selection primary -f | xclip -selection clipboard -f'

### PS1
BASH_SCRIPTS=${HOME}/.bash
source ${BASH_SCRIPTS}/ps1.sh

### Colors for man
export PAGER=less
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;31m') # enter standout (searched phrase) mode - red
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan

### HSTR (CTRL + R history enhancer) https://github.com/dvorka/hstr
export HH_CONFIG=hicolor,rawhistory # get more colors and sort by date
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
shopt -s histappend              # append new history items to .bash_history
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi # if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)

### EXPORTS
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  :
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home
  export GROOVY_HOME=/usr/local/opt/groovy/libexec
fi
function set_path() {
  export GOPATH="${HOME}/go"
  local GO_BIN="${HOME}/bin"
  local GO_LOCAL_BIN="/usr/local/go/bin"
  local YARN_BIN="${HOME}/.yarn/bin"
  local NPM_GLOBAL="${HOME}/.npm-global/bin"
  local RVM_BIN="${HOME}/.rvm/bin"
  local AWS_CLI_BIN="${HOME}/envs/awscli/bin/"
  local AWS_SHELL_BIN="${HOME}/envs/aws-shell/bin/"
  export PATH="${PATH}:${GO_BIN}:${GO_LOCAL_BIN}:${YARN_BIN}:${NPM_GLOBAL}:${AWS_CLI_BIN}:${AWS_SHELL_BIN}:${RVM_BIN}"
}
set_path

### OTHER CRAP
export EDITOR=vim
export TIMEFORMAT='r: %R, u: %U, s: %S'
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  setxkbmap -option caps:escape # Map capslock key to escape key
  source /usr/share/bash-completion/completions/git
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias ls='ls -G'
fi
__vte_prompt_command() { true; } # there is this stupid warning on fedora sometimes

### Countdown
countdown()
(
  IFS=:
  set -- $*
  secs=$(( ${1#0} * 3600 + ${2#0} * 60 + ${3#0} ))
  while [ $secs -gt 0 ]
  do
    sleep 1 &
    printf "\r%02d:%02d:%02d" $((secs/3600)) $(( (secs/60)%60)) $((secs%60))
    secs=$(( $secs - 1 ))
    wait
  done
  echo
)
alias pomo='countdown "00:25:00"'

# NVM
export NVM_DIR="$HOME/.nvm"
function load_nvm() {
  echo "nvm loaded..."
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}
alias nvm='load_nvm'


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/andrzej.rehmann/.sdkman"
[[ -s "/home/andrzej.rehmann/.sdkman/bin/sdkman-init.sh" ]] && source "/home/andrzej.rehmann/.sdkman/bin/sdkman-init.sh"
