(use-package company
  :ensure t
  :hook ((emacs-lisp-mode . company-mode)
	 (ess-r-mode . company-mode)
	 (python-mode . company-mode))
  :config
  (setq company-idle-delay 1)
  (setq company-candidates-length 3))
(provide 'init-company)
