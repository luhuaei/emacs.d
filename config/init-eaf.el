;; -*- lexical-binding: t; -*-
(use-package deferred
  :defer t
  :quelpa (deferred :fetcher github :repo "kiwanami/emacs-deferred"))

(use-package ctable
  :defer t
  :quelpa (ctable :fetcher github :repo "kiwanami/emacs-ctable"))

(use-package epc
  :defer t
  :quelpa (epc :fetcher github :repo "kiwanami/emacs-epc"))

(use-package eaf
  :after (init)
  :load-path emacs-extension-dir
  :diminish eaf-mode
  :config
  ;; chore setting
  (setq eaf-find-alternate-file-in-dired nil)
  (setq eaf-pdf-notify-file-changed nil)
  (setq eaf-pdf-dark-mode "follow")
  (setq eaf-proxy-host "127.0.0.1")
  (setq eaf-proxy-port "10808")
  (setq eaf-proxy-type "socks5")

  (require 'eaf-pdf-viewer)

  (require 'eaf-browser)

  (require 'eaf-demo))

(provide 'init-eaf)
