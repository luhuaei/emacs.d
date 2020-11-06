(use-package protobuf-mode
  :ensure nil
  :load-path "/home/luhuaei/emacs.d/extensions/protobuf-mode.el"
  :mode "\\.proto$"
  :config
  (defconst my-protobuf-style
    '((c-basic-offset . 2)
      (indent-tabs-mode . nil)))

  (add-hook 'protobuf-mode-hook
            (lambda () (c-add-style "my-style" my-protobuf-style t))))

(provide 'init-rpc)
