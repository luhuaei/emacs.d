
(use-package auto-save
  :ensure nil
  :quelpa (auto-save :fetcher github :repo "manateelazycat/auto-save")
  :config
  (auto-save-enable)
  (setq auto-save-silent t)
  (setq auto-save-delete-trailing-whitespace t))
(provide 'init-auto-save)
