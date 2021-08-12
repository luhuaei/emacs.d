;; -*- lexical-binding: t; -*-

(use-package monokai-theme
  :quelpa (monokai-theme :fetcher github :repo "oneKelvinSmith/monokai-emacs")
  :config
  (load-theme 'monokai t))

(provide 'init-theme)
