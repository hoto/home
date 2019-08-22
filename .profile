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
alias ack='ack --pager -i'
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
alias server="python3 -m http.server" # localhost:8000 or provide port after space
alias server2="python -m SimpleHTTPServer" # localhost:8000
#https://fabianlee.org/2016/09/26/ubuntu-simulating-a-web-server-using-netcat/
alias mockserver='while true; do echo -e "HTTP/1.1 200 OK\n\n $(date)" | nc -l localhost 9000; done'
function jwt_decode() {
  sed 's/\./\n/g' <<< $(cut -d. -f1,2 <<< $1) | base64 --decode | jq
}
alias jwt=jwt_decode

### TMP ALIASES
alias ldap2user='lpass show 5556862302636707868 --clip --field username'
alias ldap2pass='lpass show 5556862302636707868 --clip --field password'

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
  local branch=$(git symbolic-ref --short -q HEAD)
  local command="git push --set-upstream origin $branch"
  echo ${command}
  eval ${command}
}
alias gp="git_push"

### TREE
TREE_IGNORE=".git|.svn|node_modules|.idea|bower_components|coverage|.gradle|dist|build|target"
function findTree(){ # findTree "Order*|Purchase.java"
  local pattern="$1" 
  tree -I ${TREE_IGNORE} -a -P "$pattern" --prune
}
function _tree(){
  local n=${1:='1'}
  tree -L $n -I ${TREE_IGNORE} -a
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
  cd $(fuzzy-repo-finder --projectRoots "${HOME}/projects,${HOME}/go/src/github.com/hoto" $@)
}
alias g='go_to_project'
function copy_template() {
  if [[ -z "$1" ]]; then
    tree -L 1 -d ${MY_PROJECTS}/project-templates/
    return 1
  fi
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
    return 1
  fi
  cat README.md > /tmp/original-file
  cat ${MY_PROJECTS}/project-templates/${kata_name}.md /tmp/original-file > README.md
  echo "Prepended kata description to README.md file."
}
alias kata='copy_kata_description'

### MANGO ALIASES
function mango_versions() {
  for name in partners mngidp purchasenotifications pricesloader prices product stock; do
    echo "${name}"
    for environment in dev pre pro; do
      local version=$(ssh jenkins curl -s ${name}.${environment}.mango.com/info | jq -r .build.version)
      local health=$(ssh jenkins curl -s ${name}.${environment}.mango.com/health | jq -r .status)
      printf "  ${environment}: ${health} ${version}\n"
    done
  done
}
alias versions='mango_versions'

# SOFTWARE
alias toolbox='jetbrains-toolbox'
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

### EXPORTS
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  :
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export JAVA_HOME=/Users/andrzej.rehmann/.sdkman/candidates/java/current
  export GROOVY_HOME=/Users/andrzej.rehmann/.sdkman/candidates/groovy/current
fi
function set_path() {
  export GOPATH="${HOME}/go"
  export GO_BIN="${GOPATH}/bin"
  export GO_LOCAL_BIN="/usr/local/go/bin"
  local YARN_BIN="${HOME}/.yarn/bin"
  local NPM_GLOBAL="${HOME}/.npm-global/bin"
  local RVM_BIN="${HOME}/.rvm/bin"
  local AWS_CLI_BIN="${HOME}/envs/awscli/bin/"
  local AWS_SHELL_BIN="${HOME}/envs/aws-shell/bin/"
  local JETBRAINS_TOOLBOX="${HOME}/.local/share/JetBrains/Toolbox/bin/"
  export PATH="${PATH}:${GO_BIN}:${GO_LOCAL_BIN}:${YARN_BIN}:${NPM_GLOBAL}:${AWS_CLI_BIN}:${AWS_SHELL_BIN}:${RVM_BIN}:${JETBRAINS_TOOLBOX}"
}
set_path

### OTHER CRAP
export LESS="eFRX"
export EDITOR=vim
export TIMEFORMAT='r: %R, u: %U, s: %S'
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  setxkbmap -option caps:escape # Map capslock key to escape key
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias ls='ls -G'
fi

# NVM
export NVM_DIR="$HOME/.nvm"
function load_nvm() {
  echo "nvm loaded..."
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}
alias nvm='load_nvm'
