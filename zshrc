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
alias a='ls -lrth'
alias bp=' cd ~/development/brewpad/'
alias cat='bat'
alias cdr='cd $(git rev-parse --show-toplevel)' # go to root level of git dir
alias ch="history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cr='launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai"'
alias ct='git checkout test'
alias cwmstop="brew services stop yabai"
alias cwmstart="brew services start yabai"
alias dc='cd ~/development/ringo-staywell-dc'
alias dev=" cd ~/development"
alias diary='cd ~/Documents/code/journal && nvim `date +"%Y-%m-%d"`.md'
alias journal='cd ~/Documents/txt\ files && nvim `date +"%m.%d.%Y"`.txt'
alias dotfiles='cd ~/dotfiles'
alias doppler='mpv --loop-file=inf "https://radar.weather.gov/lite/N0R/PBZ_loop.gif"'
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
alias gcob='git checkout -b '
alias gcobb='git checkout -b bugfix/'
alias gcobf='git checkout -b feature/'
alias gcod='git checkout dev'
alias gcodp='git checkout dev && git pull'
alias gcom='git checkout master'
alias gcop='git checkout prod'
alias gcos='git checkout stg'
alias gf='git commit --fixup'
alias ghead='git log -1 --format="%H"'
alias ghm="open https://github.com/groupten/metro"
alias gl='git log'
alias glp='git log --graph --pretty="%C(bold magenta)%h %C(blue)%cr%C(reset) %s %C(dim normal)%an%C(reset) %C(auto)%d" --all'
alias gp='git pull'
alias gpo='git push origin'
alias gpup='git push origin `git rev-parse --abbrev-ref HEAD`'
alias gs='git status'
alias gsl='git stash list'
alias hs='history | grep'
alias job="open https://www.notion.so/ee4a68dc8a8549be92c996b196add3a4?v=6e32561f1c284407b28a90f6d82f7be9"
alias killtmux="tmux kill-server"
alias later='open https://www.notion.so/Things-to-look-at-later-2766a1c0c1be43d790f5eec981be814f'
alias life="cd ~/documents/life"
alias lg="lazygit"
alias longest="find ~/development/metro -name '*.vue' | grep -v node_modules | xargs wc -l | sort -rn | head"
alias ringo="cd ~/development/ringo"
alias metro="cd ~/development/Metro"
alias mpr="open https://github.com/GroupTen/metro/pulls"
alias n='nvim'
alias nbim='nvim'
alias nope='git merge --abort'
alias notes="cd ~/development/notes"
alias nuke='git branch --merged | egrep -v "(^\*|master|dev|stg|test)" | xargs git branch -d'
alias nvimrc='nvim .config/nvim/init.vim'
alias personal='cd ~/development/personal-site'
alias pr='gh pr create'
alias prv='gh pr view --web'
alias projects='open https://www.notion.so/Project-ideas-bd2d7d2cb5d045508d28daa07d204246'
alias raps="nvim ~/Documents/Notes/raps.md"
alias rhub="cd ~/development/RingoHub"
alias rr="ranger"
alias scrot="screencapture ~/Desktop/screenshot.jpg"
alias shane="open 'https://meet.google.com/rqb-egzy-uyq?pli=1&authuser=1'"

alias skhdrc='nvim ~/.skhdrc'
alias sp='spotify pause'
alias staywell='cd ~/development/ringo-staywell-dc'
alias sz='source ~/.zshrc'
alias tmuxconf="nvim ~/.tmux.conf"
alias t='yarn test'
alias ta="tmux a -t "
alias tk="tmux kill-session -t "
alias tl="tmux ls"
alias tn="tmux new -s "
alias todo="nvim ~/development/todo.md"
alias u='cd ../'
alias ud='yarn run dev'
alias ut='yarn test'
alias v='nvim'
alias vimrc='nvim ~/.vimrc'
alias weather="curl wttr.in"
alias wm="open https://meet.google.com/zxs-uzof-ofr"
alias y='yarn run dev'
alias ya='yarn add '
alias yd='yarn run dev'
alias yi='yarn install'
alias yt='yarn test'
alias yabairc='nvim ~/.yabairc'
alias yrc='nvim ~/.yabairc'
alias zshconfig="nvim ~/.zshrc"
alias zrc="nvim ~/.zshrc"
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
export EDITOR=nvim
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
