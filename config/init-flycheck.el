;; -*- lexical-binding: t; -*-
(use-package flymake
  :ensure nil
  :diminish flymake-mode
  :disabled t)

(use-package flycheck
  :ensure nil
  :quelpa (flycheck :fetcher github :repo "flycheck/flycheck")
  :diminish flycheck-mode
  :hook (prog-mode . global-flycheck-mode)
  :init (add-hook 'prog-mode-hook #'(lambda () (flymake-mode -1)))
  :config
  (setq flycheck-indication-mode 'right-fringe)
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (setq-default flycheck-disabled-checkers '(emacs-lisp emacs-lisp-checkdoc javascript-eslint javascript-jshint))

  ;; Only check while saving and opening files
  (setq flycheck-idle-change-delay 10)
  (setq flycheck-check-syntax-automatically '(idle-buffer-switch)))

(provide 'init-flycheck)
