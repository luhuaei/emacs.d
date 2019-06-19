(use-package company
  :ensure t
  :hook ((python-mode . company-mode)
	 (emacs-lisp-mode . company-mode)
	 (ess-r-mode . company-mode)))
(provide 'init-company)
