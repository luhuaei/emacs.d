(use-package eaf
  :custom
  (eaf-find-alternate-file-in-dired t)
  :config
  (defun eaf-open-google ()
    "Open Google using EAF."
    (interactive)
    (eaf-open-browser "https://www.google.com")))
(provide 'init-eaf)
