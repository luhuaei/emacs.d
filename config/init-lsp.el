(use-package lsp-mode
  :ensure t
  :diminish lsp-mode
  :hook (prog-mode . lsp-mode)
  :commands (lsp lsp-mode)
  :bind (:map lsp-mode-map
              ("C-c C-d" . lsp-describe-thing-at-point))
  :init
  (setq lsp-auto-guess-root t)		; Detect project root
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
    :init (setq lsp-ui-doc-enable t
		lsp-ui-doc-use-webkit nil
		lsp-ui-doc-delay 1.0
		lsp-ui-doc-include-signature t
		lsp-ui-doc-position 'top
		lsp-ui-doc-border (face-foreground 'default)

		lsp-ui-sideline-enable t
		lsp-ui-sideline-ignore-duplicate t)
    :config
    (add-to-list 'lsp-ui-doc-frame-parameters '(left-fringe . 0))

    ;; `C-g'to close doc
    (advice-add #'keyboard-quit :before #'lsp-ui-doc-hide)

    ;; WORKAROUND Hide mode-line of the lsp-ui-imenu buffer
    ;; @see https://github.com/emacs-lsp/lsp-ui/issues/243
    (defadvice lsp-ui-imenu (after hide-lsp-ui-imenu-mode-line activate)
      (setq mode-line-format nil)))

  (use-package company-lsp
    :ensure t
    :init (setq company-lsp-cache-candidates 'auto)
    :config
    (push 'company-lsp company-backends))

  ;; ms-python
  (use-package lsp-python-ms
    :ensure t
    :defer t
    :hook (pipenv-mode . (lambda ()
			   (pipenv-activate)
			   (require 'lsp-python-ms)
			   (lsp)))
    :config
    (setq lsp-python-ms-dir
	  (expand-file-name "~/emacs.d/lsp/python-language-server/output/bin/Release/"))
    (setq lsp-python-ms-executable
	  "~/emacs.d/lsp/python-language-server/output/bin/Release/linux-x64/publish/Microsoft.Python.LanguageServer"))

  ;; R
  (lsp-register-client
   (make-lsp-client :new-connection
		    (lsp-stdio-connection '("R" "--slave" "-e" "languageserver::run()"))
		    :major-modes '(ess-r-mode inferior-ess-r-mode)
		    :server-id 'lsp-R))
  (add-hook 'ess-r-mode-hook #'(lambda () (lsp-mode) (lsp) (flymake-mode 0))))


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
(defvar org-babel-lang-list
  '("python"))
(dolist (lang org-babel-lang-list)
  (eval `(lsp-org-babel-enbale ,lang)))


(provide 'init-lsp)
