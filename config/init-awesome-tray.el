(use-package awesome-tray
  :ensure nil
  :load-path "~/.emacs.d/quelpa/build/awesome-tray"
  :config
  (setq awesome-tray-active-modules '("location" "date"))
  (awesome-tray-enable)
  )

(provide 'init-awesome-tray)
