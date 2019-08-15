(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (projectile-mode +1))
(provide 'init-projectile)
