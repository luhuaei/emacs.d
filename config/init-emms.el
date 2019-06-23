(use-package emms
  :ensure nil
  :config
  (use-package emms-setup
    :ensure nil
    :config
    (emms-standard)
    (emms-default-players))
  (setq emms-player-list '(emms-player-vlc)))
(provide 'init-emms)
