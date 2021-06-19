;; -*- lexical-binding: t; -*-

(use-package julia-mode
  :ensure nil
  :config
  (setq lsp-julia-package-dir nil)
  (setq lsp-julia-flags `("-J/home/redeveder/.julia/languageserver.so"))


  (use-package lsp-julia
    :ensure nil)

  (setq lsp-julia-default-environment "~/.julia/environments/v1.6"))

(provide 'init-julia)
