;; -*- lexical-binding: t; -*-
(use-package deferred :defer t)

(use-package ctable :defer t)

(use-package epc :defer t)

(use-package eaf
  :after (init)
  :load-path emacs-extension-dir
  :diminish eaf-mode
  :config
  ;; chore setting
  (setq eaf-pdf-notify-file-changed nil)
  (setq eaf-pdf-dark-mode "follow")
  (setq eaf-proxy-host "127.0.0.1")
  (setq eaf-proxy-port "1080")
  (setq eaf-proxy-type "http")
  (require 'eaf-pdf-viewer)
  (require 'eaf-browser)
  (require 'eaf-demo))

(provide 'init-eaf)
