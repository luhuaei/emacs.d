(use-package yasnippet
  :ensure t
  :defer t
  :config
  (add-hook 'prog-mode-hook #'yas-minor-mode))
(provide 'init-yasnippet)
