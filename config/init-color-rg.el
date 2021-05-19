;; -*- lexical-binding: t; -*-

(use-package color-rg
  :ensure nil
  :bind (("M-s M-s" . 'isearch-toggle-color-rg)
         ("M-s i" . 'color-rg-search-input)
         ("M-s M-i" . 'color-rg-search-input-in-current-file)
         ("M-s p" . 'color-rg-search-project)))

(provide 'init-color-rg)
