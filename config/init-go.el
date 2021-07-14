;; -*- lexical-binding: t; -*-
(use-package go-mode
  :ensure nil
  :quelpa (go-mode :fetcher github :repo "dominikh/go-mode.el")
  :config
  (setq gofmt-command "goimports")
  (setq gofmt-args nil)
  :bind (:map go-mode-map
              ("C-c M-f" . 'gofmt)))

(use-package flycheck-golangci-lint
  :ensure nil
  :hook (go-mode . flycheck-golangci-lint-setup)
  :config
  (setq flycheck-golangci-lint-disable-linters '("errcheck" "govet")))

(provide 'init-go)
