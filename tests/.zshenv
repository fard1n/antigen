# zshrc file written for antigen's tests. Might not be a good one for daily use.

# See cram's documentation for some of the variables used below.

export ADOTDIR="$PWD/dot-antigen"

rm "$TESTDIR/.zcompdump"

source "$TESTDIR/../antigen.zsh"

# A test plugin repository to test out antigen with.

export PLUGIN_DIR="$PWD/test-plugin"
mkdir "$PLUGIN_DIR"

# A wrapper function over `git` to work with the test plugin repo.
pg () {
    git --git-dir "$PLUGIN_DIR"/.git --work-tree "$PLUGIN_DIR" "$@"
}

cat > "$PLUGIN_DIR"/aliases.zsh <<EOF
alias hehe='echo hehe'
EOF

{
    pg init
    pg add .
    pg commit -m 'Initial commit'
} > /dev/null
