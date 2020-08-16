(use-package yasnippet
  :disabled
  :diminish yas-minor-mode
  :config
  (add-hook 'after-init-hook #'yas-global-mode))
(provide 'init-yasnippet)
