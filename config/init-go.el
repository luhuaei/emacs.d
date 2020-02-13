(use-package go-mode
  :ensure t
  :hook (go-mode . (lambda ()
                     (add-hook 'before-save-hook 'gofmt-before-save)))
  :bind (:map go-mode-map
              ("M-." . 'godef-jump))
  )

(provide 'init-go)
