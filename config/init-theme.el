(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-solarized-dark t)
  ;; (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config))

(use-package cnfonts :ensure t :defer t :disabled)
(use-package awesome-tab
  :ensure nil
  :bind (:map awesome-tab-mode-map
	      ("C-c C-n" . 'awesome-tab-forward-tab)
	      ("C-c M-n" . 'awesome-tab-forward-group)
	      ("C-c C-p" . 'awesome-tab-backward-tab)
	      ("C-c M-p" . 'awesome-tab-backward-group)
	      ("C-c M-k" . 'awesome-tab-kill-other-buffers-in-current-group))
  :config
  (awesome-tab-mode t)
  (setq awesome-tab-style 'alternate))
(provide 'init-theme)
