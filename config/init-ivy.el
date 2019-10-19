(use-package ivy
  :ensure t
  :hook (after-init . ivy-mode)
  :bind (:map ivy-mode-map
	      ("C-s" . 'swiper)
	      ("C-c C-r" . 'ivy-resume)
	      ("M-x" . 'counsel-M-x)
	      ("C-x C-f" . 'counsel-find-file)
	      ("M-s s" . 'swiper-thing-at-point))
  :config
  (use-package swiper
    :ensure t)
  (use-package counsel
    :ensure t)

  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

(provide 'init-ivy)
