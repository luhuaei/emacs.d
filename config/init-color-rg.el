(use-package color-rg
  :ensure nil
  :config
  (define-key isearch-mode-map (kbd "M-s M-s") 'isearch-toggle-color-rg))

(provide 'init-color-rg)
