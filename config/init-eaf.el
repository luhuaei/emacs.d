(use-package eaf
  :ensure nil
  :custom
  (eaf-find-alternate-file-in-dired t)
  :diminish eaf-mode
  :config
  (setq eaf-proxy-host "127.0.0.1")
  (setq eaf-proxy-port "1080")
  (setq eaf-proxy-type "http")
  (eaf-setq eaf-browser-dark-mode "true")
  (eaf-setq eaf-mindmap-save-path "~/org/mindmap")

  (defun eaf-open-google ()
    "Open Google using EAF."
    (interactive)
    (eaf-open-browser "https://www.google.com")))


(provide 'init-eaf)
