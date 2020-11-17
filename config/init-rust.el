
(use-package rust-mode
  :ensure t
  :quelpa (rust-mode :fetcher github :repo "rust-lang/rust-mode")
  :bind (:map rust-mode-map
              ("C-c M-f" . 'rust-format-buffer))
  :hook (rust-mode . (lambda () (flycheck-select-checker 'rust))))

(provide 'init-rust)
