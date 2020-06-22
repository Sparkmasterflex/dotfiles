# Privileged access
if [ $UID -ne 0 ]; then
  alias sudo='sudo '
  alias root='sudo -s'
  alias reboot='sudo systemctl reboot'
  alias netctl='sudo netctl'
  alias osxkill='sudo killall -HUP mDNSResponder' # OS X 10.7 & 10.8
  alias osmkill='dscacheutil -flushcache;sudo killall -HUP mDNSResponder' # OS X 10.9 Mavericks
fi
# ls 
alias ls='ls -GhF'                  # linux: --color=auto; Mac: -G 
alias lr='ls -R'                    # recursive ls
alias ll='ls -al'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
# alias lt='ll -rt'                   # sort by date
alias tree='tree -Csu'     # nice alternative to 'recursive ls'; Don't have tree installed - WHY NOT?
# Add some color to grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
# Some other useful stuff
alias ports='netstat -tulanp' # show open ports
alias mkdir='mkdir -pv' # mkdir, create parent 
alias h='history'
alias j='jobs -l'
alias cls='clear'
alias which='type -a'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# Some help with du
alias du='du -kh'       # a more readable output.
alias df='df -kTh'
# Make Bash nicer 
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias ..='cd ..'
alias ...='cd ../..'
# OS X VNC
alias vnc='/System/Library/CoreServices/Screen\ Sharing.app/Contents/MacOS/Screen\ Sharing'
# Memory
alias meminfo='free -m -l -t' # pass options to free 
# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
# get top process eating cpu 
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='lscpu' # Get server cpu info
# get GPU ram on desktop / laptop## 
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
# Development; edit vhost, hosts and fast access to our local web root
# remember OS X; Permissions issues in web root?
# $ sudo chmod -R o+w /Library/WebServer/Documents 
alias vhosts='sudo vim /etc/apache2/extra/httpd-vhosts.conf'
alias hosts='sudo vim /etc/hosts'

# --------- Rails specific
alias spec='clear; bundle exec rspec'
alias spec:seed='clear; bundle exec rspec --seed'
alias spec:fail='clear; bundle exec rspec --only-failures'

# rails/rake
alias routes='bundle exec rake routes'
alias routesg='bundle exec rake routes | grep '
alias migrate='bundle exec rake db:migrate'
alias migrate:r='bundle exec rake db:migrate:reset'
alias rake='bundle exec rake'
alias rails='bundle exec rails'

function git_pull_current_branch {
  git pull --autostash --rebase origin $(git rev-parse --abbrev-ref HEAD)
}
function git_push_current_branch {
  git push origin $(git rev-parse --abbrev-ref HEAD)
}
function git_force_push_current_branch {
  git push origin $(git rev-parse --abbrev-ref HEAD) --force
}
alias gpull="git_pull_current_branch"
alias gpush="git_push_current_branch"
alias gpush-force="git_force_push_current_branch"
# GIT commands
alias g='git'
alias gco='git checkout'
alias gc:pro='git checkout production'
alias gs='git status'
alias gb='git branch'
alias ga='git add'
alias gd='git diff'
alias gb-del='git branch -D'
alias gc-empty='git commit --allow-empty'
alias gg='gg+ | head -n `expr $LINES / 2`'
alias gg+='git log --oneline --abbrev-commit --all --graph --decorate --color'

alias gstash="git stash --include-untracked"

alias shrug="echo '¯\\_(ツ)_/¯' | pbcopy && echo '¯\\_(ツ)_/¯'"
alias gshrug="echo '¯\\\_(ツ)\\_/¯' | pbcopy && echo '¯\\_(ツ)_/¯'"
alias tableflip="echo '(╯°□°）╯︵ ┻━┻' | pbcopy && echo '(╯°□°）╯︵ ┻━┻'"
alias tfreplace="echo '┬─┬ノ( º _ ºノ)' | pbcopy && echo '┬─┬ノ( º _ ºノ)'"
alias fu="echo 't(-.-t)' | pbcopy && echo 't(-.-t)'"
