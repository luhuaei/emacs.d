;; -*- lexical-binding: t; -*-
(use-package deferred
  :ensure nil
  :quelpa (deferred :fetcher github :repo "kiwanami/emacs-deferred"))

(use-package ctable
  :ensure nil
  :quelpa (ctable :fetcher github :repo "kiwanami/emacs-ctable"))

(use-package epc
  :ensure nil
  :quelpa (epc :fetcher github :repo "kiwanami/emacs-epc"))

(use-package eaf
  :ensure nil
  :load-path emacs-extension-dir
  :diminish eaf-mode
  :config
  ;; chore setting
  (setq eaf-find-alternate-file-in-dired nil)
  (setq eaf-proxy-host "127.0.0.1")
  (setq eaf-proxy-port "10808")
  (setq eaf-proxy-type "socks5")
  )

(provide 'init-eaf)
