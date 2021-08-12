;; -*- lexical-binding: t; -*-
(use-package slime
  :defer t
  :quelpa (slime :fetcher github :repo "slime/slime")
  :load-path "~/.emacs.d/quelpa/build/slime"
  :config
  (setq inferior-lisp-program "/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

(provide 'init-lisp)
