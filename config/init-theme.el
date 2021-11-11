;; -*- lexical-binding: t; -*-

(use-package monokai-theme
  :quelpa (monokai-theme :fetcher github :repo "oneKelvinSmith/monokai-emacs")
  :config
  (load-theme 'monokai t))

(use-package dracula-theme
  :disabled t
  :quelpa (dracula-theme :fetcher github :repo "dracula/emacs")
  :config
  (load-theme 'dracula t)
  (setq dracula-alternate-mode-line-and-minibuffer t))

(use-package solarized
  :disabled t
  :quelpa (solarized :fetcher github :repo "bbatsov/solarized-emacs")
  :config
  (load-theme 'solarized-dark-high-contrast t)
  (setq solarized-use-more-italic t)
  (setq x-underline-at-descent-line t))

(provide 'init-theme)
