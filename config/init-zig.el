(use-package zig-mode
  :quelpa (zig-mode :fetcher github :repo "ziglang/zig-mode")
  :mode "\\.zig$"
  :bind (:map zig-mode-map
         ("C-c M-f" . 'zig-format-buffer))
  :config
  (setq zig-format-on-save nil))

(provide 'init-zig)
