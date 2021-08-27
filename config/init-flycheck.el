;; -*- lexical-binding: t; -*-
(use-package flymake
  :diminish flymake-mode
  :disabled t)

(use-package flycheck
  :defer t
  :quelpa (flycheck :fetcher github :repo "flycheck/flycheck")
  :diminish flycheck-mode
  :hook (prog-mode . global-flycheck-mode)
  :init (add-hook 'prog-mode-hook #'(lambda () (flymake-mode -1)))
  :config
  (setq flycheck-indication-mode 'left-fringe)
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (setq-default flycheck-disabled-checkers
                '(emacs-lisp
                  emacs-lisp-checkdoc
                  javascript-eslint
                  javascript-jshint))

  ;; Only check while saving and opening files
  (setq flycheck-idle-change-delay 10))

(provide 'init-flycheck)
