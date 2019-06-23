(use-package company
  :ensure t
  :hook ((emacs-lisp-mode . company-mode)
	 (ess-r-mode . company-mode)))
(provide 'init-company)
