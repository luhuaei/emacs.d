(use-package avy
  :ensure t
  :bind (("C-:" . 'avy-goto-char-timer)
	 ("C-'" . 'avy-goto-char-2)
	 ("M-g f" . 'avy-goto-line)
	 ("C-c C-j" . 'avy-resume)
	 ("M-g w" . 'avy-goto-word-1)))
(provide 'init-avy)
