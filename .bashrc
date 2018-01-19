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
alias home='cd /Library/WebServer/Documents'

# --------- Functions to make life easier 

# cd and ls in one
cl() {
if [ -d "$1" ]; then
  cd "$1"
  ls
  else
  echo "bash: cl: '$1': Directory not found"
fi
}

function extract()      # Handy Extract Program.
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

function lowercase()  # move filenames to lowercase
{
    for file ; do
        filename=${file##*/}
        case "$filename" in
        */*) dirname==${file%/*} ;;
        *) dirname=.;;
        esac
        nf=$(echo $filename | tr A-Z a-z)
        newname="${dirname}/${nf}"
        if [ "$nf" != "$filename" ]; then
            mv "$file" "$newname"
            echo "lowercase: $file --> $newname"
        else
            echo "lowercase: $file not changed."
        fi
    done
}

# --------- Rails specific
alias spec:all='clear; bundle exec rake RAILS_ENV=test spec'
alias spec='clear; bundle exec rspec'
alias spec:seed='clear; bundle exec rspec --seed'
alias spec:fail='clear; bundle exec rspec --only-failures'
#  --order defined -f d

# rails/rake
alias routes='bundle exec rake routes'
alias migrate='bundle exec rake db:migrate'
alias migrate:r='bundle exec rake db:migrate:reset'
alias rake='bundle exec rake'
alias rails='bundle exec rails'

alias r:clear="echo 'Resque.queues.each{|q| Resque.redis.del \"queue:#{q}\" }' | pbcopy && echo 'Resque.queues.each{|q| Resque.redis.del \"queue:#{q}\" } COPIED!' && rails c"
alias r:pool="bundle exec resque-pool --environment development --daemon"

function git_pull_current_branch {
  git pull --rebase origin $(git rev-parse --abbrev-ref HEAD)
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
alias gco='GTI_SPEED=2000 gti checkout'
alias gc:pro='GTI_SPEED=2000 gti checkout production'
alias gs='git status'
alias gb='GTI_SPEED=2000 gti branch'
alias ga='git add'
alias gd='git diff'
alias gb-del='GTI_SPEED=2000 gti branch -D'

alias gc-empty='git commit --allow-empty'

alias gg='gg+ | head -n `expr $LINES / 2`'
alias gg+='GTI_SPEED=2000 gti log --oneline --abbrev-commit --all --graph --decorate --color'

function git_log_between() {
  if [ -z ${1+x} ]; then
    echo "===== need a date ===="
  else
    git log --after="$1" --before="$2"
  fi
}
alias gl=git_log_between

alias sync='browser-sync start --proxy localhost:3000 --files "app/**/*"'

npm_publish() {
  if [ -z ${1+x} ]; then
    echo "===== ERROR: versioning require: 'major', 'minor' or 'patch' ======"
  else
    echo "npm run build"
    if [ $1 != "help" ]; then
      npm run build
    fi
    echo "npm version $1"
    if [ $1 != "help" ]; then
      npm version $1
    fi
    echo "git push"
    if [ $1 != "help" ]; then
      gpush
    fi
    echo "npm publish"
    if [ $1 != "help" ]; then
      npm publish
    fi
  fi
}
alias npm:pub=npm_publish

alias shrug="echo '¯\\_(ツ)_/¯' | pbcopy && echo '¯\\_(ツ)_/¯'"
alias tableflip="echo '(╯°□°）╯︵ ┻━┻' | pbcopy && echo '(╯°□°）╯︵ ┻━┻'"
alias tfreplace="echo '┬─┬ノ( º _ ºノ)' | pbcopy && echo '┬─┬ノ( º _ ºノ)'"

export CDPATH=/Users/realgeeks-keithraymond/Apps

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

set -o vi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
