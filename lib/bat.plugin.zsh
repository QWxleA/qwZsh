#bat - a better pager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
}
