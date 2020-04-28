;; -*- lexical-binding: t; -*-

(use-package css-mode
  :init (setq css-indent-offset 2)
  :mode "\\.\\(wxss\\)$")

;; SCSS mode
(use-package scss-mode
  :init
  ;; Disable complilation on save
  (setq scss-compile-at-save nil))

(use-package less-css-mode)

;; JSON mode
(use-package json-mode)

;; Typescript
(use-package typescript-mode)

;; javascript mode
(add-hook 'js-mode-hook (lambda () (local-set-key (kbd "M-\.") 'xref-find-definitions)))

;; Major mode for editing web templates
(use-package web-mode
  :mode "\\.\\(phtml\\|php|[gj]sp\\|as[cp]x\\|erb\\|djhtml\\|html?\\|hbs\\|ejs\\|jade\\|swig\\|tm?pl\\|vue\\|wxml\\)$"
  :config
  (setq web-mode-enable-auto-indentation nil)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-block-padding 0)
  (setq web-mode-style-padding 1)
  (setq web-mode-script-padding 0)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-comment-interpolation t)
  (setq-default web-mode-comment-formats
              '(("java"       . "/*")
                ("javascript" . "//")
                ("php"        . "/*"))))
(setq js-indent-level 2)

(provide 'init-web)
