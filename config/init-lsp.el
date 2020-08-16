;; -*- lexical-binding: t; -*-

(use-package nox
  :ensure nil
  :load-path "~/repo/nox"
  :quelpa (nox :fetcher github :repo "manateelazycat/nox")
  :bind (:map nox-mode-map
              ("C-c C-d" . 'nox-show-doc))
  :config
  (setq nox-autoshutdown t)
  (dolist (hook (list
               'go-mode-hook
               ))
    (add-hook hook '(lambda () (nox-ensure)))))

(use-package eglot
  :disabled
  :config
  (setq eglot-stay-out-of '(flymake eldoc yasnippet hover))
  (setq eglot-autoshutdown t)
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
