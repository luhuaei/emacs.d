(use-package cc-mode
  :bind (:map c-mode-base-map
              ("C-c c" . compile))
  :config
  (add-hook 'c-mode-hook #'(lambda () (lsp)))
  (add-hook 'c++-mode-hook #'(lambda () (lsp)))
  (add-hook 'c-mode-common-hook #'(lambda () (lsp)))
  (use-package c-eldoc
    :config
    (c-turn-on-eldoc-mode)))

(provide 'init-c)
