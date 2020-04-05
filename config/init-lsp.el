;; -*- lexical-binding: t; -*-

(use-package nox
  :ensure nil
  :quelpa (nox :fetcher github :repo "manateelazycat/nox")
  :bind (:map nox-mode-map
              ("C-c C-d" . 'nox-show-doc))
  :config
  (dolist (hook (list
               'rust-mode-hook
               'python-mode-hook
               'ruby-mode-hook
               'java-mode-hook
               'sh-mode-hook
               'php-mode-hook
               'c-mode-common-hook
               'c-mode-hook
               'c++-mode-hook
               'haskell-mode-hook
               'go-mode-hook
               ))
    (add-hook hook '(lambda () (nox-ensure)))))

(provide 'init-lsp)
