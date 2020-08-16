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
(use-package diminish)

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
  :init (global-undo-tree-mode)
  :custom
  (undo-tree-visualizer-diff t)
  (undo-tree-visualizer-timestamps t))
(provide 'init-utils)
