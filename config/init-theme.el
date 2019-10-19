(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-solarized-dark t)
  ;; (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config))

(use-package cnfonts :ensure t :defer t)
;; fonts
(set-face-attribute
 'default nil
 :font (font-spec :name "-APPL-Monaco-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"
                  :weight 'normal
                  :slant 'normal
                  :size 13.0))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font
   (frame-parameter nil 'font)
   charset
   (font-spec :name "-STON-幼圆-normal-normal-normal-*-*-*-*-*-d-0-iso10646-1"
              :weight 'normal
              :slant 'normal
              :size 15.0)))

(provide 'init-theme)
