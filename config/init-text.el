;; -*- lexical-binding: t; -*-

;; sql
(use-package sql-indent
  :defer t
  :hook (sql-mode . sqlind-minor-mode))

;; yyac
(use-package bison
  :diminish bison-mode
  :mode ("\\.\\(y\\)$" . bison-mode))

;; latex
;; (use-package tex
;;   :ensure auctex
;;   :mode ("\\.tex\\'" . LaTeX-mode)
;;   :hook (LaTeX-mode . (lambda()
;;                         (setq TeX-command-default "pdflatex")))
;;   :config
;;   (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
;;   (add-to-list 'TeX-view-program-list '("eaf" eaf-pdf-synctex-forward-view))
;;   (add-to-list 'TeX-view-program-selection '(output-pdf "eaf")))

;; org-mode
;; (use-package org
;;   :defer t
;;   :hook ((org-mode . org-indent-mode)
;; 	 (org-mode . flyspell-mode))
;;   :bind (("C-c c" . 'org-capture)
;; 	 ("C-c a" . 'org-agenda)
;; 	 :map org-mode-map
;; 	 ("C-c M-i" . 'interleave-mode)
;;          ("C-S-RET" . 'org-insert-subheading))
;;   :config
;;   (use-package ob-go
;;     :after (org))

;;   (use-package org-pomodoro
;;     :after (org))

;;   (defun my/org-ispell ()
;;     "Configure `ispell-skip-region-alist' for `org-mode'."
;;     (make-local-variable 'ispell-skip-region-alist)
;;     (add-to-list 'ispell-skip-region-alist '(org-property-drawer-re))
;;     (add-to-list 'ispell-skip-region-alist '("~" "~"))
;;     (add-to-list 'ispell-skip-region-alist '("=" "="))
;;     (add-to-list 'ispell-skip-region-alist '("^#\\+BEGIN_SRC" . "^#\\+END_SRC")))
;;   (add-hook 'org-mode-hook #'my/org-ispell)

;;   (org-babel-do-load-languages
;;    'org-babel-load-languages
;;    '(
;;      (python . t)
;;      (emacs-lisp . t)
;;      (lisp . t)
;;      (shell . t)
;;      (R . t)
;;      (C . t)
;;      (sql . t)
;;      (dot . t)
;;      (go . t)))

;;   ;; don't delete the fold content
;;   (setq org-catch-invisible-edits 'error)
;;   ;; don't prompt me to confirm everytime I want to evaluate a block
;;   (setq org-confirm-babel-evaluate nil)
;;   ;; display/update images in the buffer after I evaluate
;;   (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
;;   (setq org-export-babel-evaluate nil)	;don't evaluate during exports
;;   (setq org-src-window-setup 'current-window)
;;   (setq org-log-done 'time)

;;   ;; org todo template
;;   (setq org-todo-keywords
;; 	'((sequence "TODO" "DOING" "DONE")
;; 	  (sequence "REPORT" "BUG" "KNOWNCAUSE" "|" "FIXED")
;; 	  (sequence "|" "CANCELED")))
;;   (setq org-default-notes-file (concat emacs-org-dir "GTD.org"))
;;   (setq org-capture-templates
;; 	`(("t" "Todo" entry (file ,(concat emacs-org-dir "GTD.org"))
;; 	  "* TODO %?\n%U\n%^G" :empty-lines 1)
;; 	 ("z" "Zongjie" entry (file ,(concat emacs-org-dir "Zongjie.org"))
;; 	  "* %U\n\n%?" :empty-lines 1)))
;;   (setq org-agenda-files (list emacs-org-dir)))

;; protobuf
(use-package protobuf-mode
  :defer t
  :load-path emacs-extension-dir
  :mode "\\.proto$"
  :config
  (defconst my-protobuf-style
    '((c-basic-offset . 2)
      (indent-tabs-mode . nil)))

  (add-hook 'protobuf-mode-hook
            (lambda () (c-add-style "my-style" my-protobuf-style t))))

(use-package markdown-mode
  :defer t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :bind (:map markdown-mode-map ("`" . markdown-insert-code))
  :init (setq markdown-command "multimarkdown")
  :config
  (require 'valign)
  (add-hook 'markdown-mode-hook #'valign-mode)
  (setq markdown-gfm-use-electric-backquote nil))

(provide 'init-text)
