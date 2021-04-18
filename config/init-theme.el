;; -*- lexical-binding: t; -*-

(use-package monokai-theme
  :ensure nil
  :quelpa (monokai-theme :fetcher github :repo "oneKelvinSmith/monokai-emacs")
  :config
  (load-theme 'monokai t))

(provide 'init-theme)
