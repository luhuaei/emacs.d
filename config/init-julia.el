;; -*- lexical-binding: t; -*-

(use-package julia-mode
  :defer t
  :quelpa (julia-emacs :fetcher github :repo "JuliaEditorSupport/julia-emacs")
  :config
  (setq lsp-julia-package-dir nil)
  (setq lsp-julia-flags `("-J/home/redeveder/.julia/languageserver.so"))


  (use-package lsp-julia
    :after (julia)
    :quelpa (lsp-julia :fetcher github :repo "non-Jedi/lsp-julia")
    :ensure nil)

  (setq lsp-julia-default-environment "~/.julia/environments/v1.6"))

(provide 'init-julia)
