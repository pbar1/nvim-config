FROM archlinux:base-devel

RUN pacman --sync --noconfirm --noprogressbar --refresh --sysupgrade
RUN pacman --sync --noconfirm --noprogressbar \
      neovim git

RUN useradd --create-home --uid 1000 user
USER user

ENTRYPOINT ["/usr/sbin/nvim"]
