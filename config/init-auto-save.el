
(use-package auto-save
  :ensure nil
  :config
  (auto-save-enable)
  (setq auto-save-silent t)
  (setq auto-save-delete-trailing-whitespace t))
(provide 'init-auto-save)