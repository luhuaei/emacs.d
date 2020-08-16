;; -*- lexical-binding: t; -*-
(use-package go-mode
  :config
  (setq gofmt-command "goimports")
  (setq gofmt-args nil)
  (add-hook 'flycheck-handle-save 'gofmt-before-save)
  :bind (("C-c M-f" . 'gofmt)))

(use-package go-eldoc
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(provide 'init-go)
