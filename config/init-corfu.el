(require 'orderless)

(setq completion-styles '(orderless basic)
      completion-category-overrides
      `((file (styles basic partial-completion))
	(eglot (styles ,@completion-styles))))

;; variables
(setq corfu-cycle t
      corfu-auto t
      corfu-quit-at-boundary t
      corfu-quit-no-match t
      corfu-preview-current t
      corfu-auto-prefix 1
      corfu-auto-delay 0.01
      completion-ignore-case t
      read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      corfu-doc-auto nil
     )


;; autoload
(setq corfu-enable-mode-hooks '(text-mode-hook conf-mode-hook prog-mode-hook))

(dolist (hook corfu-enable-mode-hooks)
  (add-hook hook 'corfu-mode))

(autoload 'corfu-mode "corfu" nil nil)
(autoload 'corfu-history-mode "corfu-history" nil nil)

;; hooks
(add-hook 'corfu-mode-hook (lambda ()
			     (electric-pair-mode t)
			     (electric-quote-mode t)
			     (corfu-history-mode t)))

;; corfu extensions
(with-eval-after-load 'corfu (progn
			       (unless (display-graphic-p)
				 (corfu-terminal-mode +1)
				 (corfu-doc-terminal-mode +1))
                               (require 'corfu-popupinfo)
			       (require 'corfu-info)
			       (require 'cape)
			       ))
;; cape
(with-eval-after-load 'cape (progn
			      (require 'cape-keyword)
			      (add-hook 'text-mode-hook (lambda ()
							  (setq-local completion-at-point-functions (list (cape-capf-super
													   #'cape-dabbrev
													   #'cape-dict)))))
			      (dolist (hook '(go-ts-mode-hook web-mode-hook typescript-ts-mode-hook emacs-lisp-mode-hook))
				(add-hook hook (lambda ()
						 (setq-local completion-at-point-functions
							     (list (cape-capf-super
								    #'cape-file
								    ;; #'cape-yasnippet
								    #'cape-keyword
								    #'cape-symbol))))))))
(provide 'init-corfu)
