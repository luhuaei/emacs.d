(use-package lispy
  :ensure t
  :hook (lispy-mode . lisp-mode)
  :config

  (use-package slime
    :ensure t
    :config
    (setq inferior-lisp-program "/bin/sbcl")
    (setq slime-contribs '(slime-fancy))))
(provide 'init-lispy)
