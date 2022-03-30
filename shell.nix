{ pkgs ? import <nixpkgs> { } }:

with pkgs;

let
  tex = pkgs.texlive.combined.scheme-full;
in

mkShell {
  nativeBuildInputs = [
  ];
  buildInputs = [
    nodejs-16_x
    tex
  ];
}
