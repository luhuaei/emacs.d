;; -*- lexical-binding: t; -*-

(use-package lsp-mode
  :ensure t
  :config
  (setq lsp-enable-completion-at-point t)
  (setq lsp-enable-xref t)
  (setq lsp-diagnostics-provider :none)
  (setq lsp-eldoc-enable-hover nil)
  (setq lsp-eldoc-render-all nil)
  (setq lsp-keep-workspace-alive t)
  (dolist (hook (list
                 'rust-mode-hook
                 'java-mode-hook
                 'php-mode-hook
                 'c-mode-common-hook
                 'c-mode-hook
                 'c++-mode-hook
                 'haskell-mode-hook
                 'go-mode-hook
                 'typescript-mode-hook
                 ))
    (add-hook hook '(lambda () (lsp)))))


(provide 'init-lsp)
