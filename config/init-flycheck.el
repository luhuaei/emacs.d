;; -*- lexical-binding: t; -*-
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
                  rust-cargo
                  emacs-lisp-checkdoc
                  javascript-eslint
                  javascript-jshint))

  ;; Only check while saving and opening files
  (setq flycheck-idle-change-delay 10)
  (setq flycheck-check-syntax-automatically '(idle-change)))

(use-package flymake
  :config
  (setq flymake-no-changes-timeout 10
        flymake-gui-warnings-enabled nil
        flymake-start-on-save-buffer nil
        flymake-start-on-flymake-mode t))

(provide 'init-flycheck)
