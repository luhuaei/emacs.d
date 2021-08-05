;; -*- lexical-binding: t; -*-

(use-package nix-mode
  :quelpa (nix-mode :fetcher github :repo "NixOS/nix-mode")
  :bind (:map nix-mode-map
              ("C-c M-f" . 'nixpkgs-fmt-buffer))
  :mode "\\.nix\\'")

(use-package envrc
  :quelpa (envrc :fetcher github :repo "purcell/envrc")
  :config
  (envrc-global-mode))

(use-package nixpkgs-fmt
  :quelpa (nixpkgs-fmt :fetcher github :repo "purcell/emacs-nixpkgs-fmt"))

(provide 'init-nix)
