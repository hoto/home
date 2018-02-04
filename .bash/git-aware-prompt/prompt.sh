#!/usr/bin/env bash
find_git_commit_hash() {
  git_commit_hash=$(git rev-parse HEAD 2> /dev/null)
}

find_git_branch() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached★'
    fi
    git_branch="$branch"
  else
    git_branch=""
  fi
}

find_git_dirty() {
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
    git_dirty='★'
  else
    git_dirty=''
  fi
}

find_dirty_files() {
  local staged=$(git status --porcelain 2> /dev/null | /usr/bin/grep -E "^M|^A" | wc -l)
  local modified=$(git status --porcelain 2> /dev/null | /usr/bin/grep "^AM" | wc -l)
  local new=$(git status --porcelain 2> /dev/null | /usr/bin/grep "^??" | wc -l)
  number_of_git_changed_files=" (${staged}/${modified}/${new})"
}

PROMPT_COMMAND="find_git_branch; find_git_dirty; find_dirty_files; $PROMPT_COMMAND"

