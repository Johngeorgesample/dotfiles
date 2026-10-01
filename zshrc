# --------------------------------------------------------------------------------
# ZSH things
# --------------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# --------------------------------------------------------------------------------
# Env variables
# --------------------------------------------------------------------------------
export EDITOR=nvim
export VISUAL=nvim
export NVM_DIR="$HOME/.nvm"
export ANDROID_SDK=$HOME/Library/Android/sdk
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(git z sublime zsh-syntax-highlighting zsh-autosuggestions globalias)
# --------------------------------------------------------------------------------
# Work things
# --------------------------------------------------------------------------------
alias gcomd='./development/deployment_tools/scripts/gcom/gcom-dev'
alias gcomo='./development/deployment_tools/scripts/gcom/gcom-ops'
# --------------------------------------------------------------------------------
# Aliases
# --------------------------------------------------------------------------------
alias .zshrc="nvim ~/.zshrc"
alias :q="exit"
alias :Q="exit"
alias a='ls -lrth'
alias bi='arch -arm64 brew install'
alias brag='open "https://docs.google.com/document/d/16RSLNniebNYNuNd84KMj8fz2kG7dDktRPOK5sfNqsOM/edit?tab=t.0#heading=h.g4zh8s80niyo"'
alias c='claude'
alias ca='clear && '
alias cat='bat'
alias cdr='cd $(git rev-parse --show-toplevel)' # go to root level of git dir
alias ch="history | awk '{a[\$2]++}END{for (i in a){print a[i] \" \" i}}' | sort -rn | head -20"
alias claude-side='tmux split-window -h -l 25% "claude"'
alias claude='claude --dangerously-skip-permissions'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cr='tuicr'
# crev (review uncommitted changes in nvim, quickfix per hunk) lives in ~/.local/bin/crev
# so the tmux popup binding (prefix+v) can run it too.
# crevd: same review but side-by-side nvim diff, one file at a time
alias crevd='git difftool --tool=nvimdiff -y'
alias dd='docker compose down'
alias dl='docker compose logs'
alias dps='docker compose ps'
alias dr='dd && du && yd'
alias du='docker compose up --build -d'
alias dev=" cd ~/development"
alias diary='cd ~/Documents/code/journal && nvim `date +"%Y-%m-%d"`.md'
alias journal='cd ~/Documents/txt\ files && nvim `date +"%m.%d.%Y"`.txt'
alias dotfiles='cd ~/dotfiles'
alias doppler='mpv --loop-file=inf "https://radar.weather.gov/lite/N0R/PBZ_loop.gif"'
alias ec="nvim $HOME/.claude/CLAUDE.md"
alias ee='yarn run e2e'
alias eu='yarn run e2e --ui'
alias gad='git add --all .'
alias gas='git rebase -i --autosquash'
alias gc='git commit -m '
alias gcl='git commit -m "linting"'
alias gclp='git commit -m "linting" && gpup'
alias gd='git diff'
alias gdm='git diff main'
alias gco='git checkout'
alias gcob='git checkout -b '
alias gcobb='git checkout -b bugfix/'
alias gcobf='git checkout -b feature/'
alias gf='git commit --fixup'
alias ghead='git log -1 --format="%H"'
alias gl='git log'
alias glp='git log --graph --pretty="%C(bold magenta)%h %C(blue)%cr%C(reset) %s %C(dim normal)%an%C(reset) %C(auto)%d" --all'
alias glb='git reflog show --pretty=format:"%gs ~ %gd" --date=relative | grep "checkout:" | grep -oE "[^ ]+ ~ .*" | awk -F~ "!seen[\$1]++" | head -n 10 | awk -F" ~ HEAD@{" "{printf(\"  \\033[33m%s: \\033[37m %s\\033[0m\\n\", substr(\$2, 1, length(\$2)-1), \$1)}"'
alias gp='git pull origin `git rev-parse --abbrev-ref HEAD`'
alias gpo='git push origin'
alias gpup='git push origin `git rev-parse --abbrev-ref HEAD`'
alias gs='git status'
alias gsa='git stash --all'
alias gsl='git stash list'
alias here='open . && exit'
alias hs='history | grep'
alias hosts='nvim /private/etc/hosts'
alias kg="lazygit" # typing is hard
alias killtmux="tmux kill-server"
alias life="cd ~/documents/life"
alias lg="lazygit"
alias longest="find . \( -name node_modules -o -name __tests__ \) -prune -o -name '*.tsx' -print | xargs wc -l | sort -rn | head"
alias n='nvim'
alias nbim='nvim'
alias ni='npm ci'
alias nope='git merge --abort'
alias nuke='git branch --merged | egrep -v "(^\*|master|dev|stg|test)" | xargs git branch -d'
alias nvimrc='nvim .config/nvim/init.vim'
alias pr='git push origin HEAD && open $(gh pr create -f)'
alias prv='gh pr view --web'
alias rr="ranger"
alias scrot="screencapture ~/Desktop/screenshot.jpg"
alias skim='open -a Skim.app'
alias sp='spotify pause'
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
alias y='yarn run dev'
alias ya='yarn add '
alias yd='yarn run dev'
alias yi='yarn install'
alias yt='yarn test'
alias zrc="nvim ~/.zshrc"
alias zshrc="nvim ~/.zshrc"
# --------------------------------------------------------------------------------
# Functions
# --------------------------------------------------------------------------------
# Put formatted link for PRs in clipboard
ghl() {
  local url
  if [[ $# -eq 0 ]]; then
    read -rp "Enter GitHub PR URL: " url
  else
    url="$1"
  fi
  gh pr ready "$url"
  ~/development/jg-hacks-github-script/gh-pr-md.sh "$url"
}

# Fuzzy searching branches to checkout
gcdi () {
        command git checkout $(git for-each-ref refs/heads/ --format='%(refname:short)' --sort='-committerdate' | fzf +s)
}

_diffshot_capture() {
  local out="$1" seed="$2"
  local staging="$out.staging"
  while :; do
    if pngpaste "$staging" 2>/dev/null; then
      local h
      h="$(shasum "$staging" 2>/dev/null | awk '{print $1}')"
      if [[ -n "$h" && "$h" != "$seed" ]]; then
        mv "$staging" "$out"
        return 0
      fi
    fi
    sleep 0.25
  done
}

# Creates a single before/after screenshot and appends it to the clipboard
# Run command, take before screenshot, take after screenshot, tada
diffshot() {
  local font="/System/Library/Fonts/Helvetica.ttc"
  local before after out

  if [[ $# -ge 2 ]]; then
    before="$1"
    after="$2"
    out="${3:-combined.png}"
  else
    out="${1:-combined.png}"
    before="${TMPDIR:-/tmp}/diffshot-before.$$.png"
    after="${TMPDIR:-/tmp}/diffshot-after.$$.png"
    local probe="${TMPDIR:-/tmp}/diffshot-probe.$$.png"
    trap "rm -f '$before' '$after' '$before.staging' '$after.staging' '$probe'" EXIT INT TERM

    local seed=""
    if pngpaste "$probe" 2>/dev/null; then
      seed="$(shasum "$probe" | awk '{print $1}')"
      rm -f "$probe"
    fi

    printf 'Take BEFORE screenshot...'
    _diffshot_capture "$before" "$seed" || return 1
    printf ' captured\n'

    printf 'Take AFTER screenshot... '
    _diffshot_capture "$after" "$(shasum "$before" | awk '{print $1}')" || return 1
    printf 'captured\n'
  fi

  magick \
    \( "$before" -gravity north -background black -splice 0x40 -font "$font" -pointsize 28 -fill white -annotate +0+8 'Before' \) \
    \( "$after"  -gravity north -background black -splice 0x40 -font "$font" -pointsize 28 -fill white -annotate +0+8 'After'  \) \
    +append "$out" || return 1

  local abs="$out"
  [[ "$abs" != /* ]] && abs="$PWD/$abs"
  osascript -e "set the clipboard to (read (POSIX file \"$abs\") as «class PNGf»)"
  echo "diffshot: wrote $out (also on clipboard)"
}

# View PR
# Opens every file changed in branch in nvim, one tab per file
vpr() {
  local base="${1:-origin/main}"
  local files=("${(@f)$(git diff --name-only -z --diff-filter=d "$base...HEAD" | tr '\0' '\n')}")
  if [[ -z "$files" ]]; then
    echo "No changed files vs $base" >&2
    return 1
  fi
  nvim -p "${files[@]}"
}
# --------------------------------------------------------------------------------
# PROMPT
# --------------------------------------------------------------------------------
autoload -Uz vcs_info; precmd() { vcs_info };
zstyle ':vcs_info:git:*' formats '[%b]'
setopt PROMPT_SUBST
PS1="%{$fg[red]%}[%{$reset_color%}$fg[yellow]%}JG$fg[green]%}@$fg[blue]%}core$fg[yellow]%} %~%{$fg[red]%}]%{$fg[blue]%}$ %{$fg[magenta]%}"'${vcs_info_msg_0_}'"%{$reset_color%} "
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAGENTA="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
# --------------------------------------------------------------------------------
# BINDINGS
# --------------------------------------------------------------------------------
## Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
# --------------------------------------------------------------------------------
# PATH
# --------------------------------------------------------------------------------
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/opt/poppler/bin:/opt/homebrew/opt/poppler/bin:$PATH"
# --------------------------------------------------------------------------------
# Things I'm afraid to touch
# --------------------------------------------------------------------------------
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
