;; -*- lexical-binding: t; -*-
(use-package protobuf-mode
  :defer t
  :load-path emacs-extension-dir
  :mode "\\.proto$"
  :config
  (defconst my-protobuf-style
    '((c-basic-offset . 2)
      (indent-tabs-mode . nil)))

  (add-hook 'protobuf-mode-hook
            (lambda () (c-add-style "my-style" my-protobuf-style t))))

(provide 'init-rpc)
