(use-package magit
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-x M-g") 'magit-dispatch)
  (setq magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1))
(provide 'init-magit)
