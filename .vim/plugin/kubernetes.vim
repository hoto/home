" Teach vim to syntax highlight Kubernetes as yaml
"
" Install: $HOME/.vim/plugin/kubernetes.vim
" Author: Andrzej Rehmann

augroup kubernetes
  au!
  au BufRead,BufNewFile config set filetype=yaml
augroup END
