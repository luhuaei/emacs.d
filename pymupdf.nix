{ pkgs ? import <nixpkgs> { } }:

pkgs.python3Packages.buildPythonPackage rec {
  pname = "pymupdf";
  version = "latest";

  src = ./libs/py-mupdf;

  postPatch = ''
    substituteInPlace setup.py \
        --replace '/usr/include/mupdf' ${pkgs.mupdf.dev}/include/mupdf
  '';
  nativeBuildInputs = with pkgs; [ swig ];
  buildInputs = with pkgs; [ mupdf freetype harfbuzz openjpeg jbig2dec libjpeg_turbo gumbo ];

  doCheck = false;

  pythonImportsCheck = [ "fitz" ];
}
