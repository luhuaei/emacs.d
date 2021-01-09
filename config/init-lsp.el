;; -*- lexical-binding: t; -*-

(use-package lsp-mode
  :ensure t
  :bind (:map lsp-mode-map
              ("C->" . 'lsp-find-implementation))
  :config
  (setq lsp-enable-completion-at-point t)
  (setq lsp-enable-xref t)
  (setq lsp-diagnostics-provider :none)
  (setq lsp-eldoc-enable-hover nil)
  (setq lsp-enable-snippet nil)
  (setq lsp-eldoc-render-all nil)
  (setq lsp-keep-workspace-alive t)
  (setq lsp-headerline-breadcrumb-enable nil)

  ;; rust
  (setq lsp-rust-server 'rust-analyzer)

  (dolist (hook (list
                 'rust-mode-hook
                 'c-mode-common-hook
                 'c-mode-hook
                 'c++-mode-hook
                 'go-mode-hook
                 'typescript-mode-hook
                 ))
    (add-hook hook '(lambda () (lsp)))))


(provide 'init-lsp)
