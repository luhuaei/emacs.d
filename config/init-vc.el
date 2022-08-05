;; -*- lexical-binding: t; -*-

(use-package magit
  :after (init)
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  (setq magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1)
  (add-hook 'magit-mode-hook #'magit-auto-revert-mode))


(use-package git-gutter
  :after (magit)
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode 't))


(provide 'init-vc)
