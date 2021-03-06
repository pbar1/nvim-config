# Neovim Config :waxing_crescent_moon:

My personal Neovim configuration.

**Note:** Vim plugins are managed via [Nix][1] (as flake inputs). To use [Packer][2],
there is an [autogenerated file](lua/config/packer.lua) that bootstraps it and
installs plugins. This is only here for convenience - _you must load this file
yourself!_

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

## Notes & TODOs

- (debug): Make debug UI not exit on completion. Would also be nice to have a
  Telescope keybind to expand views (local vars, etc)
- (lang): Helm and Terraform syntax highlighting could use some work
- (general): If launched in a directory, reopen the last session
- (general): `z`-like directory changing
- (editor): Twilight.nvim colors are broken
- (completion): nvim-cmp first run sometimes shows `Workspace loading` -
  investigate if this is due to large repos
- (lang): C# LSP, completion, and (maybe) DAP
- (lang) Go plugin like rust-tools
- (nix): Create a package containing Neovim packages in packpath

## Links

- [LunarVim](https://github.com/LunarVim/LunarVim): I hear it's got an elegant
  config structure
- [GitHub issue](https://github.com/nix-community/neovim-nightly-overlay/issues/99)
  showing how to overide `pkgs.neovim`
- [Nixpkgs docs on Vim utils](https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/vim.section.md)
- [A very helpful Nix flake example](https://github.com/GTrunSec/Coding-Dev-Env-With-NixFlake/blob/main/rust/flake.nix)
- [Helm support](https://www.reddit.com/r/neovim/comments/sqr6r5/comment/hwndgfe/?utm_source=share&utm_medium=web2x&context=3)
- [C# support](https://rudism.com/coding-csharp-in-neovim/)

<!-- References -->

[1]: https://nixos.org/
[2]: https://github.com/wbthomason/packer.nvim
