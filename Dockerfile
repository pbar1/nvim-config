FROM archlinux:base-devel

RUN pacman --sync --noconfirm --noprogressbar --refresh --sysupgrade
RUN pacman --sync --noconfirm --noprogressbar \
      neovim

RUN useradd --create-home --uid 1000 user
USER user
