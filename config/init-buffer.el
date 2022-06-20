;; -*- lexical-binding: t; -*-

(use-package swiper
  :after (init)
  :quelpa (swiper :fetcher github :repo "abo-abo/swiper"))

(use-package avy
  :after (init)
  :quelpa (avy :fetcher github :repo "abo-abo/avy"))

(use-package ivy
  :diminish ivy-mode
  :hook (after-init . ivy-mode)
  :bind (:map ivy-mode-map
              ("C-," . 'counsel-yank-pop)
              ("C-." . 'counsel-mark-ring)
              ("C-'" . 'avy-goto-char)
              ("C-\"" . 'avy-goto-char-2)
              ("C-s" . 'counsel-grep-or-swiper)
              ("C-r" . 'counsel-git-grep)
              ("M-s s" . 'swiper-thing-at-point)
              ("C-c b" . 'counsel-bookmark)
              ("C-c c" . 'counsel-compile)
              ("C-c d" . 'counsel-descbinds)
              ("C-c l" . 'counsel-git-log)
              ("C-c f" . 'find-file-in-project)
              ("C-c m" . 'counsel-linux-app)
              ("C-c n" . 'counsel-fzf)
              ("C-c o" . 'counsel-outline)
              ("C-c v" . 'ivy-push-view)
              ("C-c V" . 'ivy-pop-view)
              ("C-c C-r" . 'ivy-resume)
              ("C-x s" . 'counsel-rg)
              ("C-x b" . 'ivy-switch-buffer)
              ("C-x C-f" . 'counsel-find-file)
              ("M-g f" . 'avy-goto-line)
              ("M-g w" . 'avy-goto-word-1)
              ("M-g e" . 'avy-goto-word-0))
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

  (add-to-list 'ivy-sort-functions-alist '(counsel-mark-ring . (ignore ivy-string<)))
  (setq swiper-action-recenter nil))

(provide 'init-buffer)
