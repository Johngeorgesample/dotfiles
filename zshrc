export ZSH="/Users/john-georgesample/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(git z sublime zsh-syntax-highlighting zsh-autosuggestions globalias)

source $ZSH/oh-my-zsh.sh
# --------------------------------------------------------------------------------
# Aliases
# --------------------------------------------------------------------------------
alias .zshrc="nvim ~/.zshrc"
alias :q="exit"
alias :Q="exit"
alias cat='bat'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cr='launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai"'
alias ct='git checkout test'
alias cwmstop="brew services stop yabai"
alias cwmstart="brew services start yabai"
alias dev=" cd ~/development"
alias diary='cd ~/Documents/code/journal && nvim `date +"%Y-%m-%d"`.md'
alias dotfiles='cd ~/dotfiles'
alias fd='displayplacer "id:7D8F5137-0762-3904-0B6C-BC80189F82A8 res:1920x1200 hz:59 color_depth:8 scaling:off origin:(0,0) degree:0" "id:98958CF3-4350-BDC2-FB15-1ADF6A8BD7D1 res:1200x1920 hz:59 color_depth:8 scaling:off origin:(-1200,-315) degree:90"'
alias fxn='cd ~/development/function/'
alias gad='git add --all .'
alias gas='git rebase -i --autosquash'
alias gc='git commit -m '
alias gd='git diff'
alias gdm='git diff master'
alias gds='git diff stg'
alias gdt='git diff test'
alias gco='git checkout'
alias gf='git commit --fixup'
alias gh='git log -1 --format="%H"'
alias gl='git log'
alias glp='git log --graph --pretty="%C(bold magenta)%h %C(blue)%cr%C(reset) %s %C(dim normal)%an%C(reset) %C(auto)%d" --all'
alias gp='git pull'
alias gpo='git push origin'
alias gs='git status'
alias hs='history | grep'
alias hub="cd ~/development/RingoHub"
alias killtmux="tmux kill-server"
alias lg="lazygit"
alias ringo="cd ~/development/ringo"
alias metro="cd ~/development/Metro"
alias mg="open https://github.com/groupten/metro"
alias n='nvim'
alias nbim='nvim'
alias nope='git merge --abort'
alias notes="cd ~/development/notes"
alias nuke='git branch --merged | egrep -v "(^\*|master|dev|stg|test)" | xargs git branch -d'
alias nvimrc='nvim .config/nvim/init.vim'
alias scrot="screencapture ~/Desktop/screenshot.jpg"
alias shane="open http://iwbi.webex.com/join/shane.baldauf"
alias skhdrc='nvim ~/.skhdrc'
alias sp='spotify pause'
alias sz='source ~/.zshrc'
alias tmuxconf="nvim ~/.tmux.conf"
alias ta="tmux a -t "
alias tk="tmux kill-session -t "
alias tl="tmux ls"
alias tn="tmux new -s "
alias v='nvim'
alias vimrc='nvim .config/nvim/init.vim'
alias wm="open https://meetings.ringcentral.com/j/1485633496"
alias wmn="open https://metro.teamfunction.io/topics/designfrontend"
alias y='yarn run dev'
alias yd='yarn run dev'
alias t='yarn test'
alias yt='yarn test'
alias yabairc='nvim ~/.yabairc'
alias yrc='nvim ~/.yabairc'
alias zshconfig="nvim ~/.zshrc"
alias zshrc="nvim ~/.zshrc"

 source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %b'

## Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

PS1="%{$fg[red]%}[%{$reset_color%}$fg[yellow]%}JG$fg[green]%}@$fg[blue]%}core$fg[magenta]%} %~%{$fg[red]%}]%{$fg[white]%}$ ${vcs_info_msg_0_}"
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAGENTA="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


eval $(thefuck --alias)

export NVM_DIR="/Users/john-georgesample/.nvm"
export ANDROID_SDK=/Users/john-georgesample/Library/Android/sdk
export PATH=/Users/john-georgesample/Library/Android/sdk/platform-tools:$PATH
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
