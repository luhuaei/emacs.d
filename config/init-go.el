(use-package go-mode
  :hook (go-mode . (lambda ()
                     (add-hook 'before-save-hook 'gofmt-before-save)))
  :bind (:map go-mode-map
              ("M-." . 'godef-jump))
  )

(provide 'init-go)
