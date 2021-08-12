;; -*- lexical-binding: t; -*-

(use-package css-mode
  :defer t
  :init (setq css-indent-offset 2)
  :bind (:map css-mode-map
              ("C-c M-f" . 'apheleia-format-buffer))
  :mode "\\.\\(wxss\\)$")

;; SCSS mode
(use-package scss-mode
  :defer t
  :quelpa (scss-mode :fetcher github :repo "antonj/scss-mode")
  :init
  ;; Disable complilation on save
  (setq scss-compile-at-save nil)
  :bind (:map scss-mode-map
              ("C-c M-f" . 'apheleia-format-buffer)))

(use-package less-css-mode
  :defer t
  :bind (:map less-css-mode-map
              ("C-c M-f" . 'apheleia-format-buffer)))

;; JSON mode
(use-package json-mode :defer t :quelpa (json-mode :fetcher github :repo "joshwnj/json-mode"))

;; Typescript
(use-package typescript-mode
  :defer t
  :quelpa (typescript-mode :fetcher github :repo "ananthakumaran/typescript.el")
  :bind (:map typescript-mode-map
              ("C-c M-f" . 'apheleia-format-buffer))
  :config
  (setq typescript-indent-level 2))

;; javascript mode
(use-package js
  :defer t
  :bind (:map js-mode-map
              ("C-c M-f" . 'apheleia-format-buffer))
  :config
  (setq js-indent-level 2)
  (add-hook 'js-mode-hook
            (lambda ()
              (local-set-key (kbd "M-\.") 'xref-find-definitions))))

;; Major mode for editing web templates
(use-package web-mode
  :defer t
  :quelpa (web-mode :fetcher github :repo "fxbois/web-mode")
  :mode "\\.\\(phtml\\|php|[gj]sp\\|as[cp]x\\|erb\\|djhtml\\|html?\\|hbs\\|ejs\\|jade\\|swig\\|tm?pl\\|vue\\|wxml\\)$"
  :bind (:map web-mode-map
              ("M-\." . #'xref-find-definitions)
              ("C-c M-f" . 'apheleia-format-buffer))
  :config
  (setq web-mode-enable-auto-indentation nil)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-block-padding 0)
  (setq web-mode-style-padding 0)
  (setq web-mode-script-padding 0)

  (setq web-mode-enable-auto-expanding t)
  (setq web-mode-enable-curly-brace-indentation t)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-comment-interpolation t)

  (setq web-mode-auto-close-style 2)
  (setq web-mode-auto-quote-style 2)
  (setq web-mode-auto-pairs t)
  (setq-default web-mode-comment-formats
              '(("java"       . "//")
                ("javascript" . "//")
                ("php"        . "//"))))


(provide 'init-web)
