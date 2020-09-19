;; -*- lexical-binding: t; -*-

(use-package ivy
  :diminish ivy-mode
  :hook (after-init . ivy-mode)
  :bind (:map ivy-mode-map
              ("C-s" . 'counsel-grep-or-swiper)
              ("M-s s" . 'swiper-thing-at-point)
	      ("M-x" . 'counsel-M-x)
              ("C-x b" . 'counsel-ibuffer)
              ("C-c C-s" . 'counsel-rg))
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-magic-slash-non-match-action nil)

  (setq ivy-use-selectable-prompt t
        ivy-height 10
        ivy-fixed-height-minibuffer t
        ivy-count-format "(%d/%d) "
        ivy-on-del-error-function nil
        ivy-initial-inputs-alist nil)

  (setq swiper-action-recenter t))

(use-package swiper)
(use-package counsel)

(provide 'init-buffer)
