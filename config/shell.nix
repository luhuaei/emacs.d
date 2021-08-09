{ pkgs ? import ~/repo/nixpkgs { } }:

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

    # lector
    lxml
    beautifulsoup4
    xmltodict
    djvulibre
    markdown
  ]);
in

mkShell {
  nativeBuildInputs = [
    qt5.wrapQtAppsHook
    rustc
    cargo
    go
  ];
  buildInputs = [
    qt5.full
    qtcreator

    freetype
    mupdf

    eaf-python-package

    wmctrl

    gdb

    nodejs

    xorg.libxcb

    # keep this line if you use bash
    bashInteractive

    # rust lsp
    rust-analyzer
    rustfmt
    clippy

    #go lsp
    golangci-lint
    gotools
    gopls
  ];
}
