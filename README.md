# John-George Sample's dot files

I don't have a handy way to install these yet, but feel free to poke around.

## Pi

The tracked Pi settings and active theme are in `.pi/agent/`. To use them, copy those two files to `~/.pi/agent/` (create `themes/` if needed), then run `/reload` in Pi. Install the packages listed in `settings.json` separately with `pi install` if needed. Credentials (`auth.json`), sessions, caches, and machine-specific state are not tracked.
