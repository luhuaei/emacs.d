;; -*- lexical-binding: t; -*-

(use-package ivy
  :diminish ivy-mode
  :hook (after-init . ivy-mode)
  :bind (:map ivy-mode-map
              ("C-s" . 'swiper)
              ("M-s s" . 'swiper-thing-at-point)
	      ("M-x" . 'counsel-M-x)
	      ("C-x C-f" . 'counsel-find-file))
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-magic-slash-non-match-action nil))

(use-package swiper)
(use-package counsel)

(provide 'init-buffer)
