;; -*- lexical-binding: t; -*-
(use-package go-mode
  :ensure nil
  :quelpa (go-mode :fetcher github :repo "dominikh/go-mode.el")
  :config
  (setq gofmt-command "goimports")
  (setq gofmt-args nil)
  (add-hook 'flycheck-handle-save 'gofmt-before-save)
  :bind (:map go-mode-map
              ("C-c M-f" . 'gofmt)))

(provide 'init-go)
