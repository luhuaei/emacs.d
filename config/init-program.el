;; -*- lexical-binding: t; -*-

;; format
(use-package apheleia
  :after (init)
  :config
  (setf (alist-get 'gofmt apheleia-formatters) '("goimports"))
  (setf (alist-get 'prettier-javascript apheleia-formatters)
        '(npx "prettier" "--stdin-filepath" filepath "--parser=babel-flow")))

(use-package cmake-mode
  :defer t)

;; rust
(use-package rust-mode
  :defer t
  :mode "\\.\\(rs\\)$")

;; golang
(use-package go-mode
  :defer t
  :mode "\\.go$"
  :config
  (setq gofmt-command "goimports")
  (setq gofmt-args nil))

;; ziglang
(use-package zig-mode
  :mode "\\.zig$"
  :config
  (setq zig-format-on-save nil))

;; dart
(use-package dart-mode :mode "\\.dart$")

;; kotlin
(use-package kotlin-mode
  :mode ("\\.\\(kt\\)$" . kotlin-mode))

;; lua
(use-package lua-mode
  :defer t
  :mode "\\.\\(lua\\)$")

;; c/c++
(use-package cc-mode
  :defer t
  :config
  (setq c-default-style '((other . "linux"))))

(use-package c-eldoc
  :defer t
  :ensure nil
  :config
  (c-turn-on-eldoc-mode))

;; yaml
(use-package yaml-mode
  :defer t
  :mode "\\.yaml$")

;; lisp
;; (use-package slime
;;   :disabled t
;;   :defer t
;;   :config
;;   (setq inferior-lisp-program "/bin/sbcl")
;;   (setq slime-contribs '(slime-fancy)))

;; R
;; (use-package ess
;;   :disabled t
;;   :defer t
;;   :mode "\\.\\(r\\|R\\)$"
;;   :config
;;   (setq ess-ask-for-ess-directory nil)
;;   (setq display-buffer-alist
;; 	`(("*R Dired"
;;            (display-buffer-reuse-window display-buffer-in-side-window)
;;            (side . right)
;;            (slot . -1)
;;            (window-width . 0.33)
;;            (reusable-frames . nil))
;;           ("*R"
;;            (display-buffer-reuse-window display-buffer-at-bottom)
;;            (window-width . 0.5)
;;            (reusable-frames . nil)))))

;; python
(use-package python
  :defer t
  :hook (python-mode . awesome-pair-mode)
  :config
)

;; (use-package pyvenv :after (python))

;; julia
(use-package julia-mode
  :defer t
  :mode "\\.\\(jl\\)$"
  :config
  (setq lsp-julia-package-dir nil)
  (setq lsp-julia-flags `("-J/home/redeveder/.julia/languageserver.so"))
  (setq lsp-julia-default-environment "~/.julia/environments/v1.6"))

;; nixlang
(use-package nix-mode
  :defer t
  :mode "\\.nix\\'"
  :config
  (setq nix-nixfmt-bin "nixpkgs-fmt"))

(use-package emmet-mode
  :defer t
  :hook ((web-mode css-mode) . emmet-mode))

;; css
(use-package css-mode
  :defer t
  :init (setq css-indent-offset 2)
  :mode "\\.\\(wxss\\)$")

;; SCSS mode
(use-package scss-mode
  :defer t
  :init
  ;; Disable complilation on save
  (setq scss-compile-at-save nil))

;; less
(use-package less-css-mode
  :defer t)

;; JSON mode
(use-package json-mode :defer t)

;; Typescript
(use-package typescript-mode
  :defer t
  :mode "\\.ts$"
  :config
  (setq typescript-indent-level 2))

(define-derived-mode typescript-tsx-mode typescript-mode "tsx")
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-tsx-mode))

;; (use-package tree-sitter
;;   :defer t
;;   :after tree-sitter-langs
;;   :init
;;   (require 'tree-sitter-hl)
;;   :hook ((typescript-mode . tree-sitter-hl-mode)
;; 	 (typescript-tsx-mode . tree-sitter-hl-mode)))

;; (use-package tree-sitter-langs
;;   :defer t
;;   :config
;;   (tree-sitter-require 'tsx)
;;   (add-to-list 'tree-sitter-major-mode-language-alist '(typescript-tsx-mode . tsx)))

;; javascript mode
(setq js-indent-level 2)
(add-hook 'js-mode-hook (lambda () (local-set-key (kbd "M-\.") 'xref-find-definitions)))

;; vue/php/js/wxml
(use-package web-mode
  :defer t
  :mode "\\.\\(phtml\\|php\\|[gj]sp\\|as[cp]x\\|erb\\|djhtml\\|html?\\|hbs\\|ejs\\|jade\\|swig\\|tm?pl\\|vue\\|wxml|svelte|tsx\\)$"
  :bind (:map web-mode-map
              ("M-\." . 'xref-find-definitions)
              ("M-," . 'xref-go-back))
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

;; custom formmater
(defun my-formatter ()
  (interactive)
  (let ((fn (lambda ())))
    (cond ((eq major-mode 'go-mode) (setq fn 'gofmt))
          ((eq major-mode 'nix-mode) (setq fn 'nix-format-buffer))
          ((eq major-mode 'zig-mode) (setq fn 'zig-format-buffer))
          ((member major-mode '(dart-mode css-mode scss-mode web-mode js-mode typescript-mode less-css-mode))
           (setq fn '(lambda () (apheleia-format-buffer (apheleia--get-formatters)))))
          ((functionp 'lsp-bridge-code-format) (setq fn 'lsp-bridge-code-format))
          ((functionp 'eglot-managed-p) (setq fn 'eglot-format-buffer))
          ((functionp 'lsp-format-buffer) (setq fn 'lsp-format-buffer))
          ((eq major-mode 'js-json-mode) (setq fn 'json-pretty-print)))
    (funcall fn)))

(add-hook 'prog-mode-hook (lambda () (local-set-key (kbd "C-c M-f") #'my-formatter)))

(provide 'init-program)
