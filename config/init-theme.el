(use-package lazycat-theme
  :disabled t
  :ensure nil)

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-vibrant t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(set-frame-font "Monaco-13")
(set-face-attribute 'default nil :height 130)
(provide 'init-theme)
