;; -*- lexical-binding: t; -*-
(use-package cc-mode
  :config
  (setq c-default-style '((other . "linux"))))

(use-package c-eldoc
  :ensure nil
  :quelpa (c-eldoc :fetcher github :repo "nflath/c-eldoc")
  :config
  (c-turn-on-eldoc-mode))

(provide 'init-c)
