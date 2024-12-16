
(defun +evan/lsp-mode-setup-completion ()
  (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
        '(orderless)))

(defun +evan/orderless-dispatch-flex-first (_pattern index _total)
   (and (eq index 0) 'orderless-flex))

(dolist (hook (list
               'web-mode-hook
               'typescript-mode-hook
               'typescript-ts-mode-hook
               'typescript-tsx-mode-hook
               'go-ts-mode-hook
               'go-mode-hook
               'rust-ts-mode-hook
               'rust-mode-hook
               'js-mode-hook
               'js2-mode-hook
               'python-mode-hook
               'kotlin-mode-hook
               'dart-mode-hook))
  (add-hook hook 'lsp-deferred))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix ""
	lsp-headerline-breadcrumb-segments '(symbols))

  ;; feature enable
  (setq lsp-enable-links nil
	lsp-enable-indentation nil
	lsp-enable-on-type-formatting nil
	lsp-enable-relative-indentation nil
	lsp-headerline-breadcrumb-enable nil
	lsp-inlay-hint-enable nil
	lsp-log-io nil
	lsp-lens-enable nil)
  ;; lsp fancy features
  (setq
   ;; ui
   lsp-progress-via-spinner nil
   ;; completion
   lsp-completion-show-detail t
   lsp-completion-show-kind t
   lsp-completion-use-last-result t
   ;; headerline
   lsp-headerline-breadcrumb-enable-symbol-numbers t
   ;; signature
   lsp-signature-doc-lines 10
   )
  ;; lsp server config
  (setq tab-always-indent 'complete)
  (setq lsp-response-timeout 1)
  :custom
  (lsp-completion-provider :none)
  :hook (
         (prog-mode . lsp))
  :bind (:map lsp-mode-map
              ("M-." . 'xref-find-definitions)
              ("M-," . 'xref-pop-marker-stack)
              ("C->" . 'lsp-find-implementation)
              ("C-<" . 'lsp-find-references)
              ("M-/" . 'yas-expand)
              ("<f5>" . 'flycheck-list-errors))
  :commands lsp
  :config
  (add-hook 'orderless-style-dispatchers #'+evan/orderless-dispatch-flex-first nil 'local))


(provide 'init-lsp)
