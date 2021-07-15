;; -*- lexical-binding: t; -*-

(use-package spinner
  :quelpa (spinner :fetcher github :repo "Malabarba/spinner.el"))

(use-package lsp-mode
  :ensure nil
  :quelpa (lsp-mode :fetcher github :repo "emacs-lsp/lsp-mode" :files ("clients/*" "*.el"))
  :bind (:map lsp-mode-map
              ("C->" . 'lsp-find-implementation))
  :init
  (setq lsp-enable-completion-at-point t
        lsp-enable-xref t
        lsp-keep-workspace-alive t
        read-process-output-max (* 1024 1024)

        lsp-enable-text-document-color t
        )
  (setq lsp-diagnostics-provider :none

        lsp-auto-guess-root nil
        lsp-eldoc-enable-hover nil
        lsp-eldoc-render-all nil

        lsp-headerline-breadcrumb-enable nil
        lsp-signature-auto-activate nil

        lsp-modeline-diagnostics-enable nil
        lsp-modeline-workspace-status-enable nil
        lsp-modeline-code-actions-enable nil

        lsp-enable-snippet nil
        lsp-enable-indentation nil
        lsp-enable-dap-auto-configure nil
        lsp-enable-imenu nil
        lsp-enable-links nil
        lsp-enable-semantic-highlighting nil
        lsp-enable-on-type-formatting nil
        lsp-enable-file-watchers nil
        lsp-enable-folding nil
        lsp-enable-symbol-highlighting nil
        )

  (setq lsp-enable-folding t)
  (setq lsp-folding-range-limit 100)


  ;; rust
  (setq lsp-rust-server 'rust-analyzer
        lsp-rust-analyzer-proc-macro-enable t
        lsp-rust-all-features t)


  (dolist (hook (list
                 'rust-mode-hook
                 'c-mode-common-hook
                 'c-mode-hook
                 'c++-mode-hook
                 'go-mode-hook
                 'typescript-mode-hook
                 'julia-mode-hook
                 ))
    (add-hook hook 'lsp)))


(provide 'init-lsp)
