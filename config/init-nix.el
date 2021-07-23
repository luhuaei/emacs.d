;; -*- lexical-binding: t; -*-

(use-package nix-mode
  :quelpa (nix-mode :fetcher github :repo "NixOS/nix-mode")
  :mode "\\.nix\\'")

(provide 'init-nix)
