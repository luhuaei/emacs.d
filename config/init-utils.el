(use-package highlight-parentheses
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'highlight-parentheses-mode))
(provide 'init-utils)
