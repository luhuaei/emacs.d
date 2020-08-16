;; -*- lexical-binding: t; -*-

(use-package eaf
  :ensure nil
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
         :map eaf-mode-map
         ("C-c C-f" . 'eaf-open)
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

  ;;
  (setq eaf-enable-debug t)

  ;; chore setting
  (setq eaf-find-alternate-file-in-dired nil)
  (setq eaf-proxy-host "127.0.0.1")
  (setq eaf-proxy-port "1080")
  (setq eaf-proxy-type "http")
  ;; (eaf-setq eaf-browser-dark-mode "true")
  (eaf-setq eaf-mindmap-save-path "~/org/mindmap")

  (defun eaf-open-google ()
    "Open Google using EAF."
    (interactive)
    (eaf-open-browser "https://www.google.com")))

(provide 'init-eaf)
