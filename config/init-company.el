(use-package company
  :ensure t
  :defer t
  :config
  (add-hook 'prog-mode-hook #'global-company-mode))
(provide 'init-company)
