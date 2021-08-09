;; -*- lexical-binding: t; -*-

(use-package swiper
  :ensure nil
  :quelpa (swiper :fetcher github :repo "abo-abo/swiper"))

(use-package find-file-in-project
  :quelpa (find-file-in-project :fetcher github :repo "redguardtoo/find-file-in-project"))

(use-package ivy
  :diminish ivy-mode
  :hook (after-init . ivy-mode)
  :bind (:map ivy-mode-map
              ("C-s" . 'counsel-grep-or-swiper)
              ("M-s s" . 'swiper-thing-at-point)
              ("C-x b" . 'counsel-ibuffer)
              ("C-c f" . 'find-file-in-project)
              ("C-c C-s" . 'counsel-git-grep)
              ("C-c M-s" . 'counsel-rg)
              ("C-c i r" . 'counsel-buffer-or-recentf))
  :config
  (setq ivy-use-virtual-buffers 'recentf)
  (setq enable-recursive-minibuffers t)
  (setq ivy-magic-slash-non-match-action nil)

  (setq ivy-use-selectable-prompt t
        ivy-height 10
        ivy-fixed-height-minibuffer t
        ivy-count-format "(%d/%d) "
        ivy-on-del-error-function nil
        ivy-initial-inputs-alist nil)

  (setq swiper-action-recenter t))

(provide 'init-buffer)
