squash2stash() {
        local target_branch=${1:-origin/main}
        git fetch
        local main_commit="$(git merge-base HEAD $target_branch)"
        local current_branch="$(git rev-parse --abbrev-ref HEAD)"
        git switch -c temp/squash2stash # create temporary branch to not change current branch directly
        git reset --soft "$main_commit"
        git stash
        git switch $current_branch
        git branch -d temp/squash2stash
}
