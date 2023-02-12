;; -*- lexical-binding: t; -*-

;; base library
(use-package s
  :defer t)

(use-package yasnippet
  :defer t
  :config
  (use-package yasnippet-snippets)
  (setq yas-snippet-dirs (list
                          (expand-file-name "snippets" emacs-root-dir)
                          yasnippet-snippets-dir))
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode))

(use-package highlight-parentheses
  :defer t
  :diminish highlight-parentheses-mode
  :config
  (add-hook 'prog-mode-hook #'highlight-parentheses-mode))

(use-package which-key
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
  :bind (:map devremote-mode-map
              ("<f12>" . 'devremote-transfer-current)
  	      ("<f11>" . 'devremote-transfer-project)
  	      ("M-<f12>" . 'devremote-compilation-project))
  )

;; attach package
(use-package diminish
  :defer t
  :config
  (diminish abbrev-mode)
  (diminish eldoc-mode))

(use-package all-the-icons
  :defer t)

(use-package expand-region
  :after (init)
  :bind ("C-=" . er/expand-region))

(use-package rime
  :after (init)
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

;; C-a to the first char not whitespacee
(use-package crux
  :after (init)
  :bind (("C-a" . crux-move-beginning-of-line)))

;; go to the last change
(use-package goto-last-change
  :after (init)
  :bind (("C-:" . goto-last-change)))

(use-package auto-save
  :after (init)
  :config
  (auto-save-enable)
  (setq auto-save-idle 5)
  (setq auto-save-silent t)
  (setq auto-save-delete-trailing-whitespace t))

(use-package awesome-pair
  :after (init)
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
  :config
  (add-hook 'prog-mode-hook 'awesome-pair-mode))

(use-package open-newline
  :after (init)
  :config
  (define-key global-map (kbd "C-o") 'open-newline-below)
  (define-key global-map (kbd "C-S-o") 'open-newline-above))

(use-package posframe :defer t)

;; search
(use-package color-rg
  :after (init)
  :bind (("M-s M-s" . 'isearch-toggle-color-rg)
         ("M-s i" . 'color-rg-search-input)
         ("M-s M-i" . 'color-rg-search-input-in-current-file)
         ("M-s p" . 'color-rg-search-project)))

(use-package find-file-in-project
  :after (init))

(use-package dumb-jump
  :after (init)
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
