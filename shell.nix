{ pkgs ? import <nixpkgs> { } }:

with pkgs; mkShell {
  buildInputs = [
    neovim-unwrapped
    go-task
  ];
}
