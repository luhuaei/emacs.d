;; -*- lexical-binding: t; -*-

(use-package monokai-theme
  :disabled t
  :quelpa (monokai-theme :fetcher github :repo "oneKelvinSmith/monokai-emacs")
  :config
  (load-theme 'monokai t))

(use-package ample-theme
  :quelpa (ample-theme :fetcher github :repo "jordonbiondo/ample-theme")
  :config
  (load-theme 'ample t))

(provide 'init-theme)
