(use-package ivy
  :diminish ivy-mode
  :hook (after-init . ivy-mode)
  :bind (:map ivy-mode-map
	      ("C-s" . 'swiper)
	      ("C-c C-r" . 'ivy-resume)
	      ("M-x" . 'counsel-M-x)
	      ("C-x C-f" . 'counsel-find-file)
	      ("M-s s" . 'swiper-thing-at-point)
              ("C-c r" . 'counsel-rg))
  :config
  (use-package swiper)
  (use-package counsel)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-magic-slash-non-match-action nil)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

(provide 'init-ivy)
