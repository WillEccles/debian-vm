export PATH=/usr/local/bin:/usr/local/sbin:~:$PATH

export CLICOLOR=1

hascommand() {
    command -v "$1" &>/dev/null
}

if hascommand nvim; then
    export EDITOR=nvim
else
    export EDITOR=vim
fi

alias please='sudo $(history -p !-1)'

# if we have clang installed
if hascommand clang; then
    export CC=clang
    export CXX=clang++
fi

export MAKEFLAGS=-j$(nproc)

export PROMPT_CHAR=">"

if [ "$TERM" = "linux" ]; then
    # gruvbox in TTY ;)
    echo -en "\e]P0282828"
    echo -en "\e]P8928374"
    echo -en "\e]P1CC241D"
    echo -en "\e]P9FB4934"
    echo -en "\e]P298971A"
    echo -en "\e]PAB8BB26"
    echo -en "\e]P3D79921"
    echo -en "\e]PBFABD2F"
    echo -en "\e]P4458588"
    echo -en "\e]PC83A598"
    echo -en "\e]P5B16286"
    echo -en "\e]PDD3869B"
    echo -en "\e]P6689D6A"
    echo -en "\e]PE8EC07C"
    echo -en "\e]P7A89984"
    echo -en "\e]PFEBDBB2"
    clear # fix some weird artifacting
fi
