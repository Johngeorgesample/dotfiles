# John-George Sample's dot files

Personal macOS configuration for Zsh, Vim/Neovim, tmux, yabai, skhd, and lazygit. There is no installer; use only the files you want.

## Set up

Install the corresponding apps first (and Oh My Zsh with the powerlevel10k theme for `zshrc`, vim-plug for `vimrc`, and yabai plus skhd for the window-management configs). Back up any existing dotfiles before linking these into place:

```sh
# Run from this repository's root; omit any lines for apps you don't use.
ln -s "$PWD/zshrc" ~/.zshrc
ln -s "$PWD/vimrc" ~/.vimrc
ln -s "$PWD/tmux.conf" ~/.tmux.conf
ln -s "$PWD/yabairc" ~/.yabairc
ln -s "$PWD/skhdrc" ~/.skhdrc
mkdir -p ~/.config/lazygit
ln -s "$PWD/lazygit.yml" ~/.config/lazygit/config.yml
```

For Neovim instead of Vim, link `vimrc` to `~/.config/nvim/init.vim` (create the directory first). Run `:PlugInstall` in the editor after installing vim-plug. Some plugins also need external tools, notably `fzf` and Node.js for coc.nvim.

**Before loading `zshrc`**, change its `/Users/john-georgesample/...` paths to your own home directory and install or remove the referenced plugins and commands (for example `zsh-syntax-highlighting`, `zsh-autosuggestions`, `thefuck`, and `nvm`). It also contains personal project aliases. `vimrc` refers to `/usr/local/opt/fzf` and a version-specific ctags path; adjust these for your machine. The yabai settings are from an older version and may need changes for your installed version; skhd's create-space shortcut uses `jq`.

Start a new shell for Zsh, or run `source ~/.zshrc`. In tmux, press `Ctrl-s` then `r` to reload its config. Start/restart yabai and skhd using their installed service instructions after editing their configs. Launch `lazygit` to use the theme.

## Useful keys

- tmux: `Ctrl-s` is the prefix; then `h/j/k/l` changes pane, `|` splits horizontally, and `c` opens a window in the current directory.
- skhd/yabai: `Option-h/j/k/l` focuses windows; `Command-Option-1` through `9` selects a space; `Option-f` toggles fullscreen zoom. See `skhdrc` for the full shortcut list.
