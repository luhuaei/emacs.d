;; -*- lexical-binding: t; -*-

(use-package kotlin-mode
  :quelpa (kotlin-mode :fetcher github :repo "Emacs-Kotlin-Mode-Maintainers/kotlin-mode")
  :mode ("\\.\\(kt\\)$" . kotlin-mode))

(provide 'init-kotlin)
