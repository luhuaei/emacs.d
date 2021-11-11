;; -*- lexical-binding: t; -*-

;; long string
(use-package s
  :defer t
  :quelpa (s :fetcher github :repo "magnars/s.el"))

(use-package highlight-parentheses
  :defer t
  :quelpa (highlight-parentheses :fetcher git :url "https://git.sr.ht/~tsdh/highlight-parentheses.el")
  :diminish highlight-parentheses-mode
  :config
  (add-hook 'prog-mode-hook #'highlight-parentheses-mode))

(use-package which-key
  :quelpa (which-key :fetcher github :repo "justbur/emacs-which-key")
  :diminish which-key-mode
  :bind (:map help-map ("C-h" . which-key-C-h-dispatch))
  :hook (ivy-mode . which-key-mode))

(use-package flyspell
  :defer t
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
  :defer t
  :disabled
  :quelpa (devremote :fetcher github :repo "snyh/devremote")
  :bind (:map devremote-mode-map
              ("<f12>" . 'devremote-transfer-current)
  	      ("<f11>" . 'devremote-transfer-project)
  	      ("M-<f12>" . 'devremote-compilation-project))
  )

;; attach package
(use-package diminish
  :defer t
  :quelpa (diminish :fetcher github :repo "myrjola/diminish.el")
  :config
  (diminish abbrev-mode)
  (diminish eldoc-mode))

(use-package exec-path-from-shell
  :quelpa (exec-path-from-shell :fetcher github :repo "purcell/exec-path-from-shell")
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package all-the-icons
  :defer t
  :quelpa (all-the-icons :fetcher github :repo "domtronn/all-the-icons.el" :files ("data" "*.el")))

(use-package auto-package-update
  :defer t
  :quelpa (auto-package-update :fetcher github
                               :repo "rranelli/auto-package-update.el")
  :config
  (setq auto-package-update-delete-old-versions t
        auto-package-update-interval 30)
  (auto-package-update-maybe))

(use-package olivetti
  :after (init)
  :quelpa (olivetti :fetcher github :repo "rnkn/olivetti")
  :diminish
  :bind ("<f7>" . olivetti-mode)
  :init (setq olivetti-body-width 0.618))

(use-package expand-region
  :after (init)
  :quelpa (expand-region :fetcher github :repo "magnars/expand-region.el")
  :bind ("C-=" . er/expand-region))

(use-package rainbow-delimiters
  :defer t
  :quelpa (rainbow-delimiters :fetcher github :repo "Fanael/rainbow-delimiters")
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package rainbow-mode
  :defer t
  :quelpa (rainbow-mode :fetcher github :repo "emacs-straight/rainbow-mode")
  :diminish rainbow-mode
  :config
  (setq rainbow-x-colors nil)
  (add-hook 'prog-mode-hook 'rainbow-mode))

(use-package dumb-jump
  :after (init)
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

(use-package rime
  :after (init)
  :quelpa (emacs-rime :fetcher github :repo "DogLooksGood/emacs-rime" :files ("*.el" "Makefile" "lib.c"))
  :custom
  (default-input-method "rime")
  (rime-show-candidate 'minibuffer)
  :config
  (add-hook 'rime-active-mode-hook #'(rime-active-mode-hook "朙月拼音·简化字"))
  (setq rime-user-data-dir "~/.config/fcitx5/rime/"))

(use-package disable-mouse
  :quelpa (disable-mouse :fetcher github :repo "purcell/disable-mouse")
  :diminish 'disable-mouse-mode
  :config
  (global-disable-mouse-mode))

(use-package sublimity
  :disabled t
  :quelpa (sublimity :fetcher github :repo "zk-phi/sublimity")
  :config
  (require 'sublimity-attractive)

  (sublimity-mode 1)
  (setq sublimity-attractive-centering-width 90)
  (sublimity-attractive-hide-bars)
  (sublimity-attractive-hide-vertical-border)
  (sublimity-attractive-hide-fringes))

(use-package indent-guide
  :after (init)
  :quelpa (indent-guide :fetcher github :repo "zk-phi/indent-guide")
  :config
  (indent-guide-global-mode))

(use-package json-reformat
  :after (init)
  :quelpa (json-reformat :fetcher github :repo "gongo/json-reformat"))

(use-package apheleia
  :after (init)
  :quelpa (apheleia :fetcher github :repo "raxod502/apheleia")
  :config
  (setf (alist-get 'gofmt apheleia-formatters) '("goimports")))

(use-package sort-tab
  :disabled t
  :after (init)
  :quelpa (sort-tab :fetcher github :repo "manateelazycat/sort-tab")
  :bind (:map sort-tab-mode-map
              ("C-M-p" . 'sort-tab-select-prev-tab)
              ("C-M-n" . 'sort-tab-select-next-tab)
              ("C-M-<" . 'sort-tab-select-first-tab)
              ("C-M->" . 'sort-tab-select-last-tab))
  :config
  (sort-tab-mode 1))

(use-package bison
  :diminish bison-mode
  :quelpa (bison :fetcher github :repo "manateelazycat/bison")
  :mode ("\\.\\(y\\)$" . bison-mode))

(provide 'init-utils)
