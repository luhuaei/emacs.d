(use-package awesome-tray
  :ensure nil
  :config
  (awesome-tray-mode 1)
  (setq awesome-tray-active-modules
	'("last-command"  "location" "buffer-name" "mode-name"  "git" "date")))

(provide 'init-awesome-tray)
