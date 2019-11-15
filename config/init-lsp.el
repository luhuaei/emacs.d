(use-package lsp-mode
  :ensure t
  :diminish lsp-mode
  :commands (lsp lsp-mode)
  :bind (:map lsp-mode-map
              ("C-c C-d" . lsp-describe-thing-at-point))
  :init
  (setq lsp-auto-guess-root t)		; Detect project root
  (setq lsp-ui-flycheck-enable t)
  (setq lsp-prefer-flymake nil)		; Use lsp-ui and flycheck
  (setq flymake-fringe-indicator-position 'right-fringe)

  :config
  (use-package lsp-ui
    :ensure t
    :commands (lsp-ui-doc-hide)
    :custom-face (lsp-ui-doc-background ((t (:background ,(face-background 'tooltip)))))
    :hook (after-load-theme . (lambda ()
				(set-face-attribute 'lsp-ui-doc-background nil
						    :background (face-background 'tooltip))))
    :bind (:map lsp-ui-mode-map
		([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
		([remap xref-find-references] . lsp-ui-peek-find-references)
		("C-c u" . lsp-ui-imenu))
    :init (setq lsp-ui-doc-enable nil
		lsp-ui-doc-use-webkit nil
		lsp-ui-doc-delay 1
		lsp-ui-doc-include-signature t
		lsp-ui-doc-position 'top
		lsp-ui-doc-border (face-foreground 'default)

		lsp-ui-sideline-enable nil
		lsp-ui-sideline-ignore-duplicate nil
		lsp-ui-doc-max-height 30
		lsp-ui-doc-max-width 90)
    :config
    (add-to-list 'lsp-ui-doc-frame-parameters '(left-fringe . 0))

    ;; `C-g'to close doc
    (advice-add #'keyboard-quit :before #'lsp-ui-doc-hide)

    ;; WORKAROUND Hide mode-line of the lsp-ui-imenu buffer
    ;; @see https://github.com/emacs-lsp/lsp-ui/issues/243
    (defadvice lsp-ui-imenu (after hide-lsp-ui-imenu-mode-line activate)
      (setq mode-line-format nil)))

  ;; ms-python
  (use-package lsp-python-ms
    :ensure t
    :defer t
    :init (require 'lsp-python-ms)
    :hook (python-mode . (lambda () (lsp-mode) (lsp)))
    :config
    (setq lsp-python-ms-dir
	  (expand-file-name "~/emacs.d/lsp/python-language-server/output/bin/Release/"))
    (setq lsp-python-ms-executable
	  "~/emacs.d/lsp/python-language-server/output/bin/Release/linux-x64/publish/Microsoft.Python.LanguageServer"))

  ;; R
  (lsp-register-client
   (make-lsp-client :new-connection
		    (lsp-stdio-connection '("R" "--slave" "-e" "languageserver::run()"))
		    :major-modes '(ess-mode ess-r-mode)
		    :server-id 'lsp-R))

  ;; C/C++
  (use-package ccls
    :ensure t
    :hook ((c-mode . lsp-mode)
	   (c++-mode . lsp-mode))
    :config
    (setq ccls-executable "/usr/bin/ccls")
    (setq ccls-initialization-options '(:index (:comments 2) :completion (:detailedLabel t)))
    (setq lsp-ui-doc-include-signature nil)  ; don't include type signature in the child frame
    (setq lsp-ui-sideline-show-symbol nil)  ; don't show symbol on the right of info
    (setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)
    (setq ccls-sem-highlight-method 'font-lock)
    (ccls-use-default-rainbow-sem-highlight)

    ;; Alternatively, use lsp-ui-peek interface
    (lsp-ui-peek-find-custom "$ccls/call")
    (lsp-ui-peek-find-custom "$ccls/call" '(:callee t)))

  (use-package lsp-treemacs
    :ensure t
    :bind (:map lsp-mode-map
		("M-9" . lsp-treemacs-errors-list)))

  (use-package dap-mode
    :ensure t
    :diminish
    :functions dap-hydra/nil
    :bind (:map lsp-mode-map
		("<f5>" . dap-debug)
		("M-<f5>" . dap-hydra))
    :hook ((after-init . dap-mode)
           (dap-mode . dap-ui-mode)
           (dap-session-created . (lambda (&_rest) (dap-hydra)))
           (dap-terminated . (lambda (&_rest) (dap-hydra/nil)))

           (python-mode . (lambda () (require 'dap-python))))))



(cl-defmacro lsp-org-babel-enbale (lang)
  "Support LANG in org source code block."
  (cl-check-type lang stringp)
  (let* ((edit-pre (intern (format "org-babel-edit-prep:%s" lang)))
         (intern-pre (intern (format "lsp--%s" (symbol-name edit-pre)))))
    `(progn
       (defun ,intern-pre (info)
         (let ((filename (or (->> info caddr (alist-get :file))
			     buffer-file-name)))
           (setq buffer-file-name filename)
	   (lsp-mode
            (and (fboundp 'lsp)
                 ;; `lsp-auto-guess-root' MUST be non-nil.
                 (setq lsp-buffer-uri (lsp--path-to-uri filename))
		 (lsp)
		 (push 'company-lsp company-backends)))))
       (put ',intern-pre 'function-documentation
	    (format "Enable lsp in the buffer of org source block (%s)."  (upcase ,lang)))

       (if (fboundp ',edit-pre)
           (advice-add ',edit-pre :after ',intern-pre)
         (progn
           (defun ,edit-pre (info)
	     (,intern-pre info))
           (put ',edit-pre 'function-documentation
                (format "Prepare local buffer environment for org source block (%s)."
                        (upcase ,lang))))))))
;; (defvar org-babel-lang-list
;;   '("R"))
;; (dolist (lang org-babel-lang-list)
;;   (eval `(lsp-org-babel-enbale ,lang)))




(provide 'init-lsp)
