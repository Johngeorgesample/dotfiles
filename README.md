# John-George Sample's dot files

I don't have a handy way to install these yet, but feel free to poke around.

## Ghostty

To install the Ghostty config on macOS:

```sh
mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"
cp ghostty/config "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
```
## Pi

To set up Pi on a new machine (from this repo's root):

1. Install Node.js 22.19+ and Pi: `npm install -g --ignore-scripts @earendil-works/pi-coding-agent`.
2. Back up any existing `~/.pi/agent/settings.json` before replacing it, then copy the tracked configuration:
   ```sh
   mkdir -p ~/.pi/agent/themes
   cp .pi/agent/settings.json .pi/agent/zsh-with-aliases ~/.pi/agent/
   cp .pi/agent/themes/catppuccin-macchiato.json ~/.pi/agent/themes/
   ```
3. Run `pi update --extensions` to install/reconcile the packages declared in `settings.json`.
4. Start `pi`, run `/login` for your provider, and use `/model` to select an available model if the configured `openai-codex` / `gpt-6-sol` isn't available. Run `/reload` if Pi was already open when you copied the files.

This is a partial setup, not a full agent backup: custom skills, MCP servers, global instructions, credentials (`auth.json`), sessions, and caches are not tracked. The `skills` entries in `settings.json` only exclude paths on the original machine; they do not install skills. The shell wrapper starts interactive zsh to load aliases from `~/.zshrc`; it assumes zsh is installed at `/bin/zsh`.

## tmux agent status

The status bar shows Pi/Claude state (`…` working, `✓` done, `!` waiting), a running shell command (including expanded aliases), or the directory at a prompt. Command arguments may be visible in the status bar; avoid putting secrets on command lines.

From this repo's root, back up existing configs before replacing or merging them:

```sh
cp tmux.conf ~/.tmux.conf
cp zshrc ~/.zshrc
mkdir -p ~/.local/bin ~/.pi/agent/extensions
install -m 755 bin/tmux-agent-status ~/.local/bin/tmux-agent-status
install -m 755 bin/tmux-agent-picker ~/.local/bin/tmux-agent-picker
cp .pi/agent/extensions/tmux-agent-status.ts ~/.pi/agent/extensions/
```

Merge each event in `claude/tmux-hooks.json` into `~/.claude/settings.json`'s `hooks` object, **appending** to existing event arrays (do not replace other hooks). Start new Pi/Claude sessions and new zsh shells inside tmux; reload tmux with `tmux source-file ~/.tmux.conf`.

With [fzf](https://github.com/junegunn/fzf) installed, press tmux prefix then `a` for a cross-session picker of agents waiting (`!`) or done (`✓`). Enter jumps to that pane; waiting agents appear first.

## Lazygit theme

To use the Catppuccin Macchiato theme in `lazygit.yml`, install lazygit and link the config from this repository's root:

```sh
mkdir -p ~/.config/lazygit
ln -s "$PWD/lazygit.yml" ~/.config/lazygit/config.yml
```

Back up or remove an existing `~/.config/lazygit/config.yml` first. Run `lazygit` to see the theme.
