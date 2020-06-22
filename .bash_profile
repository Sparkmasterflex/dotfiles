# if .bashrc, run it. OS X hits .bash_profile first. 
# For the full exlanation: 
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
# if .bash_prompt, run it. @paul_irish
# https://github.com/paulirish/dotfiles; a lot more here, but love the prompt!
if [ -f ~/.bash_prompt ]; then
   source ~/.bash_prompt
fi
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
export PATH=/usr/local/bin:$PATH
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="/usr/local/sbin:$PATH"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
