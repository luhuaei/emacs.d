;; -*- lexical-binding: t; -*-

(use-package dash
  :ensure nil
  :quelpa (dash :fetcher github :repo "magnars/dash.el"))

(use-package transient
  :ensure nil
  :load-path emacs-extension-dir)

(use-package with-editor
  :ensure nil
  :quelpa (with-editor :fetcher github :repo "magit/with-editor"))

(use-package magit
  :ensure nil
  :load-path emacs-extension-dir
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  (setq magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1)

  (add-hook 'magit-mode-hook #'magit-auto-revert-mode))

(use-package git-gutter
  :ensure nil
  :quelpa (git-gutter :fetcher github :repo "emacsorphanage/git-gutter")
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode 't))


(provide 'init-magit)
