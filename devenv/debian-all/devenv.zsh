export LC_CTYPE=sv_SE.UTF-8
export LANG=sv_SE.UTF-8
export LANGUAGE=sv_SE.UTF-8

eval $(dircolors ~/.dircolors)

typeset -U path
export SHELL=/usr/bin/zsh
export EDITOR=nvim
export VISUAL=$EDITOR
export PAGER=less
export REPORTTIME=5
export TIMEFMT="%U user, %S system, %P cpu, %*Es total"
# export KUBECONFIG=${HOME}/.kube/k0s.config

alias ftpfs="curlftpfs -o uid=$(id -u),gid=$(id -g) "
alias pmount="pmount -A -c utf8 --fmask 0113 --dmask 0007 "
alias revdns="dig +noall +answer -x "
alias tmux="tmux -u2"
alias _tm="tmux attach-session || tmux"
alias irc="dtach -A /tmp/irc -e '^d' weechat "
alias docker_clean_containers="docker rm -v \$(docker ps -a -q -f status=exited)"
alias docker_clean_volumes="docker volume rm \$(docker volume ls -qf dangling=true)"
alias curd="echo \$PWD | awk -F/ '{print \$NF}'"
alias mpts="df | tail -n +2 | awk '! /dev/ {print \$NF}' | sort"
alias ipa="ip -f inet -o -s a|cut -d' ' -f2,7"
alias mostrecent="printf '%s\n' **/*(.om[1])"

# Good way to monitor IO
# watch -n 1 "(ps aux | awk '\$8 ~ /D/  { print \$0 }')"
alias monio="watch -n 1 \"(ps aux | awk '\$8 ~ /D/  { print \$0 }')\""


# Global aliases, expanded in command lines, don't need to be first word
alias -g ...='../../'
alias -g ....='../../../'
alias -g .....='../../../../'

# key bindings
bindkey "^V" edit-command-line
# key bindings END

######################################
# I'm defining functions here as well

fix_known_hosts() {
   local row=$1
   vim -c ':set nowrap' +$row ~/.ssh/known_hosts
}

_p() {
	local proc=$1
	ps aux | grep $proc
}

ppid() {
	ps -p ${1:-$$} -o ppid=
}

grepip() {
	grep -oE '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)' $*
}

sortip() {
	sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n
}

pwgen() {
	openssl rand -base64 ${1:-12}
}

percentoff() {
	local original_price=$1
	local percent=$2
	local off=$(bc -l <<< "scale=2; ($original_price/100)*$percent")
	local newprice=$(bc -l <<< "scale=2; $original_price - $off")
	echo "$original_price - $percent% ($off) = $newprice"
}

percenton() {
	local original_price=$1
	local percent=$2
	local xtra=$(bc -l <<< "scale=2; ($original_price/100)*$percent")
	local newprice=$(bc -l <<< "scale=2; $original_price + $xtra")
	echo "$original_price + $percent% ($xtra) = $newprice"
}

# Fahrenheit to Celcius
f2c() {
	local tempF=$1
	local tempC=$(bc -l <<< "scale=2; (($tempF - 32) * 5)/9")
	echo "$tempF degrees Fahrenheit = $tempC degrees Celcius"
}

# Foot-pound to joules
fp2j() {
	local fp=$1
	local j=$(bc -l <<< "scale=2; $fp * 1.3558")
	echo "$fp ft lbs is $j joule"
}

# Joule to foot-pound
j2fp() {
	local j=$1
	local fp=$(bc -l <<< "scale=2; $j / 1.3558")
	echo "$j joules is $fp ft lbs"
}

# Kilometers per hour to meters per second
kmph2ms() {
	local kmph=$1
	local ms=$(bc -l <<< "scale=2; $kmph * 0.277777778")
	echo "$kmph kilometers per hour is $ms meters per second"
}

urlunquote() {
	python3 -c "from urllib.parse import unquote;from sys import argv;print(unquote(''.join(argv[1:])))" $1
}

gobuild_static_strip() {
	local outfile=$1
	shift
	env CGO_ENABLED=0 go build -ldflags="-d -s -w" -o $outfile $@
	ls -lh $outfile
}

# readlink -f for OSX
readlinkf() {
	perl -MCwd -le 'print Cwd::abs_path shift' "$1";
}

# Timestamp
_ts() {
	date -Iseconds | cut -d + -f1 | sed 's/T/_/;s/://g'
}

