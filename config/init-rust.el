
(use-package rust-mode
  :ensure t
  :quelpa (rust-mode :fetcher github :repo "rust-lang/rust-mode")
  :bind (:map rust-mode-map
              ("C-c M-f" . 'rust-format-buffer)
              ("C-c M-m" . 'lsp-rust-analyzer-expand-macro)
              ("C-c M-r" . 'lsp-rust-analyzer-run))
  :hook (rust-mode . (lambda () (flycheck-select-checker 'rust))))

(provide 'init-rust)
