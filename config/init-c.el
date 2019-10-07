(use-package cc-mode
  :ensure t
  :bind (:map c-mode-base-map
         ("C-c c" . compile))
  :hook (c-mode-common . (lambda ()
                           (c-set-style "bsd")
                           (setq tab-width 4)
                           (setq c-basic-offset 4)))
  :config
  (use-package modern-cpp-font-lock
    :ensure t
    :diminish
    :init (modern-c++-font-lock-global-mode t))
  (use-package c-eldoc
    :ensure t
    :config
    (c-turn-on-eldoc-mode)))

(provide 'init-c)
