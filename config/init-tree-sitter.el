
;; (use-package tree-sitter
;;   :ensure t
;;   :hook ((rust-mode python-mode json-mode js-mode js2-mode typescript-mode go-mode sh-mode) . tree-sitter-mode)
;;   :after (init)
;;   :init (use-package tree-sitter-langs :ensure t)
;;   :config
;;   (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
;;   )
(provide 'init-tree-sitter)
