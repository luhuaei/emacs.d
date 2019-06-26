(use-package lispy
  :ensure nil
  :defer 5
  :hook ((emacs-lisp-mode . lispy-mode)
	 (lisp-mode . lispy-mode)
	 (lisp-interaction-mode . lispy-mode)))
(use-package slime
  :ensure t
  :defer 5
  :config
  (setq inferior-lisp-program "/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))
(provide 'init-lispy)
