(use-package cc-mode
  :ensure t
  :bind (:map c-mode-base-map
              ("C-c c" . compile))
  :config
  (add-hook 'c-mode-hook #'(lambda () (lsp)))
  (add-hook 'c++-mode-hook #'(lambda () (lsp)))
  (add-hook 'c-mode-common-hook #'(lambda () (lsp)))
  (use-package google-c-style
    :ensure nil
    :disabled
    :config
    (add-hook 'c-mode-common-hook 'google-set-c-style)
    (add-hook 'c-mode-common-hook 'google-make-newline-indent))
  (use-package modern-cpp-font-lock
    :ensure t
    :disabled
    :diminish
    :init (modern-c++-font-lock-mode t))
  (use-package c-eldoc
    :ensure t
    :config
    (c-turn-on-eldoc-mode)))

(provide 'init-c)
