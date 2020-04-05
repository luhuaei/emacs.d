(use-package awesome-tab
  :ensure nil
  :quelpa (awesome-tab :fetcher github :repo "manateelazycat/awesome-tab")
  :bind (:map awesome-tab-mode-map
              ("M-l" . 'awesome-tab-forward-tab)
              ("M-h" . 'awesome-tab-backward-tab)
              ("M-j" . 'awesome-tab-backward-group)
              ("M-k" . 'awesome-tab-forward-group))
  :config
  (awesome-tab-mode t)
  (setq awesome-tab-height 100)
  (setq awesome-tab-label-fixed-length 14))

(provide 'init-awesome-tab)
