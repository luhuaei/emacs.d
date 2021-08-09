;; -*- lexical-binding: t; -*-

(use-package rustic
  :ensure nil
  :quelpa (rustic :fetcher github :repo "brotzeit/rustic")
  :bind (:map rustic-mode-map
              ("C-c M-f" . 'rustic-format-buffer)
              ("C-c M-m" . 'lsp-rust-analyzer-expand-macro)
              ("C-c M-r" . 'lsp-rust-analyzer-run))
  :config
  (push 'rustic-clippy flycheck-checkers)
  (setq rustic-flycheck-clippy-params "--message-format=json"))

(provide 'init-rust)
