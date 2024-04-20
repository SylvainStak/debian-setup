alias fuckoff="sudo shutdown now"
alias cmatrix="cmatrix -abs -u 2 -C cyan"
alias bat="batcat"

function cdd() {
    cd $(find . -type d -print | fzf)
}
