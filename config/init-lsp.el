(use-package eglot
  :config
  (add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))
  (setq eglot-put-doc-in-help-buffer nil)
  (setq eldoc-message-function '(lambda (mes &rest args))) ;remove minibuffer help message
  (setq eglot-auto-display-help-buffer nil))
(provide 'init-lsp)
