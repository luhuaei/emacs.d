;; -*- lexical-binding: t; -*-

(use-package css-mode
  :init (setq css-indent-offset 2)
  :mode "\\.\\(wxss\\)$")

;; SCSS mode
(use-package scss-mode
  :ensure nil
  :quelpa (scss-mode :fetcher github :repo "antonj/scss-mode")
  :init
  ;; Disable complilation on save
  (setq scss-compile-at-save nil))

(use-package less-css-mode :ensure nil)

;; JSON mode
(use-package json-mode :ensure nil :quelpa (json-mode :fetcher github :repo "joshwnj/json-mode"))

;; Typescript
(use-package typescript-mode
  :ensure nil
  :quelpa (typescript-mode :fetcher github :repo "ananthakumaran/typescript.el")
  :config
  (setq typescript-indent-level 2))

;; javascript mode
(setq js-indent-level 2)
(add-hook 'js-mode-hook
          (lambda ()
            (local-set-key (kbd "M-\.") 'xref-find-definitions)))

;; Major mode for editing web templates
(use-package web-mode
  :ensure nil
  :quelpa (web-mode :fetcher github :repo "fxbois/web-mode")
  :mode "\\.\\(phtml\\|php|[gj]sp\\|as[cp]x\\|erb\\|djhtml\\|html?\\|hbs\\|ejs\\|jade\\|swig\\|tm?pl\\|vue\\|wxml\\)$"
  :bind (:map web-mode-map
              ("M-\." . #'dumb-jump-go)
              ("M-\," . #'dumb-jump-back)
              ("C-c M-f" . #'apheleia-format-buffer))
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
