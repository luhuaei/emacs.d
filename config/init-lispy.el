(use-package lispy
  :ensure t
  :defer 5
  :hook (lispy-mode . lisp-mode))
(use-package slime
  :ensure t
  :defer 5
  :config
  (setq inferior-lisp-program "/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))
(provide 'init-lispy)
