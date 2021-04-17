;; -*- lexical-binding: t; -*-
(use-package deferred
  :ensure nil
  :quelpa (deferred :fetcher github :repo "kiwanami/emacs-deferred"))

(use-package ctable
  :ensure nil
  :quelpa (ctable :fetcher github :repo "kiwanami/emacs-ctable"))

(use-package epc
  :ensure t
  :quelpa (epc :fetcher github :repo "kiwanami/emacs-epc"))

(use-package eaf
  :ensure nil
  :load-path emacs-extension-dir
  :diminish eaf-mode
  :bind (:map eaf-interleave-mode-map
         ("M-." . 'eaf-interleave-sync-current-note)
         ("M-p" . 'eaf-interleave-sync-previous-note)
         ("M-n" . 'eaf-interleave-sync-next-note)
         ("C-c M-a" . 'eaf-interleave-add-file-url)
         :map eaf-interleave-app-mode-map
         ("C-c M-i" . 'eaf-interleave-add-note)
         ("C-c M-o" . 'eaf-interleave-open-notes-file)
         ("C-c M-q" . 'eaf-interleave-quit)
         :map dired-mode-map
         ("RET" . 'eaf-open-this-from-dired))
  :config
  ;; eaf-interleave
  (add-hook 'eaf-pdf-viewer-hook 'eaf-interleave-app-mode)
  (add-hook 'eaf-browser-hook 'eaf-interleave-app-mode)
  (add-hook 'org-mode-hook 'eaf-interleave-mode)
  (setq eaf-interleave-org-notes-dir-list '("~/org/interleave/"))
  (setq eaf-interleave-split-direction 'vertical)
  (setq eaf-interleave-disable-narrowing t)
  (setq eaf-interleave-split-lines 30)
  (eaf-setq eaf-pdf-dark-mode "ignore")

  ;;
  (setq eaf-enable-debug nil)

  ;; chore setting
  (setq eaf-find-alternate-file-in-dired nil)
  (setq eaf-proxy-host "127.0.0.1")
  (setq eaf-proxy-port "10808")
  (setq eaf-proxy-type "socks5")
  ;; (eaf-setq eaf-browser-dark-mode "true")
  (eaf-setq eaf-mindmap-save-path "~/org/mindmap"))

(provide 'init-eaf)
