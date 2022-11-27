(add-to-list 'load-path "/home/redeveder/lnks/lzc-runtime/contrib/lzc-manifest")
(require 'lzc-manifest)
(add-hook 'yaml-mode-hook 'lzc-manifest-setup-hook)
(add-hook 'yaml-mode-hook 'company-mode)

(use-package blink-search
  :load-path emacs-extension-dir
  :diminish blink-search-mode
  :config
  (setq blink-search-enable-log nil)
  (setq blink-search-enable-debug nil))

(global-set-key (kbd "s-x") 'blink-search)

(provide 'init-test)
