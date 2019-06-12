
(use-package awesome-tray
  :ensure nil
  :config
  (awesome-tray-mode 1)
  (setq awesome-tray-active-modules
  '("last-command" "location" "buffer-name" "parent-dir" "mode-name")))

(provide 'init-awesome-tray)
