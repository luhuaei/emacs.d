;; -*- lexical-binding: t; -*-

(use-package nix-mode
  :defer t
  :quelpa (nix-mode :fetcher github :repo "NixOS/nix-mode")
  :bind (:map nix-mode-map
              ("C-c M-f" . 'nix-format-buffer))
  :mode "\\.nix\\'"
  :config
  (setq nix-nixfmt-bin "nixpkgs-fmt"))

(use-package direnv
  :disabled t
  :quelpa (direnv :fetcher github :repo "wbolster/emacs-direnv")
  :hook
  (before-hack-local-variables . direnv-update-environment)
  :config
  (setq direnv-always-show-summary nil)
  (direnv-mode))

;; some time when lsp jump to other repo, will don't find the right path
(use-package envrc
  :quelpa (envrc :fetcher github :repo "purcell/envrc")
  :hook (after-init . envrc-global-mode))

(provide 'init-nix)
