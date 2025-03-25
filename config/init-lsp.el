
;;; Code:

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix ""
	lsp-headerline-breadcrumb-segments '(symbols))
  :hook (
         (web-mode . lsp)
         (typescript-mode . lsp)
         (typescript-ts-mode . lsp)
         (typescript-tsx-mode . lsp)
         (go-ts-mode . lsp)
         (go-mode . lsp)
         (rust-ts-mode . lsp)
         (rust-mode . lsp)
         (js-mode . lsp)
         (js2-mode . lsp)
         (python-mode . lsp)
         (kotlin-mode . lsp)
         (dart-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (add-hook 'lsp-mode 'flymake-mode-on)
  (setq-default lsp-diagnostics-provider :flymake)
  ;; feature enable
  (setq lsp-enable-links nil
	lsp-enable-indentation nil
	lsp-enable-on-tyxpe-formatting nil
	lsp-enable-relative-indentation nil
	lsp-headerline-breadcrumb-enable nil
        lsp-modeline-workspace-status-enable nil
        lsp-modeline-diagnostics-enable t
        lsp-modeline-code-actions-enable nil
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
  (setq lsp-disabled-clients '(tfls))
  :bind (:map lsp-mode-map
              ("M-." . 'xref-find-definitions)
              ("M-," . 'xref-pop-marker-stack)
              ("C->" . 'lsp-find-implementation)
              ("C-<" . 'lsp-find-references)
              ("M-/" . 'yas-expand)))

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

(provide 'init-lsp)
