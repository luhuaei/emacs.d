(use-package color-rg
  :ensure nil
  :quelpa (color-rg :fetcher github :repo "manateelazycat/color-rg")
  :bind (("M-s M-s" . 'isearch-toggle-color-rg)
         ("M-s i" . 'color-rg-search-input)
         ("M-s p" . 'color-rg-search-project)))

(provide 'init-color-rg)
