(use-package lispy
  :ensure nil
  :defer 5)
(use-package slime
  :ensure t
  :defer 5
  :config
  (setq inferior-lisp-program "/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))
(provide 'init-lispy)
