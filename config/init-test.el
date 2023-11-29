(add-hook 'yaml-mode-hook 'lzc-manifest-setup-hook)
(add-hook 'yaml-mode-hook 'company-mode)

(use-package blink-search
  :load-path emacs-extension-dir
  :diminish blink-search-mode
  :config
  (setq blink-search-enable-log nil)
  (setq blink-search-enable-debug nil))

(use-package mind-wave
  :config
  (setq mind-wave-proxy-url "http://127.0.0.1:1080"))

(provide 'init-test)
