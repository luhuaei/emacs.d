;; -*- lexical-binding: t; -*-

;; base library
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

(use-package rime
  :after (init)
  :quelpa (emacs-rime :fetcher github :repo "DogLooksGood/emacs-rime" :files ("*.el" "Makefile" "lib.c"))
  :custom
  (default-input-method "rime")
  (rime-show-candidate 'minibuffer)
  :config
  (define-key rime-mode-map (kbd "M-j") 'rime-force-enable)
  (setq rime-user-data-dir "~/.config/fcitx5/rime/")
  (setq rime-share-data-dir "/usr/share/rime-data/")
  (setq rime-disable-predicates
        '(rime-predicate-after-alphabet-char-p
          rime-predicate-auto-english-p
          rime-predicate-punctuation-after-space-cc-p
          rime-predicate-punctuation-after-ascii-p
          rime-predicate-space-after-cc-p
          rime-predicate-prog-in-code-p)))

(use-package disable-mouse
  :quelpa (disable-mouse :fetcher github :repo "purcell/disable-mouse")
  :diminish 'disable-mouse-mode
  :config
  (global-disable-mouse-mode))

(use-package indent-guide
  :after (init)
  :quelpa (indent-guide :fetcher github :repo "zk-phi/indent-guide")
  :config
  (indent-guide-global-mode))

;; C-a to the first char not whitespacee
(use-package crux
  :after (init)
  :quelpa (crux :fetcher github :repo "bbatsov/crux")
  :bind (("C-a" . crux-move-beginning-of-line)))

;; go to the last change
(use-package goto-last-change
  :after (init)
  :quelpa (goto-last-change :fetcher github :repo "camdez/goto-last-change.el")
  :bind (("C-:" . goto-last-change)))

(use-package auto-save
  :after (init)
  :quelpa (auto-save :fetcher github :repo "manateelazycat/auto-save")
  :config
  (auto-save-enable)
  (setq auto-save-idle 1)
  (setq auto-save-silent t)
  (setq auto-save-delete-trailing-whitespace t))

(use-package awesome-pair
:after (init)
  :quelpa (awesome-pair :fetcher github :repo "manateelazycat/awesome-pair")
  :hook ((
          prog-mode
	  minibuffer-inactive-mode
	  pipenv-mode
          protobuf-mode
          conf-toml-mode) . awesome-pair-mode)
  :bind (:map awesome-pair-mode-map
              ("(" . 'awesome-pair-open-round)
              (")" . 'awesome-pair-close-round)
              ("[" . 'awesome-pair-open-bracket)
              ("]" . 'awesome-pair-close-bracket)
              ("{" . 'awesome-pair-open-curly)
              ("}" . 'awesome-pair-close-curly)
              ("=" . 'awesome-pair-equal)
              ("%" . 'awesome-pair-match-paren)
              ("\"" . 'awesome-pair-double-quote)
              ("SPC" . 'awesome-pair-space)
              ("M-o" . 'awesome-pair-backward-delete)
              ("C-d" . 'awesome-pair-forward-delete)
              ("C-k" . 'awesome-pair-kill)
              ("M-\"" . 'awesome-pair-wrap-bracket)
              ("M-[" . 'awesome-pair-wrap-curly)
              ("M-{" . 'awesome-pair-wrap-curly)
              ("M-(" . 'awesome-pair-wrap-round)
              ("M-)" . 'awesome-pair-unwrap)
              ("M-p" . 'awesome-pair-jump-right)
              ("M-n" . 'awesome-pair-jump-left)
              ("M-:" . 'awesome-pair-jump-out-pair-and-newline))
  )

(use-package posframe
  :defer t
  :quelpa (posframe :fetcher github :repo "tumashu/posframe"))

;; search
(use-package color-rg
  :after (init)
  :quelpa (color-rg :fetcher github :repo "manateelazycat/color-rg")
  :bind (("M-s M-s" . 'isearch-toggle-color-rg)
         ("M-s i" . 'color-rg-search-input)
         ("M-s M-i" . 'color-rg-search-input-in-current-file)
         ("M-s p" . 'color-rg-search-project)))

(use-package find-file-in-project
  :after (init)
  :quelpa (find-file-in-project :fetcher github :repo "redguardtoo/find-file-in-project"))

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

;; dict
(use-package sdcv
  :after (init)
  :quelpa (sdcv :fetcher github :repo "manateelazycat/sdcv")
  :config
  (setq sdcv-say-word-p nil)               ;say word after translation

  (if (display-graphic-p)
      (progn
        (bind-key "C-c p" 'sdcv-search-pointer+)
        (bind-key "C-c s" 'sdcv-search-input+))
    (bind-key "C-c p" 'sdcv-search-pointer)
    (bind-key "C-c s" 'sdcv-search-input))

  (setq sdcv-dictionary-data-dir (expand-file-name "~/emacs.d/sdcv-dict/")))

(provide 'init-utils)
