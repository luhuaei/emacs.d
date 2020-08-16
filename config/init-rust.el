
(use-package rust-mode
  :ensure nil
  :quelpa (rust-mode :fetcher github :repo "rust-lang/rust-mode")
  :bind (("C-c M-f" . 'rust-format-buffer))
  :hook (rust-mode . (lambda () (flycheck-select-checker 'rust))))

(provide 'init-rust)
