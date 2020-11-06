;; -*- lexical-binding: t; -*-
(use-package eglot
  :diminish eglot
  :config
  (setq eglot-stay-out-of '(flymake eldoc yasnippet hover))
  (setq eglot-autoshutdown t)

  (let ((programs (list)))
    (dolist (option eglot-server-programs)
      (if (eq (car option) 'rust-mode)
          (push '(rust-mode . (eglot-rls "rust-analyzer")) programs)
        (push option programs)))
    (setq eglot-server-programs programs))

  (dolist (hook (list
                 'rust-mode-hook
                 'java-mode-hook
                 'php-mode-hook
                 'c-mode-common-hook
                 'c-mode-hook
                 'c++-mode-hook
                 'haskell-mode-hook
                 'go-mode-hook
                 'typescript-mode-hook
                 ))
    (add-hook hook '(lambda () (eglot-ensure)))))

(provide 'init-lsp)
