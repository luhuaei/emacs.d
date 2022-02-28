{ pkgs ? import ~/repo/nixpkgs { } }:

with pkgs;

let
  latest-pymupdf = import ./pymupdf.nix { };

  eaf-python-package = python3.withPackages (ps: with ps; [
    epc
    pyqt5
    sip
    pyqtwebengine
    qrcode
    retrying
    pytaglib
    sip
    pip
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
    latest-pymupdf
    eaf-python-package

    nodejs-16_x
  ];
  QT_XCB_GL_INTEGRATION = "none";
}
