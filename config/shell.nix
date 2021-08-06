{ pkgs ? import <nixpkgs> { } }:

with pkgs;

let
  eaf-python-package = python3.withPackages (ps: with ps; [
    epc
    pyqt5
    sip
    pyqtwebengine
    pymupdf
    qrcode
    retrying
    pytaglib
    sip
  ]);
in

mkShell {
  nativeBuildInputs = [
    qt5.wrapQtAppsHook
  ];
  buildInputs = [
    qt5.full
    qtcreator

    eaf-python-package

    wmctrl

    gdb

    nodejs

    xorg.libxcb

    # keep this line if you use bash
    bashInteractive
  ];
}
