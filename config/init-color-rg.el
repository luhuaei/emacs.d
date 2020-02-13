(use-package color-rg
  :ensure nil
  :quelpa (color-rg :fetcher github :repo "manateelazycat/color-rg")
  :config
  (define-key isearch-mode-map (kbd "M-s M-s") 'isearch-toggle-color-rg)
  (global-set-key (kbd "M-s i") 'color-rg-search-input)
  (global-set-key (kbd "M-s p") 'color-rg-search-project))

(provide 'init-color-rg)
