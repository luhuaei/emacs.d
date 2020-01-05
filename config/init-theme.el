(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-gruvbox t)
  ;; (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config))

(use-package cnfonts :ensure t :defer t :disabled)

(provide 'init-theme)
