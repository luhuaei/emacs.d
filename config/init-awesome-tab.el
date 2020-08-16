;; -*- lexical-binding: t; -*-

(use-package awesome-tab
  :ensure nil
  :quelpa (awesome-tab :fetcher github :repo "manateelazycat/awesome-tab")
  :bind (:map awesome-tab-mode-map
         ("M-j" . 'awesome-tab-forward-group)
         ("M-k" . 'awesome-tab-backward-group)
         ("M-h" . 'awesome-tab-backward-tab)
         ("M-l" . 'awesome-tab-forward-tab)
         ("M-a" . 'awesome-tab-select-beg-tab)
         ("M-e" . 'awesome-tab-select-end-tab))
  :config
  (setq awesome-tab-height 130)
  (awesome-tab-mode 1))

(provide 'init-awesome-tab)
