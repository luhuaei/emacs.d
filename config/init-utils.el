(use-package highlight-parentheses
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'highlight-parentheses-mode))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :bind (:map help-map ("C-h" . which-key-C-h-dispatch))
  :hook (after-init . which-key-mode))

(when (display-graphic-p)
  (use-package pdf-tools
    :ensure t
    :diminish (pdf-view-midnight-minor-mode pdf-view-printer-minor-mode)
    :defines pdf-annot-activate-created-annotations
    :mode ("\\.[pP][dD][fF]\\'" . pdf-view-mode)
    :magic ("%PDF" . pdf-view-mode)
    :bind (:map pdf-view-mode-map
                ("C-s" . isearch-forward))
    :init
    (setq pdf-view-midnight-colors '("#ededed" . "#21242b")
          pdf-annot-activate-created-annotations t)
    :config
    (pdf-tools-install t nil t t)

    ;; Recover last viewed position
    (use-package pdf-view-restore
      :ensure t
      :hook (pdf-view-mode . pdf-view-restore-mode)
      :init (setq pdf-view-restore-filename
                  (locate-user-emacs-file ".pdf-view-restore")))))

(use-package nov
  :ensure t
  :mode ("\\.epub\\'" . nov-mode)
  :preface
  (defun my-nov-setup ()
    (visual-line-mode 1)
    (face-remap-add-relative 'variable-pitch :family "Times New Roman" :height 1.5)
    (if (fboundp 'olivetti-mode) (olivetti-mode 1)))
  :hook (nov-mode . my-nov-setup))

(use-package olivetti
  :ensure t
  :diminish
  :bind ("<f7>" . olivetti-mode)
  :init (setq olivetti-body-width 0.618))

(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character))

(provide 'init-utils)
