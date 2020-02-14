(use-package eglot
  :bind (:map eglot-mode-map
              ("C-c h" . 'eglot-help-at-point))
  :config
  (add-hook 'go-mode-hook #'eglot-ensure)
  (setq eglot-put-doc-in-help-buffer t)
  (setq eglot-auto-display-help-buffer nil))
(provide 'init-lsp)
