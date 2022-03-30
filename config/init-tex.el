;; -*- lexical-binding: t; -*-

(use-package tex
  :ensure auctex
  :mode ("\\.tex\\'" . LaTeX-mode)
  :hook (LaTeX-mode . (lambda()
                        (setq TeX-command-default "pdflatex")))
  :config
  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
  (add-to-list 'TeX-view-program-list '("eaf" eaf-pdf-synctex-forward-view))
  (add-to-list 'TeX-view-program-selection '(output-pdf "eaf")))

(provide 'init-tex)
