(use-package flycheck
  :diminish flycheck-mode
  :hook (prog-mode . global-flycheck-mode)
  :init (add-hook 'prog-mode-hook #'(lambda () (flymake-mode 0)))
  :config
  (setq flycheck-indication-mode 'right-fringe)
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (setq-default flycheck-disabled-checkers '(emacs-lisp emacs-lisp-checkdoc))

  ;; Only check while saving and opening files
  (setq flycheck-idle-change-delay 10)
  (setq flycheck-check-syntax-automatically '(idle-buffer-switch))

  (use-package flycheck-posframe
    :hook (flycheck-mode . flycheck-posframe-mode)
    :config (add-to-list 'flycheck-posframe-inhibit-functions
                         #'(lambda () (bound-and-true-p company-backend)))))
(provide 'init-flycheck)
