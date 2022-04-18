# Neovim Config :waxing_crescent_moon:

My personal Neovim configuration.

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
