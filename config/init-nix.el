;; -*- lexical-binding: t; -*-

(use-package nix-mode
  :quelpa (nix-mode :fetcher github :repo "NixOS/nix-mode")
  :bind (:map nix-mode-map
              ("C-c M-f" . 'nixpkgs-fmt-buffer))
  :mode "\\.nix\\'")

(use-package direnv
  :quelpa (direnv :fetcher github :repo "wbolster/emacs-direnv")
  :hook
  (before-hack-local-variables . direnv-update-environment)
  :config
  (setq direnv-always-show-summary nil)
  (direnv-mode))

;; some time when lsp jump to other repo, will don't find the right path
(use-package envrc
  :disabled t
  :quelpa (envrc :fetcher github :repo "purcell/envrc")
  :config
  (envrc-global-mode))

(use-package nixpkgs-fmt
  :quelpa (nixpkgs-fmt :fetcher github :repo "purcell/emacs-nixpkgs-fmt"))

(provide 'init-nix)
