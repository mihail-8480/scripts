#!/usr/bin/env bash

find_repo_root() {
  pushd "$(pwd)" > /dev/null || exit 1
  while [ ! -d .git ]; do
    if [ "$(pwd)" == "/" ]; then
      exit 1
    fi
    cd ".." || exit 1
  done
  realpath "$(pwd)" || pwd
  popd > /dev/null || exit 1
}

update_submodules() {
  git submodule update --rebase --remote
}

# Exists for compatibility reasons
find-repo-root() {
  find_repo_root "$@"
}


check_branch() {
  CURRENT_BRANCH="$(git branch --show-current)"
  if [ "$CURRENT_BRANCH" != "$1" ]; then
    echo "The current branch should be $1, got '$CURRENT_BRANCH'"
    exit 1
  fi
}

sync_branches() {
  git checkout "$2" || exit 1
  git rebase "$1" || exit 1
  git push || exit 1
  git checkout "$1" || exit 1
  git rebase "$2" || exit 1
  git push --force-with-lease || exit
}

# Taken from https://stackoverflow.com/a/64776607
# License: CC BY-SA 4.0
# Changes: ! [[ -z "$(git status --porcelain)" ]] -> [[ -n "$(git status --porcelain)" ]]
check_clean() {
  CURRENT_BRANCH="$(git branch --show-current)"
  if ! (git diff --exit-code origin/"$CURRENT_BRANCH".."$CURRENT_BRANCH" > /dev/null) \
    || ! (git diff --exit-code "$CURRENT_BRANCH" > /dev/null) \
    || [[ -n "$(git status --porcelain)" ]] ; then
    echo "Your local repo has some changes that aren't pushed to origin/$CURRENT_BRANCH."
    exit 1
  fi 
}
