(use-package highlight-parentheses
  :diminish highlight-parentheses-mode
  :config
  (add-hook 'prog-mode-hook #'highlight-parentheses-mode))

(use-package which-key
  :diminish which-key-mode
  :bind (:map help-map ("C-h" . which-key-C-h-dispatch))
  :hook (after-init . which-key-mode))

(use-package nov
  :mode ("\\.epub\\'" . nov-mode)
  :preface
  (defun my-nov-setup ()
    (visual-line-mode 1)
    (face-remap-add-relative 'variable-pitch :family "Times New Roman" :height 1.5)
    (if (fboundp 'olivetti-mode) (olivetti-mode 1)))
  :hook (nov-mode . my-nov-setup))

(use-package olivetti
  :bind ("<f7>" . olivetti-mode)
  :init (setq olivetti-body-width 0.618))

;; (use-package interleave
;;   :ensure nil
;;   :diminish interleave-pdf-mode interleave-mode
;;   :config
;;   (setq interleave-org-notes-dir-list '("~/org/interleave/" "~/Books/"))
;;   (setq interleave-split-direction 'horizontal)
;;   (setq interleave-disable-narrowing t)
;;   (setq interleave-split-lines 10))

(use-package highlight-indent-guides
  :diminish highlight-indent-guides-mode
  :disabled
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character))

(use-package multiple-cursors
  :diminish multiple-cursors-mode
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

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

(provide 'init-utils)
