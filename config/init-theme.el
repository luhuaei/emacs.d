;; -*- lexical-binding: t; -*-

(use-package monokai-theme
  :disabled t
  :quelpa (monokai-theme :fetcher github :repo "oneKelvinSmith/monokai-emacs")
  :config
  (load-theme 'monokai t))

(use-package dracula-theme
  :quelpa (dracula-theme :fetcher github :repo "dracula/emacs")
  :config
  (load-theme 'dracula t)
  (setq dracula-alternate-mode-line-and-minibuffer t))

(provide 'init-theme)
