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
  ]);
in

mkShell {
  nativeBuildInputs = [
    qt5.wrapQtAppsHook
  ];
  buildInputs = [
    qt5.full
    qt5.qtwebengine

    python3

    freetype
    mupdf

    eaf-python-package

    xorg.libxcb

    pkg-config

    # keep this line if you use bash
    bashInteractive

    nodejs-16_x
  ];
  QT_XCB_GL_INTEGRATION = "none";
}
