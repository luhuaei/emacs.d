;; -*- lexical-binding: t; -*-
(use-package cc-mode
  :defer t
  :config
  (setq c-default-style '((other . "linux"))))

(use-package c-eldoc
  :defer t
  :ensure nil
  :quelpa (c-eldoc :fetcher github :repo "nflath/c-eldoc")
  :config
  (c-turn-on-eldoc-mode))

(provide 'init-c)
