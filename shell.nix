{ pkgs ? import <nixpkgs> { } }:

mkShell {
  buildInputs = with pkgs; [
    neovim-nightly
  ];

  /* shellHook = '' */
  /*   # ... */
  /* ''; */
}
