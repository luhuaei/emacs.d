;; -*- lexical-binding: t; -*-

;; long string
(use-package s
  :ensure nil
  :quelpa (s :fetcher github :repo "magnars/s.el"))

(use-package highlight-parentheses
  :ensure nil
  :load-path emacs-extension-dir
  :diminish highlight-parentheses-mode
  :config
  (add-hook 'prog-mode-hook #'highlight-parentheses-mode))

(use-package which-key
  :quelpa (which-key :fetcher github :repo "justbur/emacs-which-key")
  :diminish which-key-mode
  :bind (:map help-map ("C-h" . which-key-C-h-dispatch))
  :hook (after-init . which-key-mode))

(use-package flyspell
  :ensure nil
  :diminish
  :if (executable-find "aspell")
  :hook (((text-mode outline-mode) . flyspell-mode)
         (flyspell-mode . (lambda ()
                            (dolist (key '("C-;" "C-," "C-."))
                              (unbind-key key flyspell-mode-map)))))
  :init
  (setq flyspell-issue-message-flag nil
        ispell-program-name "aspell"
        ispell-extra-args '("--sug-mode=ultra" "--lang=en_US" "--run-together")))

(use-package devremote
  :disabled
  :ensure nil
  :quelpa (devremote :fetcher github :repo "snyh/devremote")
  :bind (:map devremote-mode-map
               ("<f12>" . 'devremote-transfer-current)
  	       ("<f11>" . 'devremote-transfer-project)
  	       ("M-<f12>" . 'devremote-compilation-project))
  )

;; attach package
(use-package diminish
  :ensure nil
  :quelpa (diminish :fetcher github :repo "myrjola/diminish.el")
  :config
  (diminish abbrev-mode)
  (diminish eldoc-mode))

(use-package exec-path-from-shell
  :ensure nil
  :quelpa (exec-path-from-shell :fetcher github :repo "purcell/exec-path-from-shell")
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package all-the-icons
  :ensure nil
  :quelpa (all-the-icons :fetcher github :repo "domtronn/all-the-icons.el"))

(use-package auto-package-update
  :ensure nil
  :quelpa (auto-package-update :fetcher github :repo "rranelli/auto-package-update.el")
  :config
  (setq auto-package-update-delete-old-versions t
        auto-package-update-interval 30)
  (auto-package-update-maybe))

(use-package olivetti
  :ensure nil
  :quelpa (olivetti :fetcher github :repo "rnkn/olivetti")
  :diminish
  :bind ("<f7>" . olivetti-mode)
  :init (setq olivetti-body-width 0.618))

(use-package expand-region
  :ensure nil
  :quelpa (expand-region :fetcher github :repo "magnars/expand-region.el")
  :bind ("C-=" . er/expand-region))

(use-package rainbow-delimiters
  :ensure nil
  :quelpa (rainbow-delimiters :fetcher github :repo "Fanael/rainbow-delimiters")
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package rainbow-mode
  :ensure nil
  :quelpa (rainbow-mode :fetcher github :repo "emacs-straight/rainbow-mode")
  :diminish rainbow-mode
  :config
  (setq rainbow-x-colors nil)
  (add-hook 'prog-mode-hook 'rainbow-mode))

(use-package fzf
  :ensure nil
  :quelpa (fzf :fetcher github :repo "bling/fzf.el"))

;; (use-package dumb-jump
;;   :ensure nil
;;   :disabled t
;;   :quelpa (dumb-jump :fetcher github :repo "jacktasia/dumb-jump")
;;   :config
;;   (setq dumb-jump-quiet t)
;;   (setq dumb-jump-force-searcher 'rg)
;;   (setq dumb-jump-prefer-searcher 'rg)
;;   (dolist (hook (list
;;                  'js-mode-hook
;;                  'web-mode-hook
;;                  ))
;;     (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)))

(use-package rime
  :ensure nil
  :load-path emacs-extension-dir
  :custom
  (default-input-method "rime")
  (rime-show-candidate 'minibuffer)
  :config
  (setq rime-user-data-dir "~/.config/fcitx5/rime/"))

(use-package disable-mouse
  :ensure nil
  :disabled t
  :quelpa (disable-mouse :fetcher github :repo "purcell/disable-mouse")
  :diminish 'disable-mouse-mode
  :config
  (global-disable-mouse-mode))

(use-package sublimity
  :ensure nil
  :load-path emacs-extension-dir
  :config
  (require 'sublimity-attractive)

  (sublimity-mode 1)
  (setq sublimity-attractive-centering-width 90)
  (sublimity-attractive-hide-bars)
  (sublimity-attractive-hide-modelines)
  (sublimity-attractive-hide-vertical-border)
  (sublimity-attractive-hide-fringes))

(use-package treemacs
  :ensure nil
  :bind (("<f8>" . treemacs)))

(provide 'init-utils)
