(add-to-list 'load-path "/home/redeveder/lnks/lzc-runtime/contrib/lzc-manifest")
(require 'lzc-manifest)
(add-hook 'yaml-mode-hook 'lzc-manifest-setup-hook)
(add-hook 'yaml-mode-hook 'company-mode)

(provide 'init-test)
