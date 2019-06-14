(use-package avy
  :ensure t
  :bind (("C-:" . 'avy-goto-char)
	 ("C-'" . 'avy-goto-char-2)
	 ("M-g f" . 'avy-goto-line)
	 ("C-c C-j" . 'avy-resume)))
(provide 'init-avy)
