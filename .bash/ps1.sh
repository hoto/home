source ${HOME}/.bash/git-aware-prompt/main.sh

function show_return_code_if_non_zero() {
  RETVAL=$?
  [ $RETVAL -ne 0 ] && echo "[$RETVAL] "
}

export PS1="\[$bakblu\]\[$txtwht\]\w\
\[$txtrst\]\[$txtblu\]\[$bakylw\]\
\[$txtrst\]\[$bakylw\]\[$txtblk\]  \$git_branch\
\[$txtrst\]\[$txtylw\]\
\[$txtrst\]\[$txtred\]\$git_dirty\
\[$txtrst\]\
\[$txtrst\]\[$txtred\]\$(show_return_code_if_non_zero)\
\[$txtrst\]\
\n\$ "
