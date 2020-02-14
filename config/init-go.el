(use-package go-mode
  :bind (:map go-mode-map
              ("M-." . 'godef-jump)
              )
  :config
  (setq gofmt-command "goimports"))

(provide 'init-go)
