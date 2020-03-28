;; -*- lexical-binding: t; -*-
(use-package go-mode
  :config
  (setq gofmt-command "goimports"))

(use-package go-eldoc
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(provide 'init-go)
