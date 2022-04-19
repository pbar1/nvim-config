# Neovim Config :waxing_crescent_moon:

My personal Neovim configuration.

**Note:** Vim plugins are managed via Nix (as flake inputs). To use packer.nvim,
there is [_autogeneated_ file](lua/config/packer.lua) that bootstraps it and
installs plugins. This is only here for convenience - _you must load this file
yourself!_ It should happen in `init.lua`, before the requires block.

### Docker

You can try out this configuration by running it in a container. This command
mounts your current directory as the container working directory and launches
Neovim.

```sh
docker run                 \
  --rm --interactive --tty \
  --env="TERM=$TERM"       \
  --volume="$PWD:/workdir" \
  --workdir="/workdir"     \
  ghcr.io/pbar1/nvim-config:latest
```

### Questions & Ideas
- Does LSP rename work across files? If not, how can that be done?

## Links

- [LunarVim](https://github.com/LunarVim/LunarVim): I hear it's got an elegant
  config structure
- [GitHub issue](https://github.com/nix-community/neovim-nightly-overlay/issues/99)
  showing how to overide `pkgs.neovim`
- [Nixpkgs docs on Vim utils](https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/vim.section.md)
- [A very helpful Nix flake example](https://github.com/GTrunSec/Coding-Dev-Env-With-NixFlake/blob/main/rust/flake.nix)

