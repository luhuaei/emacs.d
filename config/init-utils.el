;; -*- lexical-binding: t; -*-

;; long string
(use-package s
  :ensure t)

(use-package highlight-parentheses
   :diminish highlight-parentheses-mode
  :config
  (add-hook 'prog-mode-hook #'highlight-parentheses-mode))

(use-package which-key
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
  :config
  (diminish abbrev-mode)
  (diminish eldoc-mode))

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package all-the-icons)

(use-package auto-package-update
   :config
   (setq auto-package-update-delete-old-versions t
         auto-package-update-interval 30)
   (auto-package-update-maybe))

(use-package highlight-indent-guides
  :disabled t
  :ensure t
  :diminish 'highlight-indent-guides-mode
  :hook ('prog-mode . 'highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character))

(use-package olivetti
  :diminish
  :bind ("<f7>" . olivetti-mode)
  :init (setq olivetti-body-width 0.618))


(use-package undo-tree
  :defer t
  :diminish undo-tree-mode
  :init (global-undo-tree-mode 1)
  :custom
  (undo-tree-visualizer-diff t)
  (undo-tree-visualizer-timestamps t))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package rainbow-mode
  :diminish rainbow-mode
  :config
  (setq rainbow-x-colors nil)
  (add-hook 'prog-mode-hook 'rainbow-mode))

(use-package fzf)

(use-package dumb-jump
  :ensure nil
  :quelpa (dumb-jump :fetcher github :repo "jacktasia/dumb-jump")
  :config
  (setq dumb-jump-quiet t)
  (setq dumb-jump-force-searcher 'rg)
  (setq dumb-jump-prefer-searcher 'rg)
  (dolist (hook (list
                 'js-mode-hook
                 'web-mode-hook
                 ))
    (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)))

(use-package treemacs
  :bind (("<f8>" . treemacs)))

(use-package rime
  :custom
  (default-input-method "rime")
  (rime-show-candidate 'minibuffer)
  :config
  (setq rime-user-data-dir "~/.config/fcitx/rime/"))

(use-package disable-mouse
  :ensure t
  :diminish 'disable-mouse-mode
  :config
  (global-disable-mouse-mode))

(provide 'init-utils)
