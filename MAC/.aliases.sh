alias myip='curl ip.appspot.com'

function mkcd() {
    mkdir -p "$@" && cd "$@"
}

function gitpush(){
	git add . &&
	git commit -m "$@" &&
	git push
}
alias chrome="open -a 'Google Chrome'"
alias subl="open -a 'Sublime Text'"
alias gitcheck=/Users/Shared/scripts/MAC/gitcheckMAC.sh
