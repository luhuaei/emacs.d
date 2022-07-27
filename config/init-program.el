;; -*- lexical-binding: t; -*-

;; format
(use-package apheleia
  :after (init)
  :quelpa (apheleia :fetcher github :repo "raxod502/apheleia")
  :config
  (setf (alist-get 'gofmt apheleia-formatters) '("goimports"))
  (add-to-list 'apheleia-formatters '(dart . ("dart" "format")))
  (add-to-list 'apheleia-mode-alist '(dart-mode . dart)))

;; lsp
(use-package eglot
  :after (init)
  :quelpa (eglot :fetcher github :repo "joaotavora/eglot" :files ("Makefile" "*.el"))
  :diminish eglot-mode
  :bind (:map eglot-mode-map
              ("C->" . 'eglot-find-implementation)
              ("C-<" . 'xref-find-references))
  :config
  (setq eglot-ignored-server-capabilities
        '(:hoverProvider :signatureHelpProvider))

  (defun local-go-module-root (dir)
    (when-let ((root (locate-dominating-file dir "go.mod")))
      (cons 'go-module root)))
  (add-hook 'project-find-functions #'local-go-module-root)

  (cl-defmethod project-roots ((project (head go-module)))
    (list (cdr project)))

  (dolist (hook (list
                 'c-mode-hook
                 'c++-mode-hook
                 'go-mode-hook
                 'rust-mode-hook
                 'typescript-mode-hook
                 'zig-mode-hook
                 ))
    (add-hook hook 'eglot-ensure)))

(use-package lsp-bridge
  :disabled t
  :after (init)
  :load-path emacs-extension-dir
  :diminish lsp-bridge-mode
  :bind (:map lsp-bridge-mode-map
              ("M-." . 'lsp-bridge-find-def)
              ("M-," . 'lsp-bridge-return-from-def)
              ("C->" . 'lsp-bridge-find-impl)
              ("C-<" . 'lsp-bridge-find-references))
  :config
  (dolist (hook (list
                 'c-mode-hook
                 'c++-mode-hook
                 'go-mode-hook
                 'rust-mode-hook
                 'typescript-mode-hook
                 'zig-mode-hook
                 ))
    (add-hook hook '(lambda ()
                      (company-mode -1)
                      (lsp-bridge-mode 1)))))

;; rust
(use-package rust-mode
  :defer t
  :quelpa (rust-mode :fetcher github :repo "rust-lang/rust-mode")
  :mode "\\.\\(rs\\)$")

;; golang
(use-package go-mode
  :defer t
  :quelpa (go-mode :fetcher github :repo "dominikh/go-mode.el")
  :config
  (setq gofmt-command "goimports")
  (setq gofmt-args nil))

;; ziglang
(use-package zig-mode
  :quelpa (zig-mode :fetcher github :repo "ziglang/zig-mode")
  :mode "\\.zig$"
  :config
  (setq zig-format-on-save nil))

;; dart
(use-package dart-mode
  :quelpa (dart-mode :fetcher github :repo "bradyt/dart-mode")
  :mode "\\.dart$")

;; kotlin
(use-package kotlin-mode
  :quelpa (kotlin-mode :fetcher github :repo "Emacs-Kotlin-Mode-Maintainers/kotlin-mode")
  :mode ("\\.\\(kt\\)$" . kotlin-mode))

;; lua
(use-package lua-mode
  :defer t
  :quelpa (lua-mode :fetcher github :repo "immerrr/lua-mode")
  :mode "\\.\\(lua\\)$")

;; c/c++
(use-package cc-mode
  :defer t
  :config
  (setq c-default-style '((other . "linux"))))

(use-package c-eldoc
  :defer t
  :ensure nil
  :quelpa (c-eldoc :fetcher github :repo "nflath/c-eldoc")
  :config
  (c-turn-on-eldoc-mode))

;; yaml
(use-package yaml-mode
  :diminish yaml-mode
  :quelpa (yaml-mode :fetcher github :repo "yoshiki/yaml-mode")
  :mode ("\\.yml\\'" . yaml-mode))

;; lisp
(use-package slime
  :defer t
  :quelpa (slime :fetcher github :repo "slime/slime")
  :load-path "~/.emacs.d/quelpa/build/slime"
  :config
  (setq inferior-lisp-program "/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

;; R
(use-package ess
  :disabled t
  :defer t
  :quelpa (ESS :fetcher github :repo "emacs-ess/ESS")
  :load-path "~/.emacs.d/quelpa/build/ESS/lisp"
  :config
  (setq ess-ask-for-ess-directory nil)
  (setq display-buffer-alist
	`(("*R Dired"
           (display-buffer-reuse-window display-buffer-in-side-window)
           (side . right)
           (slot . -1)
           (window-width . 0.33)
           (reusable-frames . nil))
          ("*R"
           (display-buffer-reuse-window display-buffer-at-bottom)
           (window-width . 0.5)
           (reusable-frames . nil))))
  (setq ess-use-company t))

;; python
(use-package python
  :defer t
  :hook (python-mode . awesome-pair-mode)
  :bind (:map python-mode-map
	      ("C-<return>" . jupyter-eval-line-or-region)
              ("M-\." . #'dumb-jump-go)
              ("M-\," . #'dumb-jump-back))
  :config
  (defun my-jupyter-next-line (insert)
    (let ((status (use-region-p)))
      (if status
	  (goto-char (cdar (region-bounds)))
	nil)
      (beginning-of-line)
      (next-line)
      (end-of-line)
      (if status (keyboard-quit) nil)))

  (advice-add #'jupyter-eval-line-or-region :after #'my-jupyter-next-line)

  (defun my-hide-jupyter-windows ()
    (interactive)
    (let ((d (get-buffer-window "*jupyter-display*"))
	  (r (get-buffer-window "*jupyter-result*"))
	  (o (get-buffer-window "*jupyter-output*"))
	  (tb (get-buffer-window "*jupyter-traceback*"))
	  (e (get-buffer-window "*jupyter-error*")))
      (cond
       (d (delete-window d))
       (r (delete-window r))
       (o (delete-window o))
       (tb (delete-window tb))
       (e (delete-window e))
       nil)))
  ;; (advice-add #'keyboard-quit :before #'my-hide-jupyter-windows)

  (use-package pipenv
    :after (python)
    :quelpa (pipenv :fetcher github :repo "pwalsh/pipenv.el")
    :diminish pipenv-mode-hook
    :init
    (setq
     pipenv-projectile-after-switch-function
     #'pipenv-projectile-after-switch-extended))

  (use-package emacs-jupyter
    :after (python)
    :quelpa (emacs-jupyter :fetcher github :repo "nnicandro/emacs-jupyter")
    :hook ((jupyter-repl-mode . awesome-pair-mode)
	   (jupyter-repl-mode . company-mode))))

;; julia
(use-package julia-mode
  :disabled t
  :defer t
  :quelpa (julia-emacs :fetcher github :repo "JuliaEditorSupport/julia-emacs")
  :config
  (setq lsp-julia-package-dir nil)
  (setq lsp-julia-flags `("-J/home/redeveder/.julia/languageserver.so"))


  (use-package lsp-julia
    :after (julia)
    :quelpa (lsp-julia :fetcher github :repo "non-Jedi/lsp-julia")
    :ensure nil)

  (setq lsp-julia-default-environment "~/.julia/environments/v1.6"))

;; nixlang
(use-package nix-mode
  :defer t
  :quelpa (nix-mode :fetcher github :repo "NixOS/nix-mode")
  :mode "\\.nix\\'"
  :config
  (setq nix-nixfmt-bin "nixpkgs-fmt"))

;; css
(use-package css-mode
  :defer t
  :init (setq css-indent-offset 2)
  :mode "\\.\\(wxss\\)$")

;; SCSS mode
(use-package scss-mode
  :defer t
  :quelpa (scss-mode :fetcher github :repo "antonj/scss-mode")
  :init
  ;; Disable complilation on save
  (setq scss-compile-at-save nil))

;; less
(use-package less-css-mode
  :defer t)

;; JSON mode
(use-package json-mode :defer t :quelpa (json-mode :fetcher github :repo "joshwnj/json-mode"))

;; Typescript
(use-package typescript-mode
  :defer t
  :quelpa (typescript-mode :fetcher github :repo "ananthakumaran/typescript.el")
  :config
  (setq typescript-indent-level 2))

;; javascript mode
(use-package js
  :defer t
  :config
  (setq js-indent-level 2)
  (add-hook 'js-mode-hook
            (lambda ()
              (local-set-key (kbd "M-\.") 'xref-find-definitions))))

;; vue/php/js/wxml
(use-package web-mode
  :defer t
  :quelpa (web-mode :fetcher github :repo "fxbois/web-mode")
  :mode "\\.\\(phtml\\|php|[gj]sp\\|as[cp]x\\|erb\\|djhtml\\|html?\\|hbs\\|ejs\\|jade\\|swig\\|tm?pl\\|vue\\|wxml\\)$"
  :bind (:map web-mode-map
              ("M-\." . #'xref-find-definitions))
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
          ((eq major-mode 'rust-mode) (setq fn 'eglot-format-buffer))
          ((member major-mode '(dart-mode css-mode scss-mode web-mode js-mode typescript-mode less-css-mode))
           (setq fn '(lambda () (apheleia-format-buffer (apheleia--get-formatters))))))
    (funcall fn)))

(define-key prog-mode-map (kbd "C-c M-f") 'my-formatter)

(provide 'init-program)
