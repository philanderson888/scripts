alias myip='curl ip.appspot.com'

function mkcd() {
    mkdir -p "$@" && cd "$@"
}

function gitpush(){
	git add . &&
	git commit -m "$@" &&
	git push
}